function x = Jacobi(A,b,x0,tol,itmax)
% Metodo iterativo de Jacobi
% A     : matriz invertible nxn 
% b     : lado derecho nx1
% x0    : estimación inicial nx1
% tol   : tolerancia
% itmax : número máximo de iteraciones
% x     : vector nx1 aproximación solución SEL Ax=b
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modificacion: Luciano Ponzellini Marinelli (2022)

n = length(b);
x0=x0';

if diagdom(A) == 0
    disp('No se garantiza convergencia');	
end

iter = 0;

while 1   
   iter=iter + 1;
   for i =1:n
      x(i) = b(i);
      for j=1:n
         if j~= i
            x(i) = x(i) - A(i,j)*x0(j);
         end 
      end
      x(i) = x(i) / A(i,i);
   end
   
   err = normap(x-x0,2);
   
   %disp(x)
   
   if err < tol
       disp('Tolerancia alcanzada.')
       x=x';  break
   end

   if iter == itmax
       disp('Número máximo de iteraciones alcanzado')
       x=x';  break
   end
   
   x0 = x;
end



