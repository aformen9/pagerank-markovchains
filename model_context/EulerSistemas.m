function [t,x,y] = EulerSistemas(fnom,gnom,a,b,x0,y0,n)
% Método de Euler para aproximar la solución de un sistema de PVIs
% ENTRADA
% fnom   : nombre función que define la EDO x'=f(t,x,y)
% gnom   : nombre función que define la EDO y'=f(t,x,y)
% a,b       : extremos del intervalo [a,b]
% x0         : condición inicial x(t0)=x0
% y0         : condición inicial y(t0)=y0
% n           : número de pasos
% SALIDA
% t            : vector de abscisas
% x            : vector de ordenadas de x
% y            : vector de ordenadas de y
%
% Autor   : Luciano Ponzellini Marinelli (2022)

fprintf(' Método de Euler para sistemas de PVIs\n')
fprintf(' k         t_k      x_k      y_k \n')

h = (b-a)/n;
t = a:h:b;
x(1) = x0;
y(1) = y0;

fprintf('%3.0f %10.6f %10.6f %10.6f \n',0,t(1),x(1),y(1))

for k=1:n
    x(k+1) = x(k) + h*fnom(t(k),x(k),y(k));
    y(k+1) = y(k) + h*gnom(t(k),x(k),y(k));
    fprintf('%3.0f %10.6f %10.6f %10.6f \n',k, t(k+1),x(k+1),y(k+1));
end

fprintf('Tamaño del paso: %12.6f \n',h);
fprintf('Número de pasos: %3.0f \n',n);

end
