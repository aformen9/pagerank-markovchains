function x = DescompLU(A,b)
% Calculo solucion sistema lineal Ax=b mediante descomposicion LU
% Datos:
%     - A matriz invertible nxn
%     - b vector nx1
% Resultado:
%     - x solucion del sistema Ax=b
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modificacion: Luciano Ponzellini Marinelli (2022)

% inicializacion
[n,n] = size(A);

for q=1:n-1
% Pivoteo parcial con escalonamiento
	S = max(abs(A(q:n,q:n))');
   [Y,j] = max(abs(A(q:n,q))./S');
   
% Intercambio de la fila q-esima con la fila k-esima
	C = A(q,:);
	A(q,:) = A(j+q-1,:);
   A(j+q-1,:) = C;
   R = b(q);
   b(q) = b(j+q-1);
   b(j+q-1) = R;

% Verificacion
	if (A(q,q) == 0)
   	disp('A no es inversible. No hay solucion o no es unica');
      break
    end
   
% Proceso de eliminacion en la columna q-esima
	for k=q+1:n
      m = A(k,q)/A(q,q);
      A(k,q) = m;
      A(k,q+1:n) = A(k,q+1:n) - m*A(q,q+1:n);
   end
end

% Resolucion para determinar y con sustitucion progresiva (hacia adelante)
y(1) = b(1);
for k=2:n
   y(k) = b(k) - A(k,1:k-1)*y(1:k-1)';
end

% Resolucion para determinar x con sustitucion regresiva (hacia atras)
x(n) = y(n)/A(n,n);
for k=n-1:-1:1
	x(k) = (y(k) - A(k,k+1:n)*x(k+1:n)') / A(k,k);
end

x=x';
