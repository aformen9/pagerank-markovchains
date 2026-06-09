% Actividad 8 - Ejercicio 4 - Item (b)
% Aplicar NewtonRaphsonSENL para hallar las raices iniciando en un punto cercano
%
% Sistema: f1(x,y) = x^2 + y^2 - 2 = 0
%          f2(x,y) = xy - 1 = 0
%
% TEORIA: El metodo de Newton-Raphson converge rapidamente si el punto
% inicial esta suficientemente cerca de la raiz. La eleccion del punto
% inicial es critica: diferentes puntos iniciales pueden converger a
% diferentes raices del sistema.
%
% Algoritmo: X_{k+1} = X_k + dX_k, donde J(X_k)*dX_k = -F(X_k)
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 4 - ACTIVIDAD 8 - ITEM (b)\n')
fprintf('Hallar raices con Newton-Raphson\n')
fprintf('========================================\n\n')

fprintf('Sistema de ecuaciones no lineales:\n')
fprintf('f1(x,y) = x^2 + y^2 - 2 = 0\n')
fprintf('f2(x,y) = xy - 1 = 0\n\n')

fprintf('Raices conocidas (del item a):\n')
fprintf('- (x,y) = (1, 1)\n')
fprintf('- (x,y) = (-1, -1)\n\n')

% Parametros
tol = 1e-9;
itmax = 50;

fprintf('Parametros:\n')
fprintf('Tolerancia: %.1e\n', tol)
fprintf('Iteraciones maximas: %d\n\n', itmax)

%% Buscar la primera raiz: cerca de (1, 1)

fprintf('========================================\n')
fprintf('RAIZ 1: Buscando cerca de (1, 1)\n')
fprintf('========================================\n')

P0_1 = [0.9; 0.9];
fprintf('Punto inicial: (%.2f, %.2f)\n\n', P0_1(1), P0_1(2))

[Pk1, iter1, err1] = NewtonRaphsonSENL('F_ej4', 'JF_ej4', P0_1, tol, itmax);

fprintf('\n')

% Verificacion
F_test1 = F_ej4(Pk1);
fprintf('Verificacion:\n')
fprintf('F(Pk1) = [%.3e; %.3e]\n', F_test1(1), F_test1(2))
fprintf('||F(Pk1)||_2 = %.3e\n\n', norm(F_test1))

%% Buscar la segunda raiz: cerca de (-1, -1)

fprintf('========================================\n')
fprintf('RAIZ 2: Buscando cerca de (-1, -1)\n')
fprintf('========================================\n')

P0_2 = [-0.9; -0.9];
fprintf('Punto inicial: (%.2f, %.2f)\n\n', P0_2(1), P0_2(2))

[Pk2, iter2, err2] = NewtonRaphsonSENL('F_ej4', 'JF_ej4', P0_2, tol, itmax);

fprintf('\n')

% Verificacion
F_test2 = F_ej4(Pk2);
fprintf('Verificacion:\n')
fprintf('F(Pk2) = [%.3e; %.3e]\n', F_test2(1), F_test2(2))
fprintf('||F(Pk2)||_2 = %.3e\n\n', norm(F_test2))

%% Resumen de resultados

fprintf('========================================\n')
fprintf('RESUMEN DE RESULTADOS\n')
fprintf('========================================\n')
fprintf('Raiz 1 encontrada: (%.6f, %.6f)\n', Pk1(1), Pk1(2))
fprintf('  - Iteraciones: %d\n', iter1)
fprintf('  - Error estimado: %.3e\n\n', err1)

fprintf('Raiz 2 encontrada: (%.6f, %.6f)\n', Pk2(1), Pk2(2))
fprintf('  - Iteraciones: %d\n', iter2)
fprintf('  - Error estimado: %.3e\n\n', err2)

%% Graficar las curvas y las soluciones

fprintf('========================================\n')
fprintf('GRAFICANDO CURVAS Y SOLUCIONES\n')
fprintf('========================================\n\n')

% Crear malla de puntos
x = linspace(-2, 2, 400);
y = linspace(-2, 2, 400);
[X, Y] = meshgrid(x, y);

% Evaluar las funciones
F1 = X.^2 + Y.^2 - 2;
F2 = X.*Y - 1;

% Graficar
figure(1)
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2)
hold on
contour(X, Y, F2, [0 0], 'r', 'LineWidth', 2)

% Marcar las soluciones encontradas
plot(Pk1(1), Pk1(2), 'ko', 'MarkerSize', 12, 'MarkerFaceColor', 'g')
text(Pk1(1)+0.15, Pk1(2)+0.15, sprintf('(%.2f, %.2f)', Pk1(1), Pk1(2)), 'FontSize', 10)

plot(Pk2(1), Pk2(2), 'ko', 'MarkerSize', 12, 'MarkerFaceColor', 'g')
text(Pk2(1)+0.15, Pk2(2)+0.15, sprintf('(%.2f, %.2f)', Pk2(1), Pk2(2)), 'FontSize', 10)

grid on
xlabel('x')
ylabel('y')
title('Soluciones del SENL encontradas con Newton-Raphson')
legend('x^2 + y^2 - 2 = 0 (circulo)', 'xy - 1 = 0 (hiperbola)', 'Soluciones', 'Location', 'best')
axis equal
axis([-2 2 -2 2])
hold off

fprintf('Grafico generado.\n')
fprintf('- La curva azul es un circulo de radio sqrt(2) centrado en el origen\n')
fprintf('- La curva roja es una hiperbola xy = 1\n')
fprintf('- Las soluciones son las intersecciones de ambas curvas\n')

%% Aplica Newton-Raphson desde puntos cercanos a cada raíz
%% Encuentra ambas soluciones con alta precisión
%% Verifica las soluciones calculando ||F(Pk)||
%% Grafica las curvas (círculo e hipérbola) con las soluciones marcadas
%% Incluye teoría sobre convergencia y elección de punto inicial
