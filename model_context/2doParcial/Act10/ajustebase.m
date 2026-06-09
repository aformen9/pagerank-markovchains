function c = ajustebase(x,y,base)
% ajustepoly: realiza un ajuste de curvas con funciones base cualesquiera
%
% ENTRADA:
%     - x: vector de abscisas
%     - y: vector de ordenadas
%     - base: nombre de la funcion cuyo resultado 
%       es una matriZ cuyas filas son las funciones base f(i)
%
% SALIDA:
%     - c: vector de coeficientes de la funcion de ajuste
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modificacion: Luciano Ponzellini Marinelli (2025)

gs = feval(base,x);
[n,m] = size(gs);

% Evaluacion de la matriz y del vector de coeficientes
for i=1:n
    for j=1:n
        A(i,j) = sum(gs(i,:).*gs(j,:));      
    end
    b(i) = sum(y.*gs(i,:));
end    

% Resolucion del SEL
c = Gauss(A,b');

% Reordena el vector c (necesario para utilizar polyval)
c = c(n:-1:1);
