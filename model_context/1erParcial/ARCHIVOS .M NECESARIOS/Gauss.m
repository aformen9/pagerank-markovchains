function x = Gauss(A,b)
% Cálculo solución del sistema lineal Ax=b mediante eliminación Gaussiana
% Datos:
%     A matriz invertible nxn
%     b vector nx1
% Resultado:
%     x solucion nx1 del sistema Ax=b
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modificación: Luciano Ponzellini Marinelli (2022)

% Inicialización
[n,n] = size(A);

% Cálculo matriz ampliada
Aum = [A b];

for q=1:n-1
    
% Pivoteo parcial con escalonamiento
	S = max(abs(Aum(q:n,q:n))');
   [Y,j] = max(abs(Aum(q:n,q))./S');
   
% Intercambio fila q-ésima con fila j-ésima
	C = Aum(q,:);
	Aum(q,:) = Aum(j+q-1,:);
	Aum(j+q-1,:) = C;

% Verificación
	if (Aum(q,q) == 0)
   	  disp('A no es inversible. No hay solución o no es única');
    break
    end
   
% Proceso de eliminación en columna q-ésima
	for k=q+1:n
      m = Aum(k,q)/Aum(q,q);
      Aum(k,q:n+1) = Aum(k,q:n+1) - m*Aum(q,q:n+1);
   end
end

% Sustitución regresiva (hacia atrás)
x(n) = Aum(n,n+1)/Aum(n,n);
for k=n-1:-1:1
   x(k) = (Aum(k,n+1) - Aum(k,k+1:n)*x(k+1:n)') / Aum(k,k);
end

x=x';
