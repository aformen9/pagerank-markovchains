function cifras = cifras_significativas(error_rel)
%% Calcula la cantidad de cifras significativas a partir del error relativo
% Input:
%   error_rel : error relativo (numero >= 0)
% Output:
%   cifras    : cantidad de cifras significativas segun el criterio:
%               max k tal que error_rel < 0.5 * 10^(-k)
% Autor: Agustin Formenti

%% Inicializo el contador de cifras
% Arranco probando desde k = 0 y voy aumentando mientras se cumpla la cota
cifras = 0;

while error_rel < 0.5 * 10^(-cifras)
    cifras = cifras + 1;      % aumento k mientras siga cumpliendo
end

% Al salir del while, la ultima k que cumplio es una menos
cifras = cifras - 1;

end

