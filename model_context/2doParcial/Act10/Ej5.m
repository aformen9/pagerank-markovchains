%% Ejercicio 5 - Actividad 10
%% Ajuste con funciones base f1(x) = x y f2(x) = e^x
%% Autor: Agustín Formenti

clear; clc;

%% Datos del problema
x = [0.0, 1.0, 1.5, 2.0];
y = [0.1, 1.2, 2.8, 4.2];

%% Funciones base: f1(x) = x, f2(x) = e^x
%% La función de ajuste es: F(x) = c1*x + c2*e^x

%% Evaluamos las funciones base en los puntos x
f1 = x;           % f1(x) = x
f2 = exp(x);      % f2(x) = e^x

%% Armamos la matriz de ecuaciones normales
%% La matriz A es:
%% A = [ sum(f1^2)      sum(f1*f2)   ]
%%     [ sum(f1*f2)     sum(f2^2)    ]

A = zeros(2, 2);
A(1,1) = sum(f1 .* f1);
A(1,2) = sum(f1 .* f2);
A(2,1) = A(1,2);  % matriz simétrica
A(2,2) = sum(f2 .* f2);

%% El vector b es:
%% b = [ sum(y*f1) ]
%%     [ sum(y*f2) ]

b = zeros(2, 1);
b(1) = sum(y .* f1);
b(2) = sum(y .* f2);

%% Resolvemos el sistema A*c = b
c = Gauss(A, b);

fprintf('Coeficientes de la función de ajuste:\n');
fprintf('c1 = %.6f\n', c(1));
fprintf('c2 = %.6f\n', c(2));
fprintf('\nLa función de ajuste es: F(x) = %.6f*x + %.6f*e^x\n', c(1), c(2));

%% Calculamos los valores ajustados
y_ajustado = c(1) * x + c(2) * exp(x);

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
y_plot = c(1) * x_plot + c(2) * exp(x_plot);
plot(x_plot, y_plot, 'b-', 'LineWidth', 2, ...
     'DisplayName', sprintf('F(x) = %.4f*x + %.4f*e^x', c(1), c(2)));

hold off;
grid on;
xlabel('x');
ylabel('y');
title('Ajuste con funciones base: f_1(x) = x, f_2(x) = e^x');
legend('Location', 'best');
