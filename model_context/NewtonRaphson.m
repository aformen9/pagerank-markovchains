function x = NewtonRaphson(fnom,fpnom,x0,tol,itmax)
% Método de Newton-Raphson
% ENTRADA
% fnom   : nombre función que define la ecuación 
% fpnom  : nombre de la derivada de la función fnom 
% x0     : estimación inicial
% tol    : tolerancia
% itmax  : número máximo de iteraciones
% SALIDA
% x      : raíz aproximada
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modifcacion: Luciano Ponzellini Marinelli (2022)

fprintf(' Método iterativo de Newton-Raphson\n\n')
fprintf(' Iter       x              f(x)              Error\n')

iter= 1;

while 1
   fx = fnom(x0);
   fpx = fpnom(x0);
   x = x0 - fx/fpx;
      
   fprintf('%3.0f  %10.6f  %10.6f  %10.6f \n', iter, x, fnom(x),abs(x-x0))
   
   if abs(x-x0) <= tol && abs(fnom(x)) <= tol 
	  	fprintf(' Se alcanzó la tolerancia. \n\n')
		fprintf(' Resultado final:\n Raíz aproximada = %12.6f \n',x)
      return
   end
   
   x0 = x;
   iter = iter +1;
   
   if iter > itmax 
	   fprintf(' Número de iteraciones máximo alcanzado. \n\n')
		fprintf(' Resultado parcial:\n Raíz aproximada = %12.6f \n',x)
   	break
   end
end
