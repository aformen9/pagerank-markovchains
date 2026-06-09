% Ejercicio 3b - Actividad 7
% Agustin Formenti

clear, clc % limpio variables y pantalla

%% Defino las generatrices
g1 = @(x,y) (8*x - 4*x.^2 + y.^2 + 1)/8;
g2 = @(x,y) (2*x - x.^2 + 4*y - y.^2 + 3)/4;

%% Punto inicial
p0 = 1.1;
q0 = 2.0;

fprintf('=== EJERCICIO 3b - Dos iteraciones ===\n\n')
fprintf('Punto inicial: (p0, q0) = (%.2f, %.2f)\n\n', p0, q0)

%% ITERACION 1
fprintf('--- ITERACION 1 ---\n')

% Calculo componentes intermedios para mostrar el calculo
comp1_1 = 8*p0;
comp1_2 = 4*p0^2;
comp1_3 = q0^2;
numerador1 = comp1_1 - comp1_2 + comp1_3 + 1;
p1 = numerador1/8;

fprintf('p1 = g1(p0, q0) = g1(%.2f, %.2f)\n', p0, q0)
fprintf('p1 = (8*(%.2f) - 4*(%.2f)^2 + (%.2f)^2 + 1)/8\n', p0, p0, q0)
fprintf('p1 = (%.2f - %.4f + %.2f + 1)/8\n', comp1_1, comp1_2, comp1_3)
fprintf('p1 = %.4f/8\n', numerador1)
fprintf('p1 = %.6f\n\n', p1)

% Calculo q1
comp2_1 = 2*p0;
comp2_2 = p0^2;
comp2_3 = 4*q0;
comp2_4 = q0^2;
numerador2 = comp2_1 - comp2_2 + comp2_3 - comp2_4 + 3;
q1 = numerador2/4;

fprintf('q1 = g2(p0, q0) = g2(%.2f, %.2f)\n', p0, q0)
fprintf('q1 = (2*(%.2f) - (%.2f)^2 + 4*(%.2f) - (%.2f)^2 + 3)/4\n', p0, p0, q0, q0)
fprintf('q1 = (%.2f - %.4f + %.2f - %.2f + 3)/4\n', comp2_1, comp2_2, comp2_3, comp2_4)
fprintf('q1 = %.4f/4\n', numerador2)
fprintf('q1 = %.6f\n\n', q1)

fprintf('Resultado iteracion 1: (p1, q1) = (%.6f, %.6f)\n\n', p1, q1)

%% ITERACION 2
fprintf('--- ITERACION 2 ---\n')

% Calculo p2 mostrando componentes
comp1_1 = 8*p1;
comp1_2 = 4*p1^2;
comp1_3 = q1^2;
numerador1 = comp1_1 - comp1_2 + comp1_3 + 1;
p2 = numerador1/8;

fprintf('p2 = g1(p1, q1) = g1(%.6f, %.6f)\n', p1, q1)
fprintf('p2 = (8*(%.6f) - 4*(%.6f)^2 + (%.6f)^2 + 1)/8\n', p1, p1, q1)
fprintf('p2 = (%.6f - %.6f + %.6f + 1)/8\n', comp1_1, comp1_2, comp1_3)
fprintf('p2 = %.6f/8\n', numerador1)
fprintf('p2 = %.6f\n\n', p2)

% Calculo q2
comp2_1 = 2*p1;
comp2_2 = p1^2;
comp2_3 = 4*q1;
comp2_4 = q1^2;
numerador2 = comp2_1 - comp2_2 + comp2_3 - comp2_4 + 3;
q2 = numerador2/4;

fprintf('q2 = g2(p1, q1) = g2(%.6f, %.6f)\n', p1, q1)
fprintf('q2 = (2*(%.6f) - (%.6f)^2 + 4*(%.6f) - (%.6f)^2 + 3)/4\n', p1, p1, q1, q1)
fprintf('q2 = (%.6f - %.6f + %.6f - %.6f + 3)/4\n', comp2_1, comp2_2, comp2_3, comp2_4)
fprintf('q2 = %.6f/4\n', numerador2)
fprintf('q2 = %.6f\n\n', q2)

fprintf('Resultado iteracion 2: (p2, q2) = (%.6f, %.6f)\n\n', p2, q2)

%% Resumen
fprintf('=== RESUMEN DE ITERACIONES ===\n')
fprintf('Iter 0: (%.6f, %.6f)\n', p0, q0)
fprintf('Iter 1: (%.6f, %.6f)\n', p1, q1)
fprintf('Iter 2: (%.6f, %.6f)\n', p2, q2)
