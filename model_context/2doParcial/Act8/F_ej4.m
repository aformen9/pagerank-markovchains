function Y = F_ej4(X)
% Funcion vectorial para Ejercicio 4 - Actividad 8
% Sistema: f1(x,y) = x^2 + y^2 - 2 = 0
%          f2(x,y) = xy - 1 = 0
%
% ENTRADA: X = [X(1); X(2)] vector columna de 2x1
% SALIDA: Y = [Y(1); Y(2)] vector columna de 2x1
%
% Agustin Formenti

Y(1) = X(1)^2 + X(2)^2 - 2;
Y(2) = X(1)*X(2) - 1;
Y = Y';

end
