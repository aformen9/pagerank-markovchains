function J = JF_ej6b_i(X)
% Matriz Jacobiana para Ejercicio 6(b) - Sistema (i)
% Sistema: f1(x,y,z) = x^2 - x + y^2 + z^2 - 5 = 0
%          f2(x,y,z) = x^2 + y^2 - y + z^2 - 4 = 0
%          f3(x,y,z) = x^2 + y^2 + z^2 + z - 6 = 0
%
% Derivadas parciales:
% df1/dx = 2x - 1,  df1/dy = 2y,       df1/dz = 2z
% df2/dx = 2x,      df2/dy = 2y - 1,   df2/dz = 2z
% df3/dx = 2x,      df3/dy = 2y,       df3/dz = 2z + 1
%
% Jacobiana:
%     | 2x-1   2y     2z   |
% J = | 2x     2y-1   2z   |
%     | 2x     2y     2z+1 |
%
% ENTRADA: X = [X(1); X(2); X(3)] vector columna de 3x1
% SALIDA: J matriz 3x3
%
% Agustin Formenti

J(1,1) = 2*X(1) - 1;
J(1,2) = 2*X(2);
J(1,3) = 2*X(3);

J(2,1) = 2*X(1);
J(2,2) = 2*X(2) - 1;
J(2,3) = 2*X(3);

J(3,1) = 2*X(1);
J(3,2) = 2*X(2);
J(3,3) = 2*X(3) + 1;

end
