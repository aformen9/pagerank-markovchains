%% Ejercicio 7b - Actividad 10
%% Aproximación de f(x) = sen(x) en [-1,1]
%% Usando polinomios de Legendre: P1(x), P3(x), P5(x)
%% Autor: Agustín Formenti

clear; clc;

%% Generamos puntos en el intervalo [-1, 1]
n_puntos = 100;
x = linspace(-1, 1, n_puntos);
y = sin(x);

%% Definimos los polinomios de Legendre de grado impar
%% P1(x) = x
%% P3(x) = (1/2)*(-3x + 5x^3)
%% P5(x) = (1/8)*(15x - 70x^3 + 63x^5)

%% Evaluamos los polinomios de Legendre en los puntos x
P1 = x;
P3 = (1/2) * (-3*x + 5*x.^3);
P5 = (1/8) * (15*x - 70*x.^3 + 63*x.^5);

%% Armamos la matriz de ecuaciones normales
%% La matriz A es 3x3
A = zeros(3, 3);
A(1,1) = sum(P1 .* P1);
A(1,2) = sum(P1 .* P3);
A(1,3) = sum(P1 .* P5);
A(2,1) = A(1,2);  % matriz simétrica
A(2,2) = sum(P3 .* P3);
A(2,3) = sum(P3 .* P5);
A(3,1) = A(1,3);
A(3,2) = A(2,3);
A(3,3) = sum(P5 .* P5);

%% El vector b es:
b = zeros(3, 1);
b(1) = sum(y .* P1);
b(2) = sum(y .* P3);
b(3) = sum(y .* P5);

%% Resolvemos el sistema A*c = b
c = Gauss(A, b);

fprintf('Coeficientes con polinomios de Legendre:\n');
fprintf('c1 = %.8f\n', c(1));
fprintf('c2 = %.8f\n', c(2));
fprintf('c3 = %.8f\n', c(3));
fprintf('\nLa función de ajuste es: F(x) = c1*P1(x) + c2*P3(x) + c3*P5(x)\n');

%% Calculamos los valores ajustados
y_ajustado = c(1) * P1 + c(2) * P3 + c(3) * P5;

%% Calculamos el ECM
ecm = ECM(x, y, y_ajustado, 'base');
fprintf('El ECM con polinomios de Legendre es: %.8f\n', ecm);

%% Graficamos la función original y la aproximación
figure;
hold on;

%% Función original sen(x)
x_plot = linspace(-1, 1, 200);
y_original = sin(x_plot);
plot(x_plot, y_original, 'b-', 'LineWidth', 2, 'DisplayName', 'sen(x)');

%% Aproximación con polinomios de Legendre
P1_plot = x_plot;
P3_plot = (1/2) * (-3*x_plot + 5*x_plot.^3);
P5_plot = (1/8) * (15*x_plot - 70*x_plot.^3 + 63*x_plot.^5);
y_aprox = c(1) * P1_plot + c(2) * P3_plot + c(3) * P5_plot;
plot(x_plot, y_aprox, 'g--', 'LineWidth', 2, 'DisplayName', 'Aproximación Legendre');

hold off;
grid on;
xlabel('x');
ylabel('y');
title('Aproximación de sen(x) con polinomios de Legendre');
legend('Location', 'best');
