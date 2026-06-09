function J = JF1(X)
% Matriz Jacobiana ejemplo introductorio Newton-Raphson SENL (ver lecturas)
% ENTRADA: X = [ X(1) X(2) ] vector columna de 2x1
% SALIDA: J matriz 2x2
%
% Luciano Ponzellini Marinelli (2022)

J(1,1) = 2*X(1)-2;
J(1,2) = -1;
J(2,1) = 2*X(1);
J(2,2) = 8*X(2);

end
