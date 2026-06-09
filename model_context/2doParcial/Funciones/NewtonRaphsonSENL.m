function [Pk,iter,err] = NewtonRaphsonSENL(Fnom,Jnom,P0,tol,itmax)
% Entrada:
%   - Fnom funcion vectorial que define el sistema de ecuaciones no lineal
%   - Jnom funcion que define la matriz jacobiana del sistema
%   - P0 estimacion inicial vector columna de 2x1
%   - tol tolerancia
%   - itmax numero de iteraciones maximas
% Salida:
%   - Pk solucion aproximada
%   - iter numero de iteraciones realizadas
%   - err estimacion del error de P
% Usa:
% - utiliza Gauss.m para resolver el sistema lineal
%
% Luciano Ponzellini Marinelli (2022)

disp(' Método de Newton-Raphson bidimensional')
disp(' Iter    Pk           Qk')

iter = 0;
fprintf('%3.0f %12.6f %12.6f\n',iter,P0)

Pk = P0;
iter= 1;
while 1
   FX = feval(Fnom,Pk);
   Jacob = feval(Jnom,Pk);

   dP = Gauss(Jacob,-FX);

   err = norm(dP);
   relerr = err / (norm(Pk) + eps);

   Pk = Pk + dP;
   fprintf('%3.0f %12.6f %12.6f\n',iter,Pk)

   if err < tol || relerr < tol
      disp(' Se satisface la tolerancia.')
	  disp(' Resultado final: '), fprintf(' %12.6f \n',Pk), return
   end
   iter = iter +1;
   if iter > itmax
	   disp(' Numero de iteraciones maximo alcanzado.')
	   disp(' Resultado parcial: '), fprintf(' %12.6f \n',Pk), break
   end
end
