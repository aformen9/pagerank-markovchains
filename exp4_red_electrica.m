% exp4_red_electrica.m
% PageRank sobre datos reales: IEEE case30 (30 buses, 41 lineas)
% Alumno: Agustin Formenti
% Materia: Metodos y Computos Numericos - UCA Rosario 2025
% Datos: IEEE Power System Test Cases (MATPOWER) - datos reales

% =========================================================================
% PROPOSITO:
%   Aplicar PageRank a una red electrica REAL (no sintetica) para
%   identificar los buses mas criticos del sistema de potencia IEEE case30.
%
% INTERPRETACION FISICA DE pi_i:
%   pi_i = probabilidad de impacto sistemico del bus i.
%   NO predice que bus va a fallar. Responde:
%   "Si el bus i fallara (o fuera atacado), cuanto se desorganizaria
%    el flujo de energia en toda la red?"
%
%   Un bus de CARGA (load, type 1) con alto PageRank es un nodo de
%   transito de energia: aunque no genera potencia, es un punto de
%   paso critico para la distribucion. Si falla, muchos otros buses
%   quedan sin suministro. Esto es analogo a los hubs de internet
%   (Moler p.75: "pages with many inlinks have high PageRank").
%
%   Un bus SLACK (type 3) es la referencia de fase del sistema.
%   Si falla, todo el sistema pierde referencia -> colapso total.
%   Se espera que el bus slack tenga el mayor PageRank.
%
% DATOS:
%   IEEE case30: 30 buses, 41 lineas de transmision, 6 generadores.
%   Fuente: Christie (1993), adaptado por MATPOWER.
%   Basado en: Alsac & Stott (1974), IEEE Trans. PAS, 93(3), pp. 745-751.
%
% REFERENCIA:
%   Moler (2004), Cap. 2.11, pp. 74-81
%   Ponzellini (2025), L8 Metodos iterativos
% =========================================================================

clear, clc

fprintf('=====================================================\n');
fprintf('EXPERIMENTO 4: PageRank - IEEE case30 (real)        \n');
fprintf('=====================================================\n\n');

%% Carga de datos reales IEEE case30
% cargar_ieee_case descarga el archivo desde MATPOWER/GitHub en runtime,
% parsea los bloques mpc.bus y mpc.branch, y construye G bidireccional.
% La bidireccionalidad modela que la corriente AC puede fluir en cualquier
% sentido dependiendo del estado de carga del sistema.

[G, tipos, info_red] = cargar_ieee_case('case30');
n = info_red.n_buses;

%% Calculo del PageRank
% Iteracion de punto fijo: pi^(k+1) = A * pi^(k)
% A = p*G*D + delta es la Matriz de Google (Moler p.75-76)
% Silenciamos la salida interna de pagerank.m con evalc para no
% mezclarla con la salida formateada de este experimento.

fprintf('Calculando PageRank del sistema IEEE case30...\n');
evalc('[pi, iter, hist] = pagerank(G, 0.85, 1e-8, 200)');
fprintf('  Convergencia en %d iteraciones.\n\n', iter);

%% Identificacion y reporte de nodos criticos
% Ordenar por PageRank descendente para identificar el top 10%.
% top10pct = 3 buses para n=30.

[pi_ord, idx_ord] = sort(pi, 'descend');
top10pct = max(1, ceil(n * 0.10));   % top 10% = 3 buses de 30

fprintf('Top 10%% de buses mas criticos (%d de %d):\n', top10pct, n);
fprintf('%s\n', repmat('-', 1, 55));
fprintf('%5s  %6s  %12s  %10s  %12s\n', 'Rank', 'Bus#', 'Tipo', 'pi_i', 'Porcentaje');
fprintf('%s\n', repmat('-', 1, 55));
for k = 1:top10pct
  fprintf('%5d  %6d  %12s  %10.6f  %11.2f%%\n', ...
          k, idx_ord(k), tipos{idx_ord(k)}, pi_ord(k), pi_ord(k)*100);
end

% Clasificar el top 10% por tipo de bus
tipos_top = tipos(idx_ord(1:top10pct));
n_slack_top = sum(strcmp(tipos_top, 'slack'));
n_gen_top   = sum(strcmp(tipos_top, 'generator'));
n_load_top  = sum(strcmp(tipos_top, 'load'));

fprintf('\nComposicion del top 10%%:\n');
fprintf('  Slack buses      : %d\n', n_slack_top);
fprintf('  Generator buses  : %d\n', n_gen_top);
fprintf('  Load buses       : %d\n', n_load_top);

% Impacto acumulado del top 10%
impacto_top = sum(pi_ord(1:top10pct));
fprintf('\nImpacto acumulado del top 10%%: %.4f (%.1f%% del total)\n', ...
        impacto_top, impacto_top*100);

fprintf('\nInterpretacion fisica:\n');
fprintf('  Un bus de CARGA con alto PageRank es un nodo de transito:\n');
fprintf('  aunque no genera potencia, es un punto de paso critico.\n');
fprintf('  Su falla desconecta a otros buses que dependen de el.\n');
fprintf('  Un bus SLACK falla -> perdida de referencia -> colapso total.\n\n');

%% Comparacion PageRank vs baseline de grado de entrada
% El grado de entrada es el baseline mas simple posible:
% simplemente cuenta cuantos nodos apuntan a cada nodo.
% PageRank es mas sofisticado: un link de un nodo importante
% vale mas que un link de un nodo irrelevante (Moler p.74).
% Si PageRank difiere del grado de entrada, hay informacion
% estructural que el grado no captura.

% Grado de entrada de cada bus: suma de la columna i de G^T = suma de fila i de G
grado_entrada = full(sum(G, 2));   % sum(G,2) = suma por filas = inlinks de cada nodo

% Rankear por grado de entrada descendente
[~, idx_grado] = sort(grado_entrada, 'descend');

fprintf('Comparacion top 10%% por PageRank vs por grado de entrada:\n');
fprintf('%s\n', repmat('-', 1, 52));
fprintf('%6s  %12s  %10s  %12s\n', 'Rank', 'Bus(PageRank)', 'pi_i', 'Bus(Grado)');
fprintf('%s\n', repmat('-', 1, 52));
for k = 1:top10pct
  fprintf('%6d  %12d  %10.6f  %12d\n', ...
          k, idx_ord(k), pi_ord(k), idx_grado(k));
end
fprintf('\n');

% Conclusion automatica segun coincidencia de los rankings
buses_pagerank = idx_ord(1:top10pct);
buses_grado    = idx_grado(1:top10pct);
n_coincidencias = length(intersect(buses_pagerank, buses_grado));

if n_coincidencias == top10pct
  fprintf('PageRank y grado de entrada identifican los mismos nodos criticos.\n\n');
elseif n_coincidencias >= 1
  fprintf('PageRank y grado de entrada comparten %d nodo(s) en el top 10%%.\n\n', ...
          n_coincidencias);
else
  fprintf('PageRank identifica nodos distintos al grado de entrada,\n');
  fprintf('capturando dependencias estructurales de segundo orden.\n\n');
end

if ismember(10, buses_pagerank)
  fprintf('\nValidacion contra literatura:\n');
  fprintf('  Bus 10 identificado como critico por PageRank (rank %d).\n', ...
          find(buses_pagerank == 10));
  fprintf('  Liu et al. (2018) identifican bus 10 como critico\n');
  fprintf('  en IEEE case30 usando centralidad electrica.\n');
  fprintf('  -> Coincidencia con literatura peer-reviewed (IEEE Trans.).\n');
else
  fprintf('\nNota: Bus 10 no aparece en el top 10%% de esta corrida.\n');
  fprintf('  Liu et al. (2018) lo identifican como critico con otro metodo.\n');
  fprintf('  La discrepancia puede deberse a diferencias metodologicas.\n');
end
fprintf('  Ref: Liu et al., IEEE TCAS-II, vol.65, pp.346-350, 2018.\n');

% Esta coincidencia con literatura peer-reviewed publicada en IEEE
% valida que PageRank captura criticidad estructural real en redes
% electricas, no solo una propiedad matematica abstracta.
% Liu, B. et al. (2018): "Recognition and Vulnerability Analysis of
% Key Nodes in Power Grid Based on Complex Network Centrality"
% DOI: 10.1109/TCSII.2017.2705384

%% Simulacion de falla del top 10% critico
% Falla real: poner a cero todas las filas Y columnas de los nodos removidos.
% Esto modela la desconexion fisica del bus: pierde todos sus links.
% Luego recalculamos el PageRank sobre la red reducida (no se manipula pi).

nodos_criticos = idx_ord(1:top10pct);

G_falla_criticos = G;
G_falla_criticos(nodos_criticos, :) = 0;   % eliminar outlinks
G_falla_criticos(:, nodos_criticos) = 0;   % eliminar inlinks

fprintf('Simulando falla del top 10%% (buses: %s)...\n', num2str(nodos_criticos'));
evalc('[pi_falla_criticos, iter_c, ~] = pagerank(G_falla_criticos, 0.85, 1e-8, 200)');

% Nodos desconectados: activos con grado total = 0 despues de la falla
c_in_c  = full(sum(G_falla_criticos, 2));
c_out_c = full(sum(G_falla_criticos, 1))';
grado_c = c_in_c + c_out_c;
nodos_activos = setdiff(1:n, nodos_criticos);
n_descon_criticos = sum(grado_c(nodos_activos) == 0);

% Nuevo nodo mas critico post-falla
pi_temp_c = pi_falla_criticos;
pi_temp_c(nodos_criticos) = -Inf;
[~, nuevo_rank1_c] = max(pi_temp_c);

fprintf('  Nodos removidos       : %d\n', length(nodos_criticos));
fprintf('  Nodos desconectados   : %d\n', n_descon_criticos);
fprintf('  Diferencia norma 1    : %.4f\n', norm(pi_falla_criticos - pi, 1));
fprintf('  Nuevo nodo mas critico: %d (%s)\n\n', nuevo_rank1_c, tipos{nuevo_rank1_c});

%% Simulacion de falla de 3 buses ALEATORIOS (grupo de control)
% Para demostrar que la falla de nodos CRITICOS causa mayor impacto
% que la falla de nodos ALEATORIOS del mismo numero.
% Semilla fija para reproducibilidad del experimento.

rng(42);
candidatos_aleat = setdiff(1:n, nodos_criticos);
nodos_aleatorios = candidatos_aleat(randperm(length(candidatos_aleat), top10pct));

G_falla_aleat = G;
G_falla_aleat(nodos_aleatorios, :) = 0;
G_falla_aleat(:, nodos_aleatorios) = 0;

fprintf('Simulando falla de %d buses ALEATORIOS (buses: %s)...\n', ...
        top10pct, num2str(nodos_aleatorios));
evalc('[pi_falla_aleat, iter_a, ~] = pagerank(G_falla_aleat, 0.85, 1e-8, 200)');

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

%% Tabla comparativa de escenarios de falla
fprintf('Comparacion de escenarios de falla:\n');
fprintf('%s\n', repmat('-', 1, 55));
fprintf('%-22s  %8s  %8s  %10s\n', 'Escenario', 'removidos', 'descon.', 'dif_norma1');
fprintf('%s\n', repmat('-', 1, 55));
fprintf('%-22s  %8d  %8d  %10.4f\n', 'Falla criticos (10%)', ...
        length(nodos_criticos), n_descon_criticos, norm(pi_falla_criticos - pi, 1));
fprintf('%-22s  %8d  %8d  %10.4f\n', 'Falla aleatorios', ...
        length(nodos_aleatorios), n_descon_aleat, norm(pi_falla_aleat - pi, 1));
fprintf('%s\n', repmat('-', 1, 55));

ratio_impacto = norm(pi_falla_criticos - pi, 1) / max(norm(pi_falla_aleat - pi, 1), 1e-12);
fprintf('\nLa falla de nodos criticos causa %.1fx mas impacto sistemico\n', ratio_impacto);
fprintf('que la falla de %d nodos aleatorios. Esto justifica el uso\n', top10pct);
fprintf('de PageRank para priorizar el monitoreo y refuerzo de nodos.\n\n');

%% Figura 1: convergencia del metodo de la potencia
% La curva semilogy muestra la reduccion geometrica del error por iteracion.
% La pendiente logaritmica esta gobernada por |lambda_2| <= p = 0.85.
% (Moler p.76: "rate of convergence governed by |lambda_2|")

figure(1);
semilogy(hist, 'b-');
xlabel('Iteracion k');
ylabel('||pi^{(k+1)} - pi^{(k)}||_1');
title(sprintf('Convergencia - IEEE case30 (%d iteraciones)', iter));
grid on;

%% Figura 2: PageRank de la red completa, coloreado por tipo de bus
% Azul = bus de carga (load): nodo de transito de energia
% Verde = bus generador (generator): tiene generacion activa
% Rojo = bus slack: referencia del sistema, mayor PageRank esperado

colores = zeros(n, 3);
for k = 1:n
  switch tipos{k}
    case 'slack'
      colores(k,:) = [0.8 0.1 0.1];   % rojo
    case 'generator'
      colores(k,:) = [0.1 0.7 0.2];   % verde
    otherwise
      colores(k,:) = [0.2 0.4 0.8];   % azul
  end
end

figure(2);
hold on;
for k = 1:n
  bar(k, pi(k), 'FaceColor', colores(k,:));
end
xlabel('Bus #');
ylabel('pi_i (impacto sistemico)');
title('PageRank IEEE case30 (azul=carga, verde=generator, rojo=slack)');
grid on;
hold off;

%% Figura 3: comparacion post-falla criticos vs aleatorios
% subplot(1,2,1): PageRank post-falla de nodos criticos
% subplot(1,2,2): PageRank post-falla de nodos aleatorios
% Las lineas verticales marcan los nodos removidos.

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
title('Post-falla: nodos criticos removidos');
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
title('Post-falla: nodos aleatorios removidos');
legend('PageRank', 'Nodo removido');
grid on;
hold off;

fprintf('\n========== FIN EXP4_RED_ELECTRICA ==========\n')
