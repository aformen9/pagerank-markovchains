function [Pk,iter] = PuntoFijo(Fnom,P0,tol,itmax)
% Datos
%   - Fnom: (string) función m-file que definen las  generatrices
%   - P0: estimación inicial como vector fila (x_0,y_0)
%   - tol: tolerancia
%   - itmax: número iteraciones máximas
% Resultado
%   - Pk: aproximación solución
%   - iter: número iteraciones realizadas
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modifcacion: Luciano Ponzellini Marinelli (2022)

fprintf(' Método iterativo de Punto Fijo\n\n')
fprintf(' Iter      Pk                      Qk\n')

iter = 0;
fprintf('%3.0f %15.7f %15.7f\n', iter, P0)

while 1
   Pk = feval(Fnom,P0);
   err = abs(norm(Pk-P0));
   relerr = err / (norm(Pk)+eps);

   if(err < tol || relerr < tol)
	  	disp('Se alcanzó la tolerancia.')
		disp('Resultado final: ')
		fprintf(' %15.7f  %15.7f \n',Pk),  break
   end

   if iter >= itmax
	  disp('Número de iteracioneas máximo sobrepasado.'), break
   end


   iter = iter + 1;
   P0 = Pk;
   fprintf('%3.0f %15.7f %15.7f\n', iter, Pk)

end


