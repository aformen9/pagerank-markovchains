function Y = F_ej2c(X)
% Funcion vectorial para ejercicio 2c
% Agustin Formenti

Y(1) = 7*X(1)^3 - 10*X(1) - X(2) - 1;
Y(2) = 8*X(2)^3 - 11*X(2) + X(1) - 1;
Y = Y';

end
