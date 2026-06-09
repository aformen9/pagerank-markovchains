function Y = F_ej6b_i(X)
% Funcion vectorial para Ejercicio 6(b) - Sistema (i)
% Sistema: x^2 - x + y^2 + z^2 = 5
%          x^2 + y^2 - y + z^2 = 4
%          x^2 + y^2 + z^2 + z = 6
%
% Forma estandar F(X) = 0:
% f1(x,y,z) = x^2 - x + y^2 + z^2 - 5 = 0
% f2(x,y,z) = x^2 + y^2 - y + z^2 - 4 = 0
% f3(x,y,z) = x^2 + y^2 + z^2 + z - 6 = 0
%
% ENTRADA: X = [X(1); X(2); X(3)] vector columna de 3x1
% SALIDA: Y = [Y(1); Y(2); Y(3)] vector columna de 3x1
%
% Agustin Formenti

Y(1) = X(1)^2 - X(1) + X(2)^2 + X(3)^2 - 5;
Y(2) = X(1)^2 + X(2)^2 - X(2) + X(3)^2 - 4;
Y(3) = X(1)^2 + X(2)^2 + X(3)^2 + X(3) - 6;
Y = Y';

end
