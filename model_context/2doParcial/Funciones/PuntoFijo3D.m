function [Pk,iter] = PuntoFijo3D(Fnom,P0,tol,itmax)
% Metodo iterativo de Punto Fijo para 3 variables
% Datos
%   - Fnom: (string) función m-file que definen las generatrices
%   - P0: estimación inicial como vector fila (x_0, y_0, z_0)
%   - tol: tolerancia
%   - itmax: número iteraciones máximas
% Resultado
%   - Pk: aproximación solución
%   - iter: número iteraciones realizadas
%
% Agustin Formenti (basado en PuntoFijo.m)

fprintf(' Metodo iterativo de Punto Fijo 3D\n\n')
fprintf(' Iter      Pk                      Qk                      Rk\n')

iter = 0;
fprintf('%3.0f %15.7f %15.7f %15.7f\n', iter, P0)

while 1
   Pk = feval(Fnom,P0);
   err = abs(norm(Pk-P0));
   relerr = err / (norm(Pk)+eps);

   if(err < tol || relerr < tol)
	  	disp('Se alcanzo la tolerancia.')
		disp('Resultado final: ')
		fprintf(' %15.7f  %15.7f  %15.7f \n',Pk),  break
   end

   if iter >= itmax
	  disp('Numero de iteraciones maximo sobrepasado.'), break
   end

   iter = iter + 1;
   P0 = Pk;
   fprintf('%3.0f %15.7f %15.7f %15.7f\n', iter, Pk)

end
