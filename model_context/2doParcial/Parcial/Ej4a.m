%% Ejercicio 4a - Regresion lineal
%% Autor: Agustin Formenti

clear; clc;

x = [1.0, 6.0, 11.0, 1.5, 6.5, 11.5, 2.0, 7.0, 12.0, 2.5, 8.0, 12.5, 3.0, 9.0, 13.0];
y = [2.5, 7.9, 11.2, 3.5, 8.2, 11.5, 4.6, 8.6, 11.7, 5.5, 9.3, 11.9, 6.2, 10.0, 12.1];

n = length(x);
sx = sum(x);
sy = sum(y);
sxy = sum(x .* y);
sx2 = sum(x .^ 2);

A = (n * sxy - sx * sy) / (n * sx2 - sx^2);
B = (sy - A * sx) / n;

disp('Regresion lineal: y = Ax + B')
disp(['A = ', num2str(A)])
disp(['B = ', num2str(B)])

ypred = A * x + B;
R2 = 1 - sum((y - ypred).^2) / sum((y - mean(y)).^2);

disp(['R2 = ', num2str(R2)])


