function J = JF_ej6b_ii(X)
% Matriz Jacobiana para Ejercicio 6(b) - Sistema (ii)
% Sistema: f1(x,y,z) = x^2 - x + 2y^2 + yz - 10 = 0
%          f2(x,y,z) = 5x - 6y + z = 0
%          f3(x,y,z) = z - x^2 - y^2 = 0
%
% Derivadas parciales:
% df1/dx = 2x - 1,  df1/dy = 4y + z,   df1/dz = y
% df2/dx = 5,       df2/dy = -6,       df2/dz = 1
% df3/dx = -2x,     df3/dy = -2y,      df3/dz = 1
%
% Jacobiana:
%     | 2x-1   4y+z   y  |
% J = |  5      -6    1  |
%     | -2x    -2y    1  |
%
% ENTRADA: X = [X(1); X(2); X(3)] vector columna de 3x1
% SALIDA: J matriz 3x3
%
% Agustin Formenti

J(1,1) = 2*X(1) - 1;
J(1,2) = 4*X(2) + X(3);
J(1,3) = X(2);

J(2,1) = 5;
J(2,2) = -6;
J(2,3) = 1;

J(3,1) = -2*X(1);
J(3,2) = -2*X(2);
J(3,3) = 1;

end
