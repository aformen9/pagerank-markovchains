%% Ejercicio 4c - Comparacion grafica
%% Autor: Agustin Formenti

clear; clc;

x = [1.0, 6.0, 11.0, 1.5, 6.5, 11.5, 2.0, 7.0, 12.0, 2.5, 8.0, 12.5, 3.0, 9.0, 13.0];
y = [2.5, 7.9, 11.2, 3.5, 8.2, 11.5, 4.6, 8.6, 11.7, 5.5, 9.3, 11.9, 6.2, 10.0, 12.1];

%% Regresion lineal
n = length(x);
sx = sum(x);
sy = sum(y);
sxy = sum(x .* y);
sx2 = sum(x .^ 2);
A = (n * sxy - sx * sy) / (n * sx2 - sx^2);
B = (sy - A * sx) / n;

%% Ajuste no lineal
c = ajustebase(x, y, 'base_ej4b');
b0 = c(3);
b1 = c(2);
b2 = c(1);


xp = linspace(1, 13, 200);
ylin = A * xp + B;
ynl = b0 + b1 * log(xp) + b2 * (xp.^2);

figure;

subplot(1, 2, 1);
hold on;
plot(x, y, 'ko', 'MarkerSize', 6, 'MarkerFaceColor', 'k');
plot(xp, ylin, 'r-', 'LineWidth', 1.5);
xlabel('Riesgo');
ylabel('Tasa');
title('Lineal');
legend('Datos', 'Ajuste');
grid on;
hold off;

subplot(1, 2, 2);
hold on;
plot(x, y, 'ko', 'MarkerSize', 6, 'MarkerFaceColor', 'k');
plot(xp, ynl, 'b-', 'LineWidth', 1.5);
xlabel('Riesgo');
ylabel('Tasa');
title('No lineal');
legend('Datos', 'Ajuste');
grid on;
hold off;
