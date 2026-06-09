%% Ejercicio 4 - Actividad 10
%% Ajuste por mínimos cuadrados F(x) = A*e^x
%% Autor: Agustín Formenti

clear; clc;

%% Datos del problema
x = [1.0, 1.5, 2.0, 2.5];
y = [1.5, 2.8, 4.2, 6.0];

%% Para ajustar F(x) = A*e^x, linealizamos el problema
%% Tomamos logaritmo: ln(y) = ln(A) + x
%% Esto es una recta: Y = B + x, donde Y = ln(y) y B = ln(A)
%% Luego A = e^B

%% Linealizamos
Y = log(y);

%% Planteamos el sistema de ecuaciones normales para Y = B + 1*x
%% sum(Y) = n*B + sum(x)
%% sum(x*Y) = B*sum(x) + sum(x^2)

n = length(x);
sum_x = sum(x);
sum_Y = sum(Y);
sum_x2 = sum(x.^2);
sum_xY = sum(x.*Y);

%% Sistema de ecuaciones normales (pero en realidad solo necesitamos A)
%% Para F(x) = A*e^x, las ecuaciones normales son:
%% A * sum(e^(2*x)) = sum(y * e^x)

sum_e2x = sum(exp(2*x));
sum_yex = sum(y .* exp(x));

%% Despejamos A
A = sum_yex / sum_e2x;

fprintf('El valor de A es: A = %.6f\n', A);

%% Calculamos los valores ajustados
y_ajustado = A * exp(x);

%% Calculamos el ECM
ecm = ECM(x, y, y_ajustado, 'base');
fprintf('El ECM es: %.6f\n', ecm);

%% Graficamos los datos y el ajuste
figure;
hold on;

%% Puntos datos
plot(x, y, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'DisplayName', 'Datos');

%% Curva ajustada
x_plot = linspace(min(x), max(x), 200);
y_plot = A * exp(x_plot);
plot(x_plot, y_plot, 'r-', 'LineWidth', 2, 'DisplayName', sprintf('F(x) = %.4f*e^x', A));

hold off;
grid on;
xlabel('x');
ylabel('y');
title('Ajuste por mínimos cuadrados: F(x) = A*e^x');
legend('Location', 'best');
