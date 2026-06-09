%% Ejercicio 3 - Actividad 10
%% Ajuste polinomial de grados 1, 2, 3, 4 y 5
%% Autor: Agustín Formenti

clear; clc;

%% Datos del problema
x = [0, 0.15, 0.31, 0.5, 0.6, 0.75, 1];
y = [1, 1.004, 1.031, 1.117, 1.223, 1.422, 1.6];

%% Calculamos los polinomios de ajuste para cada grado
grados = [1, 2, 3, 4, 5];
n_grados = length(grados);

%% Almacenamos los coeficientes y errores
coeficientes = cell(1, n_grados);
errores = zeros(1, n_grados);

%% Para cada grado, calculamos el ajuste
for i = 1:n_grados
    g = grados(i);
    %% Usamos ajustepoly para obtener los coeficientes
    c = ajustepoly(x, y, g);
    coeficientes{i} = c;

    %% Calculamos el ECM
    errores(i) = ECM(x, y, c, 'poly');

    fprintf('Grado %d: ECM = %.6f\n', g, errores(i));
end

%% Graficamos los datos y los polinomios
figure;
hold on;

%% Graficamos los puntos datos
plot(x, y, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'DisplayName', 'Datos');

%% Generamos puntos para graficar las curvas suavemente
x_plot = linspace(min(x), max(x), 200);

%% Colores para cada grado
colores = ['r', 'g', 'b', 'm', 'c'];

%% Graficamos cada polinomio
for i = 1:n_grados
    g = grados(i);
    c = coeficientes{i};
    y_plot = polyval(c, x_plot);
    plot(x_plot, y_plot, colores(i), 'LineWidth', 1.5, ...
         'DisplayName', sprintf('Grado %d (ECM=%.4f)', g, errores(i)));
end

hold off;
grid on;
xlabel('x');
ylabel('y');
title('Ajuste polinomial por mínimos cuadrados');
legend('Location', 'best');

%% Determinamos cuál da la mejor aproximación
[min_error, idx_mejor] = min(errores);
fprintf('\nLa mejor aproximación es con el polinomio de grado %d\n', grados(idx_mejor));
fprintf('Con un ECM de %.6f\n', min_error);
