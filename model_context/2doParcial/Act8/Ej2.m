% Actividad 8 - Ejercicio 2
% Newton-Raphson para SENL
% Sistema: f1(x,y) = x^2 - y^2 - 4x - 3 = 0
%          f2(x,y) = x - 2y + 1 = 0
%
% TEORIA: Para resolver SENL con Newton-Raphson:
% - Las ecuaciones f1=0 y f2=0 definen curvas en el plano
% - Las raices son las intersecciones de estas curvas
% - Newton-Raphson converge rapidamente si el punto inicial esta cerca de la raiz
%
% (a) Graficar las curvas involucradas en el plano z = 0
% (b) Hallar las soluciones con NewtonRaphsonSENL
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 2 - ACTIVIDAD 8\n')
fprintf('Newton-Raphson para SENL\n')
fprintf('========================================\n\n')

fprintf('Sistema de ecuaciones no lineales:\n')
fprintf('f1(x,y) = x^2 - y^2 - 4x - 3 = 0\n')
fprintf('f2(x,y) = x - 2y + 1 = 0\n\n')

%% PARTE (a): Graficar las curvas en el plano z = 0

fprintf('PARTE (a): Graficando las curvas...\n\n')

% Crear malla de puntos
[x, y] = meshgrid(-2:0.05:6, -3:0.05:3);

% Evaluar las funciones en la malla
f1 = x.^2 - y.^2 - 4*x - 3;
f2 = x - 2*y + 1;

% Graficar curvas de nivel (donde f1=0 y f2=0)
figure(1)
contour(x, y, f1, [0 0], 'b', 'LineWidth', 2)
hold on
contour(x, y, f2, [0 0], 'r', 'LineWidth', 2)
grid on
xlabel('x')
ylabel('y')
title('Curvas del SENL en el plano z = 0')
legend('f_1(x,y) = x^2 - y^2 - 4x - 3 = 0', 'f_2(x,y) = x - 2y + 1 = 0', 'Location', 'best')
axis equal
hold off

fprintf('Grafico generado. Las intersecciones son las raices del sistema.\n\n')

%% PARTE (b): Hallar las soluciones con NewtonRaphsonSENL

fprintf('========================================\n')
fprintf('PARTE (b): Resolviendo con Newton-Raphson\n')
fprintf('========================================\n\n')

% De la segunda ecuación: x = 2y - 1
% Sustituyendo en la primera: (2y-1)^2 - y^2 - 4(2y-1) - 3 = 0
% 4y^2 - 4y + 1 - y^2 - 8y + 4 - 3 = 0
% 3y^2 - 12y + 2 = 0
% y = (12 ± sqrt(144-24))/6 = (12 ± sqrt(120))/6 ≈ (12 ± 10.95)/6
% y1 ≈ 3.83, y2 ≈ 0.17
% x1 = 2(3.83) - 1 ≈ 6.66, x2 = 2(0.17) - 1 ≈ -0.66

fprintf('Aproximaciones iniciales basadas en el grafico:\n')
fprintf('Raiz 1: cerca de (6.5, 3.8)\n')
fprintf('Raiz 2: cerca de (-0.7, 0.2)\n\n')

% Tolerancia y máximo de iteraciones
tol = 1e-9;
itmax = 50;

% Resolver desde el primer punto inicial
fprintf('--- Solucion 1 ---\n')
P0_1 = [6.5; 3.8];
fprintf('Punto inicial: (%.2f, %.2f)\n\n', P0_1(1), P0_1(2))
[Pk1, iter1, err1] = NewtonRaphsonSENL('F_Ej2', 'JF_Ej2', P0_1, tol, itmax);

fprintf('\n')

% Resolver desde el segundo punto inicial
fprintf('--- Solucion 2 ---\n')
P0_2 = [-0.7; 0.2];
fprintf('Punto inicial: (%.2f, %.2f)\n\n', P0_2(1), P0_2(2))
[Pk2, iter2, err2] = NewtonRaphsonSENL('F_Ej2', 'JF_Ej2', P0_2, tol, itmax);

fprintf('\n========================================\n')
fprintf('RESUMEN DE SOLUCIONES\n')
fprintf('========================================\n')
fprintf('Raiz 1: (%.6f, %.6f) - %d iteraciones\n', Pk1(1), Pk1(2), iter1)
fprintf('Raiz 2: (%.6f, %.6f) - %d iteraciones\n', Pk2(1), Pk2(2), iter2)

% Graficar las soluciones en el gráfico anterior
figure(1)
hold on
plot(Pk1(1), Pk1(2), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'g')
plot(Pk2(1), Pk2(2), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'g')
text(Pk1(1)+0.3, Pk1(2)+0.2, sprintf('(%.2f, %.2f)', Pk1(1), Pk1(2)), 'FontSize', 10)
text(Pk2(1)+0.3, Pk2(2)+0.2, sprintf('(%.2f, %.2f)', Pk2(1), Pk2(2)), 'FontSize', 10)
hold off

fprintf('\nGrafico actualizado con las raices encontradas.\n')
