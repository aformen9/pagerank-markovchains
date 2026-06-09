function resultado = multi(f1, f2, x)
%% function multi: multiplica dos funciones evaluadas en un vector de abscisas
% Input: f1, f2 - dos funciones (function handles)
%        x - vector de abscisas donde evaluar las funciones
% Output: resultado - vector con f1(x) .* f2(x)
% Autor: Agustin Formenti

% Evaluo ambas funciones en el vector x
valores_f1 = f1(x);
valores_f2 = f2(x);

% Multiplico elemento a elemento usando .*
resultado = valores_f1 .* valores_f2;

end
