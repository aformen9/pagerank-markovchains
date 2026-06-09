function ssum = SerieCoseno(x, tol, n)
% SerieCoseno.m: Evalua la representacion en serie de la funcion COSENO
%
%   ssum = SerieCoseno(x)
%   ssum = SerieCoseno(x, tol)
%   ssum = SerieCoseno(x, tol, n)
%
% ENTRADA:
%   x   : argumento de la funcion COSENO
%   tol : (opcional) tolerancia para la sumatoria (por defecto: tol = 5e-9)
%         La serie termina cuando abs(T_k / S_k) < tol
%         T_k: k-esimo termino, S_k: suma incluyendo el termino k
%   n   : (opcional) maximo numero de terminos no nulos (por defecto: n = 15)
%
% RESULTADO:
%   ssum: valor de la serie al cabo de n terminos o al satisfacer la tolerancia
%
% Autores: basado en SerieSeno.m (Signorelli - Sorribas, 2010)
% Modificacion coseno: Agustin Formenti

if nargin < 2, tol = 5e-9; end
if nargin < 3, n   = 15;    end

% Termino inicial de la serie de cos(x):
% cos(x) = 1 - x^2/2! + x^4/4! - ...
term = 1;
ssum = term;

fprintf('Valor aproximado de la funcion coseno (%f)\n\n n   termino      serie\n', x)
fprintf('%3d %11.3e %12.8f\n', 0, term, ssum)

% Recorro exponentes pares: 2,4,6,... hasta tener n terminos no nulos
for k = 2:2:(2*n)
    term = -term .* x .* x ./ (k .* (k-1));   % siguiente termino
    ssum = ssum + term;
    fprintf('%3d %11.3e %12.8f\n', k, term, ssum)

    if abs(term ./ ssum) < tol
        break
    end
end

fprintf('\n Error Total con %d terminos es %g\n\n', (k/2)+1, abs(ssum - cos(x)))

end

