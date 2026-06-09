% Actividad 8 - Ejercicio 1
% Newton-Raphson para SENL: 2 iteraciones manuales (calculadas con código)
% Sistema: f1(x,y) = x^2 - y - 0.2 = 0
%          f2(x,y) = y^2 - x - 0.3 = 0
%
% TEORIA: El método de Newton-Raphson para SENL resuelve F(X) = 0 mediante
% la iteración: X_{k+1} = X_k + dX_k, donde dX_k se obtiene resolviendo
% el sistema lineal: J(X_k) * dX_k = -F(X_k)
% J(X_k) es la matriz Jacobiana evaluada en X_k
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO 1 - ACTIVIDAD 8\n')
fprintf('Newton-Raphson: 2 iteraciones manuales\n')
fprintf('========================================\n\n')

fprintf('Sistema de ecuaciones no lineales:\n')
fprintf('f1(x,y) = x^2 - y - 0.2 = 0\n')
fprintf('f2(x,y) = y^2 - x - 0.3 = 0\n\n')

fprintf('Matriz Jacobiana:\n')
fprintf('J(x,y) = | 2x   -1 |\n')
fprintf('         | -1   2y |\n\n')

%% PARTE (a): Punto inicial (1.2, 1.2)
fprintf('========================================\n')
fprintf('PARTE (a): Punto inicial (p0,q0) = (1.2, 1.2)\n')
fprintf('========================================\n\n')

% Iteración 0
p0 = 1.2;
q0 = 1.2;

fprintf('ITERACION 0:\n')
fprintf('(p0, q0) = (%.6f, %.6f)\n\n', p0, q0)

% Evaluar F en (p0, q0)
f1_0 = p0^2 - q0 - 0.2;
f2_0 = q0^2 - p0 - 0.3;
F0 = [f1_0; f2_0];

fprintf('F(p0, q0) = [%.6f; %.6f]\n\n', f1_0, f2_0)

% Evaluar J en (p0, q0)
J0 = [2*p0, -1; -1, 2*q0];

fprintf('J(p0, q0) = [%6.2f  %6.2f]\n', J0(1,1), J0(1,2))
fprintf('            [%6.2f  %6.2f]\n\n', J0(2,1), J0(2,2))

% Resolver J0 * dP0 = -F0 usando Gauss (como en la función NewtonRaphsonSENL)
dP0 = Gauss(J0, -F0);

fprintf('Resolviendo: J(p0,q0) * dP0 = -F(p0,q0)\n')
fprintf('dP0 = [%.6f; %.6f]\n\n', dP0(1), dP0(2))

% Actualizar
p1 = p0 + dP0(1);
q1 = q0 + dP0(2);

fprintf('ITERACION 1:\n')
fprintf('p1 = p0 + dp0 = %.6f + %.6f = %.6f\n', p0, dP0(1), p1)
fprintf('q1 = q0 + dq0 = %.6f + %.6f = %.6f\n\n', q0, dP0(2), q1)

% Iteración 1 -> 2
fprintf('----------------------------------------\n\n')

% Evaluar F en (p1, q1)
f1_1 = p1^2 - q1 - 0.2;
f2_1 = q1^2 - p1 - 0.3;
F1 = [f1_1; f2_1];

fprintf('F(p1, q1) = [%.6f; %.6f]\n\n', f1_1, f2_1)

% Evaluar J en (p1, q1)
J1 = [2*p1, -1; -1, 2*q1];

fprintf('J(p1, q1) = [%6.6f  %6.2f]\n', J1(1,1), J1(1,2))
fprintf('            [%6.2f  %6.6f]\n\n', J1(2,1), J1(2,2))

% Resolver J1 * dP1 = -F1
dP1 = Gauss(J1, -F1);

fprintf('Resolviendo: J(p1,q1) * dP1 = -F(p1,q1)\n')
fprintf('dP1 = [%.6f; %.6f]\n\n', dP1(1), dP1(2))

% Actualizar
p2 = p1 + dP1(1);
q2 = q1 + dP1(2);

fprintf('ITERACION 2:\n')
fprintf('p2 = p1 + dp1 = %.6f + %.6f = %.6f\n', p1, dP1(1), p2)
fprintf('q2 = q1 + dq1 = %.6f + %.6f = %.6f\n\n', q1, dP1(2), q2)

fprintf('Resultado final después de 2 iteraciones (parte a):\n')
fprintf('(p2, q2) = (%.6f, %.6f)\n\n', p2, q2)

%% PARTE (b): Punto inicial (-0.2, -0.2)
fprintf('========================================\n')
fprintf('PARTE (b): Punto inicial (p0,q0) = (-0.2, -0.2)\n')
fprintf('========================================\n\n')

% Iteración 0
p0b = -0.2;
q0b = -0.2;

fprintf('ITERACION 0:\n')
fprintf('(p0, q0) = (%.6f, %.6f)\n\n', p0b, q0b)

% Evaluar F en (p0b, q0b)
f1_0b = p0b^2 - q0b - 0.2;
f2_0b = q0b^2 - p0b - 0.3;
F0b = [f1_0b; f2_0b];

fprintf('F(p0, q0) = [%.6f; %.6f]\n\n', f1_0b, f2_0b)

% Evaluar J en (p0b, q0b)
J0b = [2*p0b, -1; -1, 2*q0b];

fprintf('J(p0, q0) = [%6.2f  %6.2f]\n', J0b(1,1), J0b(1,2))
fprintf('            [%6.2f  %6.2f]\n\n', J0b(2,1), J0b(2,2))

% Resolver J0b * dP0b = -F0b
dP0b = Gauss(J0b, -F0b);

fprintf('Resolviendo: J(p0,q0) * dP0 = -F(p0,q0)\n')
fprintf('dP0 = [%.6f; %.6f]\n\n', dP0b(1), dP0b(2))

% Actualizar
p1b = p0b + dP0b(1);
q1b = q0b + dP0b(2);

fprintf('ITERACION 1:\n')
fprintf('p1 = p0 + dp0 = %.6f + %.6f = %.6f\n', p0b, dP0b(1), p1b)
fprintf('q1 = q0 + dq0 = %.6f + %.6f = %.6f\n\n', q0b, dP0b(2), q1b)

% Iteración 1 -> 2
fprintf('----------------------------------------\n\n')

% Evaluar F en (p1b, q1b)
f1_1b = p1b^2 - q1b - 0.2;
f2_1b = q1b^2 - p1b - 0.3;
F1b = [f1_1b; f2_1b];

fprintf('F(p1, q1) = [%.6f; %.6f]\n\n', f1_1b, f2_1b)

% Evaluar J en (p1b, q1b)
J1b = [2*p1b, -1; -1, 2*q1b];

fprintf('J(p1, q1) = [%6.6f  %6.2f]\n', J1b(1,1), J1b(1,2))
fprintf('            [%6.2f  %6.6f]\n\n', J1b(2,1), J1b(2,2))

% Resolver J1b * dP1b = -F1b
dP1b = Gauss(J1b, -F1b);

fprintf('Resolviendo: J(p1,q1) * dP1 = -F(p1,q1)\n')
fprintf('dP1 = [%.6f; %.6f]\n\n', dP1b(1), dP1b(2))

% Actualizar
p2b = p1b + dP1b(1);
q2b = q1b + dP1b(2);

fprintf('ITERACION 2:\n')
fprintf('p2 = p1 + dp1 = %.6f + %.6f = %.6f\n', p1b, dP1b(1), p2b)
fprintf('q2 = q1 + dq1 = %.6f + %.6f = %.6f\n\n', q1b, dP1b(2), q2b)

fprintf('Resultado final después de 2 iteraciones (parte b):\n')
fprintf('(p2, q2) = (%.6f, %.6f)\n\n', p2b, q2b)

fprintf('========================================\n')
fprintf('CONCLUSIONES:\n')
fprintf('========================================\n')
fprintf('Desde (1.2, 1.2) converge a la raiz positiva\n')
fprintf('Desde (-0.2, -0.2) converge a la raiz negativa\n')
fprintf('El punto inicial determina a cual raiz converge el metodo.\n')
