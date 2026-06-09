function resultado = suma_mejorada(v1, v2)
%% function suma_mejorada: suma dos vectores (fila o columna) y devuelve vector columna
% Input: v1, v2 - dos vectores (pueden ser fila o columna)
% Output: resultado - vector columna con la suma
% Autor: Agustin Formenti

% Convierto ambos vectores a columna usando (:)
% El operador (:) "aplana" el vector en una columna
v1_col = v1(:);
v2_col = v2(:);

% Sumo los vectores columna
resultado = v1_col + v2_col;

end
