function ecm = ECM(x, y, c, tipo)
% ECM: calcula el error cuadrático medio
%
% ENTRADA:
%     - x: vector de abscisas (datos originales)
%     - y: vector de ordenadas (datos originales)
%     - c: vector de coeficientes de la función de ajuste
%     - tipo: tipo de función ('poly' para polinomio, 'base' para base personalizada)
%
% SALIDA:
%     - ecm: error cuadrático medio
%
% Autor: Agustín Formenti (2025)

%% Obtenemos la cantidad de puntos
n = length(x);

%% Calculamos los valores ajustados según el tipo de función
if strcmp(tipo, 'poly')
    %% Si es polinomio, usamos polyval
    y_ajustado = polyval(c, x);
else
    %% Si es otra función, asumimos que se pasa directamente y_ajustado como c
    y_ajustado = c;
end

%% Calculamos el error cuadrático medio
%% ECM = (1/n) * sum((y_i - y_ajustado_i)^2)
ecm = (1/n) * sum((y - y_ajustado).^2);

end
