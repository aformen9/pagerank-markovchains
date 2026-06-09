function Y = F_ej7_original(X)
% Funcion vectorial para Ejercicio 7 - Modelo de Wilson (sistema original)
% Sistema: ln(gamma1) = 1 - ln(Lambda1) - Lambda2
%          ln(gamma2) = 1 - ln(Lambda2) - Lambda1
%
% Con gamma1 = 7.20 y gamma2 = 2.74:
%   ln(7.20) = 1 - ln(Lambda1) - Lambda2
%   ln(2.74) = 1 - ln(Lambda2) - Lambda1
%
% Forma estandar F(X) = 0:
% f1(Lambda1, Lambda2) = 1 - ln(Lambda1) - Lambda2 - ln(gamma1) = 0
% f2(Lambda1, Lambda2) = 1 - ln(Lambda2) - Lambda1 - ln(gamma2) = 0
%
% ENTRADA: X = [X(1); X(2)] = [Lambda1; Lambda2] vector columna de 2x1
% SALIDA: Y = [Y(1); Y(2)] vector columna de 2x1
%
% Agustin Formenti

gamma1 = 7.20;
gamma2 = 2.74;

% X(1) = Lambda1, X(2) = Lambda2
Y(1) = 1 - log(X(1)) - X(2) - log(gamma1);
Y(2) = 1 - log(X(2)) - X(1) - log(gamma2);
Y = Y';

end
