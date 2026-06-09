function J = JF_ej3(X)
% Matriz Jacobiana para Ejercicio 3 - Actividad 8
% Sistema: f1(x,y) = x - 0.7*sen(x) + 0.2*cos(y) = 0
%          f2(x,y) = y - 0.7*cos(x) - 0.2*sen(y) = 0
%
% Derivadas parciales:
% df1/dx = 1 - 0.7*cos(x)
% df1/dy = -0.2*sen(y)
% df2/dx = 0.7*sen(x)
% df2/dy = 1 - 0.2*cos(y)
%
% Jacobiana: J = | 1 - 0.7*cos(x)    -0.2*sen(y)    |
%                | 0.7*sen(x)        1 - 0.2*cos(y) |
%
% ENTRADA: X = [X(1); X(2)] vector columna de 2x1
% SALIDA: J matriz 2x2
%
% Agustin Formenti

J(1,1) = 1 - 0.7*cos(X(1));
J(1,2) = -0.2*sin(X(2));
J(2,1) = 0.7*sin(X(1));
J(2,2) = 1 - 0.2*cos(X(2));

end
