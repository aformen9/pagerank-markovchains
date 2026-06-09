function Y = F_ej7_transformado(X)
% Funcion vectorial para Ejercicio 7 - Modelo de Wilson (sistema transformado)
% Sustituciones: alpha = ln(Lambda1), beta = ln(Lambda2)
%
% Sistema original:
%   ln(gamma1) = 1 - ln(Lambda1) - Lambda2
%   ln(gamma2) = 1 - ln(Lambda2) - Lambda1
%
% Con las sustituciones:
%   ln(gamma1) = 1 - alpha - exp(beta)
%   ln(gamma2) = 1 - beta - exp(alpha)
%
% Forma estandar F(X) = 0:
% f1(alpha, beta) = 1 - alpha - exp(beta) - ln(gamma1) = 0
% f2(alpha, beta) = 1 - beta - exp(alpha) - ln(gamma2) = 0
%
% ENTRADA: X = [X(1); X(2)] = [alpha; beta] vector columna de 2x1
% SALIDA: Y = [Y(1); Y(2)] vector columna de 2x1
%
% Agustin Formenti

gamma1 = 7.20;
gamma2 = 2.74;

% X(1) = alpha, X(2) = beta
Y(1) = 1 - X(1) - exp(X(2)) - log(gamma1);
Y(2) = 1 - X(2) - exp(X(1)) - log(gamma2);
Y = Y';

end
