function x = NewtonRaphsonDeriv(fnom,x0,tol,itmax)
% Método de Newton-Raphson utilizando derivación numérica
% ENTRADA
% fnom   : nombre función que define la ecuación
% x0     : estimación inicial
% tol    : tolerancia
% itmax  : número máximo de iteraciones
% SALIDA
% x      : raíz aproximada
% USAMOS
% dfidx  : función que calcula la derivada numérica primera aproximada
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modifcacion: Luciano Ponzellini Marinelli (2022)

fprintf(' Método iterativo de Newton-Raphson con derivada numérica\n\n')
fprintf(' Iter        x               f(x)               Error \n')

iter= 1;

while 1
   fx = fnom(x0);
   fpx = df1dx(fnom,x0);
   x = x0 - fx/fpx;

   fprintf('%3.0f  %10.6f  %10.6f  %10.6f \n', iter, x, fnom(x),abs(x-x0))

   if abs(x-x0) <= tol && abs(fnom(x)) <= tol
	  	fprintf(' Se alcanzó la tolerancia. \n\n')
		fprintf(' Resultado final:\n Raíz aproximada %12.6f \n',x)
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

