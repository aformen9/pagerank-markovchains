%% Ejercicio 3b - Grafica de datos y polinomio
%% Autor: Agustin Formenti

clear; clc;

xi = [0.0, 1.0, 2.0, 3.0, 4.0];
yi = [10.1, 15.3, 18.4, 17.0, 16.6];

x_plot = linspace(0, 4, 200);
y_plot = lagran(x_plot, xi, yi);

figure;
hold on;
grid on;

plot(xi, yi, 'rs', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot(x_plot, y_plot, 'b-', 'LineWidth', 1.5);

xlabel('Voltaje [V]');
ylabel('Temperatura [C]');
title('Calibracion de Sensor');
legend('Datos', 'Polinomio');
hold off;
