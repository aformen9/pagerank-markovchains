%% Ejercicio 2a - Graficacion de curvas de nivel
%% Autor: Agustin Formenti
%% Sistema: 7x^3 - 10x - y = 1, 8y^3 - 11y + x = 1

clear; clc;

x = linspace(-2, 2, 400);
y = linspace(-2, 2, 400);
[X, Y] = meshgrid(x, y);

F1 = 7*X.^3 - 10*X - Y - 1;
F2 = 8*Y.^3 - 11*Y + X - 1;

figure;
hold on;
grid on;

contour(X, Y, F1, [0 0], 'r', 'LineWidth', 2.5);
contour(X, Y, F2, [0 0], 'b', 'LineWidth', 2.5);

xlabel('x');
ylabel('y');
title('Sistema cubico');
axis([-2 2 -2 2]);
axis square;
hold off;
