function x1 = rcuad2(x0,tol)
% rcuad2: Aproxima la raiz cuadrada de 2
% ENTRADA:
% x0 = aproximacion inicial de la raiz de 2
% tol = (optional) tolerancia admitida (valor por defecto: tol = 5e-9)
% SALIDA:
% ssum = valor de la serie al cabo de n terminos o al satisfacer la tolerancia
% Autor: Luciano Ponzellini Marinelli (2015)

clc   % limpio salida MATLAB

if nargin < 2
    tol = 5e-9;   % tolerancia por defecto
end

fprintf(' Valor inicial aproximado: %g\n\n  n   raiz             error\n',x0)

x1 = .5*(x0+2/x0);   % inicio aproximacion
err = abs(x1-x0);   % calculo error entre aproximaciones
k=1;   % contador

fprintf('%3d  %12.15f  %12.15f\n',k,x1,err)   % imprimo valor inicial

while err>tol   % verifico convergencia
    x0 = x1; 
    x1 = .5*(x0+2/x0);   % actualiza termino aproximado
    err = abs(x1-x0);
    k = k +1;
    fprintf('%3d  %12.15f  %12.15f\n',k,x1,err)   % imprimo valores aproximados
end

fprintf('\nValor final aproximado: %12.15f\n',x1) % output
fprintf('Valor exacto MATLAB   : %12.15f\n',sqrt(2)) % exacto
fprintf('Error absoluto   : %12.15f\n',abs(x1-sqrt(2))) % error final

%end (Matlab)
%endfunction (Octave)

