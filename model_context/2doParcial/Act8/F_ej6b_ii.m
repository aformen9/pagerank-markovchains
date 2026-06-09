function Y = F_ej6b_ii(X)
% Funcion vectorial para Ejercicio 6(b) - Sistema (ii)
% Sistema: x^2 - x + 2y^2 + yz = 10
%          5x - 6y + z = 0
%          z - x^2 - y^2 = 0
%
% Forma estandar F(X) = 0:
% f1(x,y,z) = x^2 - x + 2y^2 + yz - 10 = 0
% f2(x,y,z) = 5x - 6y + z = 0
% f3(x,y,z) = z - x^2 - y^2 = 0
%
% ENTRADA: X = [X(1); X(2); X(3)] vector columna de 3x1
% SALIDA: Y = [Y(1); Y(2); Y(3)] vector columna de 3x1
%
% Agustin Formenti

Y(1) = X(1)^2 - X(1) + 2*X(2)^2 + X(2)*X(3) - 10;
Y(2) = 5*X(1) - 6*X(2) + X(3);
Y(3) = X(3) - X(1)^2 - X(2)^2;
Y = Y';

end
