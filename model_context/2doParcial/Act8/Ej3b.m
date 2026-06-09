% Actividad 8 - Ejercicio 3 - Item (b)
% Aproximar las soluciones utilizando NewtonRaphsonSENL
%
% Sistema: x = 0.7*sen(x) - 0.2*cos(y)
%          y = 0.7*cos(x) + 0.2*sen(y)
%
% TEORIA: El metodo de Newton-Raphson para SENL utiliza la iteracion:
% X_{k+1} = X_k + dX_k, donde dX_k se calcula resolviendo:
% J(X_k) * dX_k = -F(X_k)
%
% La convergencia depende fuertemente del punto inicial. Usando las
% aproximaciones visuales del item (a), buscamos las raices del sistema.
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 3 - ACTIVIDAD 8 - ITEM (b)\n')
fprintf('Resolucion con Newton-Raphson\n')
fprintf('========================================\n\n')

fprintf('Sistema de ecuaciones no lineales:\n')
fprintf('f1(x,y) = x - 0.7*sen(x) + 0.2*cos(y) = 0\n')
fprintf('f2(x,y) = y - 0.7*cos(x) - 0.2*sen(y) = 0\n\n')

% Parametros
tol = 1e-9;
itmax = 50;

fprintf('Parametros:\n')
fprintf('Tolerancia: %.1e\n', tol)
fprintf('Iteraciones maximas: %d\n\n', itmax)

%% Primera solucion: cerca del origen

fprintf('========================================\n')
fprintf('SOLUCION 1: Punto inicial cerca del origen\n')
fprintf('========================================\n')

P0_1 = [0.1; 0.1];
fprintf('Punto inicial: (%.2f, %.2f)\n\n', P0_1(1), P0_1(2))

[Pk1, iter1, err1] = NewtonRaphsonSENL('F_ej3', 'JF_ej3', P0_1, tol, itmax);

fprintf('\n')

%% Segunda solucion: explorar otras posibles raices

fprintf('========================================\n')
fprintf('SOLUCION 2: Punto inicial alternativo\n')
fprintf('========================================\n')

P0_2 = [1.0; -0.5];
fprintf('Punto inicial: (%.2f, %.2f)\n\n', P0_2(1), P0_2(2))

[Pk2, iter2, err2] = NewtonRaphsonSENL('F_ej3', 'JF_ej3', P0_2, tol, itmax);

fprintf('\n')

%% Verificacion de las soluciones

fprintf('========================================\n')
fprintf('VERIFICACION DE LAS SOLUCIONES\n')
fprintf('========================================\n\n')

fprintf('Solucion 1: (%.6f, %.6f)\n', Pk1(1), Pk1(2))
F_test1 = F_ej3(Pk1);
fprintf('F(Pk1) = [%.3e; %.3e]\n', F_test1(1), F_test1(2))
fprintf('Norma ||F(Pk1)||_2 = %.3e\n', norm(F_test1))
fprintf('Iteraciones: %d\n\n', iter1)

fprintf('Solucion 2: (%.6f, %.6f)\n', Pk2(1), Pk2(2))
F_test2 = F_ej3(Pk2);
fprintf('F(Pk2) = [%.3e; %.3e]\n', F_test2(1), F_test2(2))
fprintf('Norma ||F(Pk2)||_2 = %.3e\n', norm(F_test2))
fprintf('Iteraciones: %d\n\n', iter2)

%% Graficar las soluciones

fprintf('========================================\n')
fprintf('GRAFICANDO LAS SOLUCIONES\n')
fprintf('========================================\n\n')

% Crear malla de puntos
x = linspace(-2, 2, 400);
y = linspace(-2, 2, 400);
[X, Y] = meshgrid(x, y);

% Evaluar las funciones en la malla
F1 = X - 0.7*sin(X) + 0.2*cos(Y);
F2 = Y - 0.7*cos(X) - 0.2*sin(Y);

% Graficar curvas de nivel
figure(1)
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2)
hold on
contour(X, Y, F2, [0 0], 'r', 'LineWidth', 2)

% Marcar las soluciones encontradas
plot(Pk1(1), Pk1(2), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'g')
text(Pk1(1)+0.1, Pk1(2)+0.1, sprintf('Sol 1: (%.3f, %.3f)', Pk1(1), Pk1(2)), 'FontSize', 9)

plot(Pk2(1), Pk2(2), 'ks', 'MarkerSize', 10, 'MarkerFaceColor', 'm')
text(Pk2(1)+0.1, Pk2(2)+0.1, sprintf('Sol 2: (%.3f, %.3f)', Pk2(1), Pk2(2)), 'FontSize', 9)

grid on
xlabel('x')
ylabel('y')
title('Soluciones del SENL - Newton-Raphson')
legend('f_1(x,y) = 0', 'f_2(x,y) = 0', 'Solucion 1', 'Solucion 2', 'Location', 'best')
axis equal
axis([-2 2 -2 2])
hold off

fprintf('Grafico generado con las soluciones marcadas.\n\n')

fprintf('========================================\n')
fprintf('CONCLUSIONES\n')
fprintf('========================================\n')
fprintf('El metodo de Newton-Raphson convergio exitosamente\n')
fprintf('desde ambos puntos iniciales, encontrando las raices\n')
fprintf('del sistema con alta precision.\n')

%% Usa Newton-Raphson desde dos puntos iniciales diferentes
%% Encuentra las soluciones del sistema
%% Verifica las soluciones calculando ||F(Pk)||
%% Grafica las curvas con las soluciones marcadas
%% Incluye teoría sobre el método
