function J = JF_ej2(X)
% Matriz Jacobiana para Ejercicio 2 - Actividad 8
% Sistema: f1(x,y) = x^2 - y^2 - 4x - 3 = 0
%          f2(x,y) = x - 2y + 1 = 0
%
% Jacobiana: J = | df1/dx  df1/dy |   | 2x-4   -2y |
%                | df2/dx  df2/dy | = |  1     -2  |
%
% ENTRADA: X = [X(1); X(2)] vector columna de 2x1
% SALIDA: J matriz 2x2
%
% Agustin Formenti

J(1,1) = 2*X(1) - 4;
J(1,2) = -2*X(2);
J(2,1) = 1;
J(2,2) = -2;

end
