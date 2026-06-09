function [t,y] = Euler(fnom,a,b,y0,n)
% Método de Euler para aproximar la solución de un PVI
% ENTRADA
% fnom   : nombre función que define la EDO y'=f(t,y)
% a,b       : extremos del intervalo [a,b]
% y0         : condición inicial y(t0)=y0
% n           : número de pasos
% SALIDA
% t            : vector de abscisas
% y            : vector de ordenadas
%
% Autor   : Luciano Ponzellini Marinelli (2022)

fprintf(' Método de Euler\n')
fprintf(' k         t_k            y_k \n')

h = (b-a)/n;
t = a:h:b;
y(1) = y0;

fprintf('%3.0f  %10.6f  %10.6f \n',0, t(1),y(1))

for k=1:n
    y(k+1) = y(k) + h*fnom(t(k),y(k));
    fprintf('%3.0f  %10.6f  %10.6f \n',k, t(k+1),y(k+1));
end

fprintf('Tamaño del paso: %12.6f \n',h);
fprintf('Número de pasos: %3.0f \n',n);

