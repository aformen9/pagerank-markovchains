% Ejercicio 4c - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

fprintf('=== EJERCICIO 4c - Hallar soluciones con Punto Fijo ===\n\n')

%% Parametros del metodo
tol = 1e-9;       % tolerancia
itmax = 50;       % iteraciones maximas

%% Intento 1: Punto dentro de la region de convergencia
% Region: -1 < x < 3, -1.5 < y < -0.5
P0_1 = [1.0, -1.0];  % punto dentro de la region

fprintf('--- INTENTO 1 ---\n')
fprintf('Punto inicial: (%.2f, %.2f) [DENTRO de la region]\n\n', P0_1(1), P0_1(2))

[Pk_1, iter_1] = PuntoFijo('G_ej4', P0_1, tol, itmax);

fprintf('\nResultado intento 1:\n')
fprintf('Punto fijo: (%.8f, %.8f)\n', Pk_1(1), Pk_1(2))
fprintf('Iteraciones: %d\n\n', iter_1)

%% Intento 2: Otro punto dentro de la region
P0_2 = [2.0, -1.2];

fprintf('\n--- INTENTO 2 ---\n')
fprintf('Punto inicial: (%.2f, %.2f) [DENTRO de la region]\n\n', P0_2(1), P0_2(2))

[Pk_2, iter_2] = PuntoFijo('G_ej4', P0_2, tol, itmax);

fprintf('\nResultado intento 2:\n')
fprintf('Punto fijo: (%.8f, %.8f)\n', Pk_2(1), Pk_2(2))
fprintf('Iteraciones: %d\n\n', iter_2)

%% Intento 3: Punto fuera de la region (para ver que pasa)
P0_3 = [0.0, 0.0];  % fuera de la region

fprintf('\n--- INTENTO 3 ---\n')
fprintf('Punto inicial: (%.2f, %.2f) [FUERA de la region]\n\n', P0_3(1), P0_3(2))

[Pk_3, iter_3] = PuntoFijo('G_ej4', P0_3, tol, itmax);

fprintf('\nResultado intento 3:\n')
fprintf('Punto fijo: (%.8f, %.8f)\n', Pk_3(1), Pk_3(2))
fprintf('Iteraciones: %d\n\n', iter_3)

%% Resumen
fprintf('\n=== RESUMEN ===\n')
fprintf('Puntos fijos encontrados:\n')
fprintf('Intento 1: (%.6f, %.6f)\n', Pk_1(1), Pk_1(2))
fprintf('Intento 2: (%.6f, %.6f)\n', Pk_2(1), Pk_2(2))
fprintf('Intento 3: (%.6f, %.6f)\n', Pk_3(1), Pk_3(2))
