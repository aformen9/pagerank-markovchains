function Y = F_ej3(X)
% Funcion vectorial para Ejercicio 3 - Actividad 8
% Sistema: x = 0.7*sen(x) - 0.2*cos(y)
%          y = 0.7*cos(x) + 0.2*sen(y)
%
% Pasado a forma estandar F(x,y) = 0:
% f1(x,y) = x - 0.7*sen(x) + 0.2*cos(y) = 0
% f2(x,y) = y - 0.7*cos(x) - 0.2*sen(y) = 0
%
% ENTRADA: X = [X(1); X(2)] vector columna de 2x1
% SALIDA: Y = [Y(1); Y(2)] vector columna de 2x1
%
% Agustin Formenti

Y(1) = X(1) - 0.7*sin(X(1)) + 0.2*cos(X(2));
Y(2) = X(2) - 0.7*cos(X(1)) - 0.2*sin(X(2));
Y = Y';

end
