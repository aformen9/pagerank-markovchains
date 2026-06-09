function Y = G_ej3(X)
% Generatrices del ejercicio 3 - Actividad 7
% ENTRADA: X = [x, y] vector fila de dos componentes
% SALIDA: Y = [g1(x,y), g2(x,y)] vector fila de dos componentes
%
% Agustin Formenti

x = X(1);
y = X(2);

Y(1) = (8*x - 4*x^2 + y^2 + 1)/8;
Y(2) = (2*x - x^2 + 4*y - y^2 + 3)/4;

end
