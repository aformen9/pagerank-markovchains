function J = JF_ej7_original(X)
% Matriz Jacobiana para Ejercicio 7 - Modelo de Wilson (sistema original)
% Sistema: f1(Lambda1, Lambda2) = 1 - ln(Lambda1) - Lambda2 - ln(gamma1) = 0
%          f2(Lambda1, Lambda2) = 1 - ln(Lambda2) - Lambda1 - ln(gamma2) = 0
%
% Derivadas parciales:
% df1/dLambda1 = -1/Lambda1
% df1/dLambda2 = -1
% df2/dLambda1 = -1
% df2/dLambda2 = -1/Lambda2
%
% Jacobiana:
%     | -1/Lambda1    -1         |
% J = |                           |
%     |     -1      -1/Lambda2    |
%
% ENTRADA: X = [X(1); X(2)] = [Lambda1; Lambda2] vector columna de 2x1
% SALIDA: J matriz 2x2
%
% Agustin Formenti

J(1,1) = -1/X(1);
J(1,2) = 0;
J(2,1) = 0;
J(2,2) = -1/X(2);

end
