function Y = G_ej6_i(X)
% Generatrices del ejercicio 6b-i) - Actividad 7
% ENTRADA: X = [x, y, z] vector fila de tres componentes
% SALIDA: Y = [g1(x,y,z), g2(x,y,z), g3(x,y,z)] vector fila
%
% Agustin Formenti

x = X(1);
y = X(2);
z = X(3);

% Sistema original:
% x² - x + y² + z² = 5
% x² + y² - y + z² = 4
% x² + y² + z² + z = 6

% Despejo para Punto Fijo:
% x = x² + y² + z² - 5
% y = x² + y² + z² - 4
% z = -x² - y² - z² + 6

Y(1) = x^2 + y^2 + z^2 - 5;
Y(2) = x^2 + y^2 + z^2 - 4;
Y(3) = -x^2 - y^2 - z^2 + 6;

end
