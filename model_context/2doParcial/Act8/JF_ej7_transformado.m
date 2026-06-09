function J = JF_ej7_transformado(X)
% Matriz Jacobiana para Ejercicio 7 - Modelo de Wilson (sistema transformado)
% Sistema: f1(alpha, beta) = 1 - alpha - exp(beta) - ln(gamma1) = 0
%          f2(alpha, beta) = 1 - beta - exp(alpha) - ln(gamma2) = 0
%
% Derivadas parciales:
% df1/dalpha = -1
% df1/dbeta = -exp(beta)
% df2/dalpha = -exp(alpha)
% df2/dbeta = -1
%
% Jacobiana:
%     |      -1        -exp(beta) |
% J = |                            |
%     | -exp(alpha)       -1       |
%
% ENTRADA: X = [X(1); X(2)] = [alpha; beta] vector columna de 2x1
% SALIDA: J matriz 2x2
%
% Agustin Formenti

J(1,1) = -1;
J(1,2) = -exp(X(2));
J(2,1) = -exp(X(1));
J(2,2) = -1;

end
