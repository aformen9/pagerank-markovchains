%% Ejercicio 1a - Graficacion de curvas de nivel para diferentes valores de alpha
%% Autor: Agustin Formenti
%% Sistema: x^2 - y + alpha = 0, -x + y^2 + alpha = 0

clear; clc;

x = linspace(-2, 2, 400);
y = linspace(-2, 2, 400);
[X, Y] = meshgrid(x, y);

figure;
hold on;
grid on;

%% alphas
alpha = 1;
F1 = X.^2 - Y + alpha;
F2 = -X + Y.^2 + alpha;
contour(X, Y, F1, [0 0], 'r', 'LineWidth', 2);
contour(X, Y, F2, [0 0], 'r:', 'LineWidth', 2);

alpha = 0.25;
F1 = X.^2 - Y + alpha;
F2 = -X + Y.^2 + alpha;
contour(X, Y, F1, [0 0], 'g', 'LineWidth', 2);
contour(X, Y, F2, [0 0], 'g:', 'LineWidth', 2);

alpha = 0;
F1 = X.^2 - Y + alpha;
F2 = -X + Y.^2 + alpha;
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2);
contour(X, Y, F2, [0 0], 'b:', 'LineWidth', 2);

alpha = -1;
F1 = X.^2 - Y + alpha;
F2 = -X + Y.^2 + alpha;
contour(X, Y, F1, [0 0], 'm', 'LineWidth', 2);
contour(X, Y, F2, [0 0], 'm:', 'LineWidth', 2);

xlabel('x');
ylabel('y');
title('Curvas de nivel para distintos alpha');
axis([-2 2 -2 2]);
axis square;
hold off;
