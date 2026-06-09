function resultado = suma(v1, v2)
%% function suma: suma dos vectores y devuelve vector columna
% Input: v1, v2 - dos vectores fila
% Output: resultado - vector columna con la suma
% Autor: Agustin Formenti

% Sumo los vectores (MATLAB suma elemento a elemento)
resultado = v1 + v2;

% Convierto a columna si es necesario
% El operador ' (transpuesta) convierte fila en columna
resultado = resultado(:);  % (:) asegura que sea columna

end
