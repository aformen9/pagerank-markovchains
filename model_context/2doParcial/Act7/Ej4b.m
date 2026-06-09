% Ejercicio 4b - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

fprintf('=== ANALISIS DE REGION DE CONVERGENCIA - EJERCICIO 4b ===\n\n')

%% Generatrices:
% g1(x,y) = (y - x³ + 3x² + 3x)/7
% g2(x,y) = (y² + 2y - x - 2)/2

%% Calculo las derivadas parciales

% Para g1(x,y) = (y - x³ + 3x² + 3x)/7
% dg1/dx = (-3x² + 6x + 3)/7
% dg1/dy = 1/7

% Para g2(x,y) = (y² + 2y - x - 2)/2
% dg2/dx = -1/2
% dg2/dy = (2y + 2)/2 = y + 1

fprintf('Derivadas parciales (simbolicas):\n')
fprintf('dg1/dx = (-3x^2 + 6x + 3)/7\n')
fprintf('dg1/dy = 1/7\n')
fprintf('dg2/dx = -1/2\n')
fprintf('dg2/dy = y + 1\n\n')

%% Defino las derivadas como funciones
dg1_dx = @(x,y) (-3*x.^2 + 6*x + 3)/7;
dg1_dy = @(x,y) 1/7;
dg2_dx = @(x,y) -1/2;
dg2_dy = @(x,y) y + 1;

%% Condiciones de convergencia
fprintf('--- CONDICIONES DE CONVERGENCIA ---\n\n')
fprintf('Para que converja necesitamos:\n')
fprintf('|dg1/dx| + |dg1/dy| < 1\n')
fprintf('|dg2/dx| + |dg2/dy| < 1\n\n')

%% Analizo condicion 1
fprintf('CONDICION 1:\n')
fprintf('|(-3x^2 + 6x + 3)/7| + |1/7| < 1\n')
fprintf('|(-3x^2 + 6x + 3)/7| + 1/7 < 1\n')
fprintf('|(-3x^2 + 6x + 3)/7| < 6/7\n')
fprintf('|-3x^2 + 6x + 3| < 6\n')
fprintf('-6 < -3x^2 + 6x + 3 < 6\n\n')

% Resuelvo las desigualdades
fprintf('Desigualdad 1: -3x^2 + 6x + 3 < 6\n')
fprintf('               -3x^2 + 6x - 3 < 0\n')
fprintf('               x^2 - 2x + 1 > 0\n')
fprintf('               (x - 1)^2 > 0\n')
fprintf('               Se cumple para todo x != 1\n\n')

fprintf('Desigualdad 2: -3x^2 + 6x + 3 > -6\n')
fprintf('               -3x^2 + 6x + 9 > 0\n')
fprintf('               x^2 - 2x - 3 < 0\n')
fprintf('               (x - 3)(x + 1) < 0\n')
fprintf('               -1 < x < 3\n\n')

fprintf('CONCLUSION Condicion 1: -1 < x < 3 (aproximadamente)\n\n')

%% Analizo condicion 2
fprintf('CONDICION 2:\n')
fprintf('|-1/2| + |y + 1| < 1\n')
fprintf('1/2 + |y + 1| < 1\n')
fprintf('|y + 1| < 1/2\n')
fprintf('-1/2 < y + 1 < 1/2\n')
fprintf('-3/2 < y < -1/2\n\n')

fprintf('CONCLUSION Condicion 2: -1.5 < y < -0.5\n\n')

%% Region de convergencia
fprintf('=== REGION DE CONVERGENCIA ===\n')
fprintf('Para que el metodo de Punto Fijo converja, necesitamos:\n')
fprintf('  -1 < x < 3\n')
fprintf('  -1.5 < y < -0.5\n\n')
fprintf('Esta es la region rectangular donde se garantiza convergencia.\n')

%% Grafico la region de convergencia
figure(1)

% Creo malla de puntos
x_plot = linspace(-5, 5, 400);
y_plot = linspace(-5, 5, 400);
[X, Y] = meshgrid(x_plot, y_plot);

% Evaluo las funciones implicitas
F1 = Y - X.^3 + 3*X.^2 - 4*X;
F2 = X - Y.^2 + 2;

% Grafico curvas
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2), hold on
contour(X, Y, F2, [0 0], 'r', 'LineWidth', 2)

% Grafico region de convergencia
x_region = [-1, 3, 3, -1, -1];
y_region = [-1.5, -1.5, -0.5, -0.5, -1.5];
fill(x_region, y_region, 'g', 'FaceAlpha', 0.2, 'EdgeColor', 'k', 'LineWidth', 2)

grid on
xlabel('x')
ylabel('y')
title('Region de Convergencia - Ejercicio 4')
legend('Curva 1: y = x^3 - 3x^2 + 4x', ...
       'Curva 2: x = y^2 - 2', ...
       'Region de convergencia', ...
       'Location', 'best')
axis equal
xlim([-5 5])
ylim([-5 5])
hold off
