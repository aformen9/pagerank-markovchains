%% Ejercicio 7a - Actividad 10
%% Aproximación de f(x) = sen(x) en [-1,1]
%% Usando base canónica {x, x^3, x^5}
%% Autor: Agustín Formenti

clear; clc;

%% Generamos puntos en el intervalo [-1, 1]
%% Usamos bastantes puntos para tener una buena aproximación
n_puntos = 100;
x = linspace(-1, 1, n_puntos);
y = sin(x);

%% Definimos las funciones base: f1(x) = x, f2(x) = x^3, f3(x) = x^5
%% La función de ajuste es: F(x) = c1*x + c2*x^3 + c3*x^5

%% Evaluamos las funciones base en los puntos x
f1 = x;           % f1(x) = x
f2 = x.^3;        % f2(x) = x^3
f3 = x.^5;        % f3(x) = x^5

%% Armamos la matriz de ecuaciones normales
%% La matriz A es 3x3
A = zeros(3, 3);
A(1,1) = sum(f1 .* f1);
A(1,2) = sum(f1 .* f2);
A(1,3) = sum(f1 .* f3);
A(2,1) = A(1,2);  % matriz simétrica
A(2,2) = sum(f2 .* f2);
A(2,3) = sum(f2 .* f3);
A(3,1) = A(1,3);
A(3,2) = A(2,3);
A(3,3) = sum(f3 .* f3);

%% El vector b es:
b = zeros(3, 1);
b(1) = sum(y .* f1);
b(2) = sum(y .* f2);
b(3) = sum(y .* f3);

%% Resolvemos el sistema A*c = b
c = Gauss(A, b);

fprintf('Coeficientes con base canónica:\n');
fprintf('c1 = %.8f\n', c(1));
fprintf('c2 = %.8f\n', c(2));
fprintf('c3 = %.8f\n', c(3));
fprintf('\nLa función de ajuste es: F(x) = %.8f*x + %.8f*x^3 + %.8f*x^5\n', ...
        c(1), c(2), c(3));

%% Calculamos los valores ajustados
y_ajustado = c(1) * x + c(2) * x.^3 + c(3) * x.^5;

%% Calculamos el ECM
ecm = ECM(x, y, y_ajustado, 'base');
fprintf('El ECM con base canónica es: %.8f\n', ecm);

%% Graficamos la función original y la aproximación
figure;
hold on;

%% Función original sen(x)
x_plot = linspace(-1, 1, 200);
y_original = sin(x_plot);
plot(x_plot, y_original, 'b-', 'LineWidth', 2, 'DisplayName', 'sen(x)');

%% Aproximación con base canónica
y_aprox = c(1) * x_plot + c(2) * x_plot.^3 + c(3) * x_plot.^5;
plot(x_plot, y_aprox, 'r--', 'LineWidth', 2, 'DisplayName', 'Aproximación base canónica');

hold off;
grid on;
xlabel('x');
ylabel('y');
title('Aproximación de sen(x) con base canónica {x, x^3, x^5}');
legend('Location', 'best');
