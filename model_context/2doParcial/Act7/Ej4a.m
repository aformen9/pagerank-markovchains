% Ejercicio 4a - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

%% Obtengo las ecuaciones implicitas
% De x = g1(x,y) --> x = (y - x³ + 3x² + 3x)/7
% 7x = y - x³ + 3x² + 3x
% 7x - 3x² - 3x + x³ - y = 0
% x³ - 3x² + 4x - y = 0  --> y = x³ - 3x² + 4x

% De y = g2(x,y) --> y = (y² + 2y - x - 2)/2
% 2y = y² + 2y - x - 2
% 0 = y² - x - 2
% x = y² - 2

%% Creo malla de puntos
x = linspace(-5, 5, 400);
y = linspace(-5, 5, 400);
[X, Y] = meshgrid(x, y);

%% Evaluo las funciones implicitas
% Curva 1: y = x³ - 3x² + 4x  -->  y - x³ + 3x² - 4x = 0
F1 = Y - X.^3 + 3*X.^2 - 4*X;

% Curva 2: x = y² - 2  -->  x - y² + 2 = 0
F2 = X - Y.^2 + 2;

%% Grafico usando contour
figure(1)
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2), hold on
contour(X, Y, F2, [0 0], 'r', 'LineWidth', 2)

grid on
xlabel('x')
ylabel('y')
title('Curvas del SENL - Ejercicio 4')
legend('Curva 1: y = x^3 - 3x^2 + 4x', ...
       'Curva 2: x = y^2 - 2', ...
       'Location', 'best')
axis equal
xlim([-5 5])
ylim([-5 5])
hold off

fprintf('Grafica generada. Las raices estan en las intersecciones.\n')
