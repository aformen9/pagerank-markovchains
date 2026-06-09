function Y = F1(X)
% Funcion vectorial ejemplo introductorio Newton-Raphson SENL (ver lecturas)
% ENTRADA: X = [ X(1) X(2) ] vector columna de 2x1
% SALIDA: Y = [ Y(1) Y(2) ] vector columna de 2x1
%
% Luciano Ponzellini Marinelli (2022)

Y(1) = X(1)^2 - 2*X(1) - X(2) + 0.5;
Y(2) = X(1)^2 + 4*X(2)^2 - 4.0;
Y=Y';

end
