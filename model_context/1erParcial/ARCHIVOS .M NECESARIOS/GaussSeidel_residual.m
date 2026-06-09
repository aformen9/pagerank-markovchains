function x = GaussSeidel_residual(A,b,x0,tol,itmax)
%% Metodo Iterativo de Gauss-Seidel - VERSION CON CRITERIO DE PARADA POR RESIDUAL
% Criterio de parada: ||b - Ax^(k)|| < tol
% Imprime: iteracion k, aproximacion x^(k), vector residual r^(k)
%
% A     : matriz invertible nxn
% b     : lado derecho nx1
% x0    : estimacion inicial nx1
% tol   : tolerancia
% itmax : numero maximo de iteraciones
% x     : vector nx1 aproximacion a la solucion SEL Ax=b
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modificacion: Luciano Ponzellini Marinelli (2022)
% Modificacion Ejercicio 6: Agustin Formenti (2025)

n = length(b);
x0 = x0';

if diagdom(A) == 0
    disp('No se garantiza convergencia');
end

x = x0;
iter = 0;

% Calculo el residual inicial r^(0) = b - A*x^(0)
r = b - A * x0';

% Imprimo iteracion inicial
fprintf('Iteracion %d: x = [', iter);
for i = 1:n
    if i < n
        fprintf('%.6f, ', x0(i));
    else
        fprintf('%.6f]', x0(i));
    end
end
fprintf(' || r = [');
for i = 1:n
    if i < n
        fprintf('%.6e, ', r(i));
    else
        fprintf('%.6e]\n', r(i));
    end
end

while 1
   iter = iter + 1;

   % Itero con el metodo de Gauss-Seidel
   for i = 1:n
      x(i) = b(i);
      for j = 1:n
         if j ~= i
            x(i) = x(i) - A(i,j)*x(j);
         end
      end
      x(i) = x(i) / A(i,i);
   end

   % Calculo el residual r^(k) = b - A*x^(k)
   r = b - A * x';

   % Calculo la norma del residual
   norma_r = normap(r, 2);

   % Imprimo iteracion actual
   fprintf('Iteracion %d: x = [', iter);
   for i = 1:n
       if i < n
           fprintf('%.6f, ', x(i));
       else
           fprintf('%.6f]', x(i));
       end
   end
   fprintf(' || r = [');
   for i = 1:n
       if i < n
           fprintf('%.6e, ', r(i));
       else
           fprintf('%.6e]\n', r(i));
       end
   end

   % Criterio de parada: ||r|| < tol
   if norma_r < tol
       disp(' ')
       disp('Tolerancia alcanzada.')
       x = x';
       break
   end

   if iter == itmax
      disp(' ')
      disp('Numero maximo de iteraciones alcanzado.')
      x = x';
      break
   end

   x0 = x;
end

end
