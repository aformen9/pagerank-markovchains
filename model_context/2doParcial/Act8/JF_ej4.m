function J = JF_ej4(X)
% Matriz Jacobiana para Ejercicio 4 - Actividad 8
% Sistema: f1(x,y) = x^2 + y^2 - 2 = 0
%          f2(x,y) = xy - 1 = 0
%
% Derivadas parciales:
% df1/dx = 2x
% df1/dy = 2y
% df2/dx = y
% df2/dy = x
%
% Jacobiana: J = | 2x   2y |
%                |  y    x |
%
% ENTRADA: X = [X(1); X(2)] vector columna de 2x1
% SALIDA: J matriz 2x2
%
% Agustin Formenti

J(1,1) = 2*X(1);
J(1,2) = 2*X(2);
J(2,1) = X(2);
J(2,2) = X(1);

end
