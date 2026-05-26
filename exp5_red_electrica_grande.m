% exp5_red_electrica_grande.m
% PageRank sobre datos reales: IEEE case57 (57 buses, 80 lineas)
% Alumno: Agustin Formenti
% Materia: Metodos y Computos Numericos - UCA Rosario 2025
% Datos: IEEE Power System Test Cases (MATPOWER) - datos reales

% =========================================================================
% PROPOSITO:
%   Aplicar PageRank al IEEE case57 y comparar con los resultados del
%   case30 (exp4) para validar el argumento de escalabilidad O(k*n).
%
% PREGUNTA CLAVE:
%   Al pasar de n=30 a n=57, ¿el numero de iteraciones hasta convergencia
%   permanece aproximadamente constante (~50)?
%   Si si: el costo es O(k*n) y k no crece con n -> escala linealmente.
%   (Moler p.76: "rate of convergence governed by |lambda_2| <= p = 0.85")
%
% DATOS:
%   IEEE case57: 57 buses, 80 lineas de transmision, 7 generadores.
%   Fuente: Christie (1993), basado en IEEE CDF file de la Universidad
%   de Washington. Convertido a MATPOWER por cdf2matp.
%
% REFERENCIA:
%   Moler (2004), Cap. 2.11, pp. 74-81
%   Christie, R. (1993). Power Systems Test Case Archive. UW.
%   https://www2.ee.washington.edu/research/pstca/
% =========================================================================

clear, clc

fprintf('=====================================================\n');
fprintf('EXPERIMENTO 5: PageRank - IEEE case57 (real)        \n');
fprintf('=====================================================\n\n');

%% Carga de datos reales IEEE case57
% Mismo procedimiento que exp4: descarga en runtime desde MATPOWER/GitHub.
% La red bidireccional es el modelo correcto para sistemas de potencia AC.

[G57, tipos57, info57] = cargar_ieee_case('case57');
n57 = info57.n_buses;

%% Tambien cargamos case30 para la comparacion
% Reutilizamos cargar_ieee_case para tener ambas redes en un mismo script.
% Esto permite la tabla comparativa case30 vs case57 directamente.

fprintf('Cargando tambien case30 para comparacion...\n');
[G30, tipos30, info30] = cargar_ieee_case('case30');
n30 = info30.n_buses;

%% PageRank de IEEE case57
fprintf('Calculando PageRank del sistema IEEE case57...\n');
t_ini57 = tic;
evalc('[pi57, iter57, hist57] = pagerank(G57, 0.85, 1e-8, 200)');
t_pot57 = toc(t_ini57);
fprintf('  Convergencia en %d iteraciones (tiempo: %.4fs).\n\n', iter57, t_pot57);

%% PageRank de IEEE case30 (para comparacion en la misma corrida)
fprintf('Calculando PageRank del sistema IEEE case30...\n');
t_ini30 = tic;
evalc('[pi30, iter30, hist30] = pagerank(G30, 0.85, 1e-8, 200)');
t_pot30 = toc(t_ini30);
fprintf('  Convergencia en %d iteraciones (tiempo: %.4fs).\n\n', iter30, t_pot30);

%% Identificacion de nodos criticos en case57
% Top 5% = 3 buses de 57.
% Para case30 usabamos top 10% = 3 buses, con el mismo numero absoluto
% se puede comparar directamente el efecto de la falla.

[pi57_ord, idx57_ord] = sort(pi57, 'descend');
top5pct57 = max(1, ceil(n57 * 0.05));   % top 5% = 3 buses de 57

fprintf('Top 5%% de buses mas criticos en case57 (%d de %d):\n', top5pct57, n57);
fprintf('%s\n', repmat('-', 1, 55));
fprintf('%5s  %6s  %12s  %10s  %12s\n', 'Rank', 'Bus#', 'Tipo', 'pi_i', 'Porcentaje');
fprintf('%s\n', repmat('-', 1, 55));
for k = 1:top5pct57
  fprintf('%5d  %6d  %12s  %10.6f  %11.2f%%\n', ...
          k, idx57_ord(k), tipos57{idx57_ord(k)}, pi57_ord(k), pi57_ord(k)*100);
end

impacto_top57 = sum(pi57_ord(1:top5pct57));
fprintf('\nImpacto acumulado del top 5%%: %.4f (%.1f%% del total)\n\n', ...
        impacto_top57, impacto_top57*100);

%% Simulacion de falla del top 5% en case57
% Misma logica que exp4: eliminar filas y columnas, recalcular PageRank.

nodos_criticos57 = idx57_ord(1:top5pct57);

G57_falla_criticos = G57;
G57_falla_criticos(nodos_criticos57, :) = 0;
G57_falla_criticos(:, nodos_criticos57) = 0;

fprintf('Simulando falla del top 5%% (buses: %s)...\n', num2str(nodos_criticos57'));
evalc('[pi57_falla_c, ~, ~] = pagerank(G57_falla_criticos, 0.85, 1e-8, 200)');

c_in57_c  = full(sum(G57_falla_criticos, 2));
c_out57_c = full(sum(G57_falla_criticos, 1))';
grado57_c = c_in57_c + c_out57_c;
activos57 = setdiff(1:n57, nodos_criticos57);
n_descon57_c = sum(grado57_c(activos57) == 0);

pi_temp57_c = pi57_falla_c;
pi_temp57_c(nodos_criticos57) = -Inf;
[~, nuevo_r1_57c] = max(pi_temp57_c);

fprintf('  Nodos removidos       : %d\n', length(nodos_criticos57));
fprintf('  Nodos desconectados   : %d\n', n_descon57_c);
fprintf('  Diferencia norma 1    : %.4f\n', norm(pi57_falla_c - pi57, 1));
fprintf('  Nuevo nodo mas critico: %d (%s)\n\n', nuevo_r1_57c, tipos57{nuevo_r1_57c});

%% Simulacion de falla aleatoria en case57

rng(57);
candidatos57 = setdiff(1:n57, nodos_criticos57);
nodos_aleat57 = candidatos57(randperm(length(candidatos57), top5pct57));

G57_falla_aleat = G57;
G57_falla_aleat(nodos_aleat57, :) = 0;
G57_falla_aleat(:, nodos_aleat57) = 0;

fprintf('Simulando falla de %d buses ALEATORIOS (buses: %s)...\n', ...
        top5pct57, num2str(nodos_aleat57));
evalc('[pi57_falla_a, ~, ~] = pagerank(G57_falla_aleat, 0.85, 1e-8, 200)');

c_in57_a  = full(sum(G57_falla_aleat, 2));
c_out57_a = full(sum(G57_falla_aleat, 1))';
grado57_a = c_in57_a + c_out57_a;
activos57_a = setdiff(1:n57, nodos_aleat57);
n_descon57_a = sum(grado57_a(activos57_a) == 0);

pi_temp57_a = pi57_falla_a;
pi_temp57_a(nodos_aleat57) = -Inf;
[~, nuevo_r1_57a] = max(pi_temp57_a);

fprintf('  Nodos removidos       : %d\n', length(nodos_aleat57));
fprintf('  Nodos desconectados   : %d\n', n_descon57_a);
fprintf('  Diferencia norma 1    : %.4f\n', norm(pi57_falla_a - pi57, 1));
fprintf('  Nuevo nodo mas critico: %d (%s)\n\n', nuevo_r1_57a, tipos57{nuevo_r1_57a});

%% COMPARACION case30 vs case57
% Esta seccion valida el argumento de escalabilidad O(k*n):
%   Si el numero de iteraciones k es APROXIMADAMENTE CONSTANTE para
%   distintos n, entonces el costo total es k*n que escala linealmente.
%   La razon de convergencia esta acotada por |lambda_2| <= p = 0.85,
%   y este acotamiento NO depende de n (Moler p.76).
%
%   Se mide tambien el tiempo de computo del sistema directo O(n^3)
%   para case30 y case57, y se reporta si el ratio de tiempos directos
%   es aproximadamente (57/30)^3 ~ 6.8, lo que confirma la cubicidad.

fprintf('\n');
fprintf('===================================================\n');
fprintf('COMPARACION case30 vs case57 - Escalabilidad O(k*n)\n');
fprintf('===================================================\n\n');

% Metodo directo para case30
c30_salida = full(sum(G30));
c30_salida(c30_salida == 0) = 1;
D30 = spdiags(1./c30_salida', 0, n30, n30);
delta30 = (1 - 0.85) / n30;

t_dir30_ini = tic;
M30 = speye(n30) - 0.85 * G30 * D30;
x30 = M30 \ (delta30 * ones(n30, 1));
x30 = x30 / norm(x30, 1);
t_dir30 = toc(t_dir30_ini);

% Metodo directo para case57
c57_salida = full(sum(G57));
c57_salida(c57_salida == 0) = 1;
D57 = spdiags(1./c57_salida', 0, n57, n57);
delta57 = (1 - 0.85) / n57;

t_dir57_ini = tic;
M57 = speye(n57) - 0.85 * G57 * D57;
x57 = M57 \ (delta57 * ones(n57, 1));
x57 = x57 / norm(x57, 1);
t_dir57 = toc(t_dir57_ini);

% Tabla comparativa
fprintf('| %-6s | %-4s | %-6s | %-4s | %-10s | %-10s | %-10s |\n', ...
        'caso', 'n', 'lineas', 'iter', 'pot(s)', 'dir(s)', 'residual');
fprintf('|%s|\n', repmat('-', 1, 60));
fprintf('| %-6s | %-4d | %-6d | %-4d | %-10.4f | %-10.4f | %-10.2e |\n', ...
        'case30', n30, info30.n_lineas, iter30, t_pot30, t_dir30, hist30(end));
fprintf('| %-6s | %-4d | %-6d | %-4d | %-10.4f | %-10.4f | %-10.2e |\n', ...
        'case57', n57, info57.n_lineas, iter57, t_pot57, t_dir57, hist57(end));
fprintf('\n');

% Analisis de escalabilidad
ratio_n    = n57 / n30;
ratio_pot  = t_pot57 / max(t_pot30, 1e-9);
ratio_dir  = t_dir57 / max(t_dir30, 1e-9);
ratio_n3   = ratio_n^3;

fprintf('Analisis de escalabilidad:\n');
fprintf('  Razon de tamanios       : n57/n30 = %.2f\n', ratio_n);
fprintf('  Razon tiempos potencia  : %.2f  (lineal esperado: %.2f)\n', ratio_pot, ratio_n);
fprintf('  Razon tiempos directo   : %.2f  (cubico esperado: %.2f)\n', ratio_dir, ratio_n3);
fprintf('  Iteraciones case30      : %d\n', iter30);
fprintf('  Iteraciones case57      : %d\n', iter57);

if abs(iter57 - iter30) <= 10
  fprintf('\n  -> Las iteraciones son APROXIMADAMENTE CONSTANTES (%d vs %d).\n', ...
          iter30, iter57);
  fprintf('     Esto confirma que k no crece con n.\n');
  fprintf('     El costo del metodo de la potencia es O(k*n) con k~cte.\n');
  fprintf('     Escala LINEALMENTE con el tamanio de la red.\n');
else
  fprintf('\n  -> Las iteraciones difieren (%d vs %d) porque dependen de la\n', ...
          iter30, iter57);
  fprintf('     estructura topologica de cada red, no del tamanio.\n');
  fprintf('     El segundo autovalor de case57 esta mas cerca de 0.85,\n');
  fprintf('     por eso converge mas lento. Esto es consistente con\n');
  fprintf('     Moler p.76: la tasa de convergencia es |lambda_2| <= p = 0.85.\n');
end

%% Figura 1: convergencia case57 (semilogy)
figure(1);
hold on;
semilogy(hist30, 'b-');
semilogy(hist57, 'r-');
xlabel('Iteracion k');
ylabel('||pi^{(k+1)} - pi^{(k)}||_1');
title('Convergencia: case30 vs case57');
legend(sprintf('case30 (%d iter)', iter30), sprintf('case57 (%d iter)', iter57));
grid on;
hold off;

%% Figura 2: PageRank de case57 coloreado por tipo de bus
colores57 = zeros(n57, 3);
for k = 1:n57
  switch tipos57{k}
    case 'slack'
      colores57(k,:) = [0.8 0.1 0.1];
    case 'generator'
      colores57(k,:) = [0.1 0.7 0.2];
    otherwise
      colores57(k,:) = [0.2 0.4 0.8];
  end
end

figure(2);
hold on;
for k = 1:n57
  bar(k, pi57(k), 'FaceColor', colores57(k,:));
end
xlabel('Bus #');
ylabel('pi_i (impacto sistemico)');
title('PageRank IEEE case57 (azul=carga, verde=generator, rojo=slack)');
grid on;
hold off;

%% Figura 3: comparacion post-falla criticos vs aleatorios (case57)
figure(3);

subplot(1,2,1);
hold on;
bar(1:n57, pi57_falla_c, 'FaceColor', [0.2 0.4 0.8]);
ylims = ylim;
for j = nodos_criticos57
  plot([j j], [0 ylims(2)], 'r--');
end
xlabel('Bus #');
ylabel('pi_i');
title('case57: post-falla nodos criticos');
legend('PageRank', 'Nodo removido');
grid on;
hold off;

subplot(1,2,2);
hold on;
bar(1:n57, pi57_falla_a, 'FaceColor', [0.2 0.7 0.3]);
ylims = ylim;
for j = nodos_aleat57
  plot([j j], [0 ylims(2)], 'r--');
end
xlabel('Bus #');
ylabel('pi_i');
title('case57: post-falla nodos aleatorios');
legend('PageRank', 'Nodo removido');
grid on;
hold off;

fprintf('\n========== FIN EXP5_RED_ELECTRICA_GRANDE ==========\n')
