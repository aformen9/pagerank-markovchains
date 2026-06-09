%% Ejercicio 3a - Interpolacion de Lagrange
%% Autor: Agustin Formenti

clear; clc;

xi = [0.0, 1.0, 2.0, 3.0, 4.0];
yi = [10.1, 15.3, 18.4, 17.0, 16.6];

x_plot = linspace(0, 4, 200);
y_plot = lagran(x_plot, xi, yi);

plot(x_plot, y_plot, 'b-', 'LineWidth', 1.5);
