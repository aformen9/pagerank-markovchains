function x = Gauss_mod(A,b)
% Calculo solucion del sistema lineal Ax=b mediante eliminacion Gaussiana
% VERSION MODIFICADA: Imprime la matriz aumentada en cada paso
% Datos:
%     A matriz invertible nxn
%     b vector nx1
% Resultado:
%     x solucion nx1 del sistema Ax=b
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modificacion: Luciano Ponzellini Marinelli (2022)
% Modificacion adicional: Agustin Formenti (2025)

% Inicializacion
[n,n] = size(A);

% Calculo matriz ampliada
Aum = [A b];

disp('Matriz aumentada inicial:')
disp(Aum)
disp(' ')

for q=1:n-1

% Pivoteo parcial con escalonamiento
	S = max(abs(Aum(q:n,q:n))');
   [Y,j] = max(abs(Aum(q:n,q))./S');

% Intercambio fila q-esima con fila j-esima
	C = Aum(q,:);
	Aum(q,:) = Aum(j+q-1,:);
	Aum(j+q-1,:) = C;

   % Imprime despues del pivoteo
   if j > 1
       fprintf('Despues de intercambiar fila %d con fila %d:\n', q, j+q-1)
       disp(Aum)
       disp(' ')
   end

% Verificacion
	if (Aum(q,q) == 0)
   	  disp('A no es inversible. No hay solucion o no es unica');
    break
    end

% Proceso de eliminacion en columna q-esima
	for k=q+1:n
      m = Aum(k,q)/Aum(q,q);
      Aum(k,q:n+1) = Aum(k,q:n+1) - m*Aum(q,q:n+1);
   end

   % Imprime despues de la eliminacion
   fprintf('Despues de eliminar en columna %d:\n', q)
   disp(Aum)
   disp(' ')
end

disp('Matriz aumentada final (forma triangular superior):')
disp(Aum)
disp(' ')

% Sustitucion regresiva (hacia atras)
x(n) = Aum(n,n+1)/Aum(n,n);
for k=n-1:-1:1
   x(k) = (Aum(k,n+1) - Aum(k,k+1:n)*x(k+1:n)') / Aum(k,k);
end

x=x';
