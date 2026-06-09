function [t,x,y,z] = EulerSistemas3x3(fnom,gnom,hnom,a,b,x0,y0,z0,n)
% Método de Euler para aproximar la solución de un sistema de PVIs
% ENTRADA
% fnom   : nombre función que define la EDO x'=f(t,x,y,z)
% gnom   : nombre función que define la EDO y'=g(t,x,y,z)
% a,b       : extremos del intervalo [a,b]
% x0         : condición inicial x(t0)=x0
% y0         : condición inicial y(t0)=y0
% z0         : condición inicial z(t0)=z0
% n           : número de pasos
% SALIDA
% t            : vector de abscisas
% x            : vector de ordenadas de x
% y            : vector de ordenadas de y
% z            : vector de ordenadas de z
%
% Autor   : Luciano Ponzellini Marinelli (2024)

fprintf(' Método de Euler para sistemas de PVIs\n')
fprintf(' k         t_k      x_k      y_k      z_k\n')

h = (b-a)/n;
t = a:h:b;
x(1) = x0;
y(1) = y0;
z(1) = z0;

fprintf('%3.0f %10.6f %10.6f %10.6f %10.6f \n',0,t(1),x(1),y(1),z(1))

for k=1:n
    x(k+1) = x(k) + h*fnom(t(k),x(k),y(k),z(k));
    y(k+1) = y(k) + h*gnom(t(k),x(k),y(k),z(k));
    z(k+1) = z(k) + h*hnom(t(k),x(k),y(k),z(k));
    fprintf('%3.0f %10.6f %10.6f %10.6f %10.6f \n',k, t(k+1),x(k+1),y(k+1),z(k+1));
end

fprintf('Tamaño del paso: %12.6f \n',h);
fprintf('Número de pasos: %3.0f \n',n);

end
