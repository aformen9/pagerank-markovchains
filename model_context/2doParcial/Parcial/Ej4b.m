%% Ejercicio 4b - Ajuste no lineal
%% Autor: Agustin Formenti

clear; clc;

x = [1.0, 6.0, 11.0, 1.5, 6.5, 11.5, 2.0, 7.0, 12.0, 2.5, 8.0, 12.5, 3.0, 9.0, 13.0];
y = [2.5, 7.9, 11.2, 3.5, 8.2, 11.5, 4.6, 8.6, 11.7, 5.5, 9.3, 11.9, 6.2, 10.0, 12.1];

c = ajustebase(x, y, 'base_ej4b');

b0 = c(3);
b1 = c(2);
b2 = c(1);

disp('Ajuste: y = b0 + b1*ln(x) + b2*x^2')
disp(['b0 = ', num2str(b0)])
disp(['b1 = ', num2str(b1)])
disp(['b2 = ', num2str(b2)])

ypred = b0 + b1 * log(x) + b2 * (x.^2);
R2_nl = 1 - sum((y - ypred).^2) / sum((y - mean(y)).^2);

disp(['R2 = ', num2str(R2_nl)])
