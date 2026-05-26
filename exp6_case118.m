% exp6_case118.m
% PageRank aplicado al IEEE 118-bus test case
% Alumno: Agustin Formenti
% Materia: Metodos y Computos Numericos - UCA Rosario 2025
% Datos: IEEE 118-Bus Test Case via MATPOWER

% =========================================================================
% PROPOSITO:
%   Aplicar PageRank al IEEE case118 (118 buses, 186 lineas).
%   Es la red de referencia estandar para estudios de vulnerabilidad
%   en sistemas de potencia de tamano mediano.
%
% RELEVANCIA DEL CASO 118:
%   El IEEE 118-bus es significativamente mas grande que case30/case57
%   y permite observar fenomenos que no aparecen en redes chicas:
%   - Mayor separacion entre ranking PageRank y ranking por grado de entrada
%   - Buses de carga (load) con alta criticidad sistémica por ser nexos
%     de transito entre subsistemas de generacion y consumo
%   - Impacto mas pronunciado de la falla de nodos criticos vs aleatorios
%
% INTERPRETACION DE pi_i:
%   pi_i = probabilidad de impacto sistemico del bus i.
%   NO predice que bus va a fallar. Responde:
%   "Si el bus i fallara, cuanto se desorganizaria el flujo de energia?"
%   (Moler p.74: "the importance of a web page is related to the
%    importance of the pages that link to it")
%
% DATOS:
%   IEEE case118: 118 buses, 186 lineas, 54 generadores, 1 slack bus.
%   Fuente: Christie (1993), basado en datos de American Electric Power.
%   Disponible via MATPOWER: https://github.com/MATPOWER/matpower
%
% REFERENCIA:
%   Moler (2004), Cap. 2.11, pp. 74-81
%   Christie, R. (1993). Power Systems Test Case Archive. U. Washington.
% =========================================================================

clear, clc

fprintf('=====================================================\n');
fprintf('EXPERIMENTO 6: PageRank - IEEE case118 (real)       \n');
fprintf('=====================================================\n\n');

%% Carga de datos reales IEEE case118
% cargar_ieee_case descarga el archivo desde MATPOWER/GitHub en runtime,
% parsea mpc.bus (tipo de cada bus) y mpc.branch (conexiones),
% y construye G bidireccional (fbus->tbus y tbus->fbus).
% La bidireccionalidad es correcta para redes AC: la corriente puede
% fluir en cualquier sentido segun el despacho del sistema.

[G, tipos, info] = cargar_ieee_case('case118');
n = info.n_buses;   % n = 118

%% Calculo del PageRank
% Iteracion de punto fijo: pi^(k+1) = A * pi^(k)
% donde A = p*G*D + delta es la Matriz de Google (Moler p.75-76).
% Usamos evalc para silenciar la salida interna de pagerank.m.

fprintf('Calculando PageRank del sistema IEEE case118...\n');
evalc('[pi, iter, hist] = pagerank(G, 0.85, 1e-8, 200)');
fprintf('  Convergencia en %d iteraciones.\n\n', iter);

%% Identificacion de nodos criticos: top 5%
% Para n=118, top 5% = ceil(118*0.05) = 6 buses.
% Tabla: Rank | Bus# | Tipo | pi_i | Porcentaje

[pi_ord, idx_ord] = sort(pi, 'descend');
top5pct = max(1, ceil(n * 0.05));   % top 5% = 6 buses de 118

fprintf('Top 5%% de buses mas criticos (%d de %d):\n', top5pct, n);
fprintf('%s\n', repmat('-', 1, 57));
fprintf('%5s  %6s  %12s  %10s  %12s\n', 'Rank', 'Bus#', 'Tipo', 'pi_i', 'Porcentaje');
fprintf('%s\n', repmat('-', 1, 57));
for k = 1:top5pct
  fprintf('%5d  %6d  %12s  %10.6f  %11.2f%%\n', ...
          k, idx_ord(k), tipos{idx_ord(k)}, pi_ord(k), pi_ord(k)*100);
end

% Composicion del top 5% por tipo de bus
tipos_top = tipos(idx_ord(1:top5pct));
n_slack_top = sum(strcmp(tipos_top, 'slack'));
n_gen_top   = sum(strcmp(tipos_top, 'generator'));
n_load_top  = sum(strcmp(tipos_top, 'load'));

fprintf('\nComposicion del top 5%%:\n');
fprintf('  Slack buses      : %d\n', n_slack_top);
fprintf('  Generator buses  : %d\n', n_gen_top);
fprintf('  Load buses       : %d\n', n_load_top);

impacto_top = sum(pi_ord(1:top5pct));
fprintf('\nImpacto acumulado del top 5%%: %.4f (%.1f%% del total)\n\n', ...
        impacto_top, impacto_top*100);

%% Comparacion PageRank vs baseline de grado de entrada
% El grado de entrada es el baseline mas simple posible:
% simplemente cuenta cuantos nodos apuntan a cada nodo.
% PageRank es mas sofisticado: un link de un nodo importante
% vale mas que un link de un nodo irrelevante (Moler p.74).
% En redes mas grandes y dispersas como case118, es mas probable
% que PageRank y grado de entrada identifiquen nodos distintos,
% porque las dependencias de segundo y tercer orden tienen mas peso.

grado_entrada = full(sum(G, 2));   % sum(G,2) = inlinks de cada nodo

[~, idx_grado] = sort(grado_entrada, 'descend');

fprintf('Comparacion top 5%% por PageRank vs por grado de entrada:\n');
fprintf('%s\n', repmat('-', 1, 52));
fprintf('%6s  %12s  %10s  %12s\n', 'Rank', 'Bus(PageRank)', 'pi_i', 'Bus(Grado)');
fprintf('%s\n', repmat('-', 1, 52));
for k = 1:top5pct
  fprintf('%6d  %12d  %10.6f  %12d\n', ...
          k, idx_ord(k), pi_ord(k), idx_grado(k));
end
fprintf('\n');

% Conclusion automatica segun coincidencia de los rankings
buses_pagerank = idx_ord(1:top5pct);
buses_grado    = idx_grado(1:top5pct);
n_coincidencias = length(intersect(buses_pagerank, buses_grado));

if n_coincidencias == top5pct
  fprintf('PageRank y grado de entrada identifican los mismos nodos criticos.\n\n');
elseif n_coincidencias >= 1
  fprintf('PageRank y grado de entrada comparten %d nodo(s) en el top 5%%.\n', ...
          n_coincidencias);
  fprintf('Los %d nodos restantes difieren: PageRank captura dependencias\n', ...
          top5pct - n_coincidencias);
  fprintf('estructurales de segundo orden que el grado no detecta.\n\n');
else
  fprintf('PageRank identifica nodos completamente distintos al grado de entrada.\n');
  fprintf('En case118, la estructura topologica produce dependencias de largo\n');
  fprintf('alcance que el grado de entrada no captura (Moler p.74).\n\n');
end

%% Validacion dinamica contra literatura
% Los buses 26, 49, 54, 69 son identificados como criticos en case118
% por analisis de betweenness centrality en literatura de vulnerabilidad
% de redes electricas. Si PageRank coincide con alguno de ellos,
% valida que nuestro metodo captura criticidad estructural real.
%
% Referencia: identificacion basada en analisis de centralidad en
% IEEE 118-bus, literatura de vulnerabilidad de redes electricas.

buses_literatura = [26, 49, 54, 69];

fprintf('Validacion contra literatura (buses criticos reportados: %s):\n', ...
        num2str(buses_literatura));
fprintf('%s\n', repmat('-', 1, 50));

n_validados = 0;
for b = buses_literatura
  if ismember(b, buses_pagerank)
    rank_b = find(buses_pagerank == b);
    fprintf('  Bus %3d: ENCONTRADO en top 5%% de PageRank (rank %d). [OK]\n', b, rank_b);
    n_validados = n_validados + 1;
  else
    fprintf('  Bus %3d: no aparece en top 5%% de PageRank.\n', b);
  end
end

fprintf('\n');
if n_validados == length(buses_literatura)
  fprintf('  -> PageRank reproduce todos los nodos criticos de la literatura.\n');
elseif n_validados > 0
  fprintf('  -> PageRank coincide con %d de %d nodos de la literatura.\n', ...
          n_validados, length(buses_literatura));
  fprintf('     Las diferencias reflejan distintas definiciones de criticidad\n');
  fprintf('     (betweenness centrality vs impacto sistemico por Markov).\n');
else
  fprintf('  -> Sin coincidencias directas con la literatura en el top 5%%.\n');
  fprintf('     PageRank y betweenness centrality miden aspectos distintos\n');
  fprintf('     de la criticidad estructural (flujo de informacion vs caminos).\n');
end
fprintf('  Ref: identificacion basada en analisis de centralidad en IEEE 118-bus,\n');
fprintf('       literatura de vulnerabilidad de redes electricas.\n\n');

%% Simulacion de falla: top 5% criticos vs 6 buses aleatorios
% Falla real: poner a cero filas Y columnas -> recalcular PageRank.
% No se manipula el vector pi: es un recalculo completo sobre G reducida.
% Comparamos contra falla aleatoria del mismo numero de buses para
% demostrar que identificar los nodos criticos con PageRank importa.

nodos_criticos = buses_pagerank;   % los 6 buses del top 5%

G_falla_criticos = G;
G_falla_criticos(nodos_criticos, :) = 0;   % eliminar outlinks
G_falla_criticos(:, nodos_criticos) = 0;   % eliminar inlinks

fprintf('Simulando falla del top 5%% (buses: %s)...\n', num2str(nodos_criticos'));
evalc('[pi_falla_criticos, ~, ~] = pagerank(G_falla_criticos, 0.85, 1e-8, 200)');

c_in_c  = full(sum(G_falla_criticos, 2));
c_out_c = full(sum(G_falla_criticos, 1))';
grado_c = c_in_c + c_out_c;
nodos_activos_c = setdiff(1:n, nodos_criticos);
n_descon_criticos = sum(grado_c(nodos_activos_c) == 0);

pi_temp_c = pi_falla_criticos;
pi_temp_c(nodos_criticos) = -Inf;
[~, nuevo_rank1_c] = max(pi_temp_c);

fprintf('  Nodos removidos       : %d\n', length(nodos_criticos));
fprintf('  Nodos desconectados   : %d\n', n_descon_criticos);
fprintf('  Diferencia norma 1    : %.4f\n', norm(pi_falla_criticos - pi, 1));
fprintf('  Nuevo nodo mas critico: %d (%s)\n\n', nuevo_rank1_c, tipos{nuevo_rank1_c});

% Falla de 6 buses aleatorios (semilla fija para reproducibilidad)
rng(42);
candidatos_aleat = setdiff(1:n, nodos_criticos);
nodos_aleatorios = candidatos_aleat(randperm(length(candidatos_aleat), top5pct));

G_falla_aleat = G;
G_falla_aleat(nodos_aleatorios, :) = 0;
G_falla_aleat(:, nodos_aleatorios) = 0;

fprintf('Simulando falla de %d buses ALEATORIOS (buses: %s)...\n', ...
        top5pct, num2str(nodos_aleatorios));
evalc('[pi_falla_aleat, ~, ~] = pagerank(G_falla_aleat, 0.85, 1e-8, 200)');

c_in_a  = full(sum(G_falla_aleat, 2));
c_out_a = full(sum(G_falla_aleat, 1))';
grado_a = c_in_a + c_out_a;
nodos_activos_a = setdiff(1:n, nodos_aleatorios);
n_descon_aleat = sum(grado_a(nodos_activos_a) == 0);

pi_temp_a = pi_falla_aleat;
pi_temp_a(nodos_aleatorios) = -Inf;
[~, nuevo_rank1_a] = max(pi_temp_a);

fprintf('  Nodos removidos       : %d\n', length(nodos_aleatorios));
fprintf('  Nodos desconectados   : %d\n', n_descon_aleat);
fprintf('  Diferencia norma 1    : %.4f\n', norm(pi_falla_aleat - pi, 1));
fprintf('  Nuevo nodo mas critico: %d (%s)\n\n', nuevo_rank1_a, tipos{nuevo_rank1_a});

% Tabla comparativa de escenarios de falla
fprintf('Comparacion de escenarios de falla:\n');
fprintf('%s\n', repmat('-', 1, 55));
fprintf('%-22s  %8s  %8s  %10s\n', 'Escenario', 'removidos', 'descon.', 'dif_norma1');
fprintf('%s\n', repmat('-', 1, 55));
fprintf('%-22s  %8d  %8d  %10.4f\n', 'Falla criticos (5%)', ...
        length(nodos_criticos), n_descon_criticos, norm(pi_falla_criticos - pi, 1));
fprintf('%-22s  %8d  %8d  %10.4f\n', 'Falla aleatorios', ...
        length(nodos_aleatorios), n_descon_aleat, norm(pi_falla_aleat - pi, 1));
fprintf('%s\n', repmat('-', 1, 55));

ratio_impacto = norm(pi_falla_criticos - pi, 1) / max(norm(pi_falla_aleat - pi, 1), 1e-12);
fprintf('\nLa falla de nodos criticos causa %.1fx mas impacto sistemico\n', ratio_impacto);
fprintf('que la falla de %d nodos aleatorios.\n\n', top5pct);

%% Figura 1: convergencia del metodo de la potencia
% La reduccion geometrica del error confirma que la iteracion de punto fijo
% converge con razon |lambda_2| <= p = 0.85 (Moler p.76).

figure(1);
semilogy(hist, 'b-');
xlabel('Iteracion k');
ylabel('||pi^{(k+1)} - pi^{(k)}||_1');
title(sprintf('Convergencia - IEEE case118 (%d iteraciones)', iter));
grid on;

%% Figura 2: PageRank coloreado por tipo de bus
% Azul = load, verde = generator, rojo = slack.
% En case118 la mayoria son buses de carga (load).

colores = zeros(n, 3);
for k = 1:n
  switch tipos{k}
    case 'slack'
      colores(k,:) = [0.8 0.1 0.1];
    case 'generator'
      colores(k,:) = [0.1 0.7 0.2];
    otherwise
      colores(k,:) = [0.2 0.4 0.8];
  end
end

figure(2);
hold on;
for k = 1:n
  bar(k, pi(k), 'FaceColor', colores(k,:));
end
xlabel('Bus #');
ylabel('pi_i (impacto sistemico)');
title('PageRank IEEE case118 (azul=carga, verde=generator, rojo=slack)');
grid on;
hold off;

%% Figura 3: comparacion post-falla criticos vs aleatorios
% subplot(1,2,1): post-falla nodos criticos
% subplot(1,2,2): post-falla nodos aleatorios
% Las lineas verticales rojas marcan los buses removidos en cada escenario.

figure(3);

subplot(1,2,1);
hold on;
bar(1:n, pi_falla_criticos, 'FaceColor', [0.2 0.4 0.8]);
ylims = ylim;
for j = nodos_criticos
  plot([j j], [0 ylims(2)], 'r--');
end
xlabel('Bus #');
ylabel('pi_i');
title('case118: post-falla nodos criticos');
legend('PageRank', 'Nodo removido');
grid on;
hold off;

subplot(1,2,2);
hold on;
bar(1:n, pi_falla_aleat, 'FaceColor', [0.2 0.7 0.3]);
ylims = ylim;
for j = nodos_aleatorios
  plot([j j], [0 ylims(2)], 'r--');
end
xlabel('Bus #');
ylabel('pi_i');
title('case118: post-falla nodos aleatorios');
legend('PageRank', 'Nodo removido');
grid on;
hold off;

fprintf('\n========== FIN EXP6_CASE118 ==========\n')
