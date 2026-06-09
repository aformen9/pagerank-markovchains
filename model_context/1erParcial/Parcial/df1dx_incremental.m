% Recuperatorio - Ejercicio 1
% Alumno: Agustin Formenti
function dy = df1dx_incremental(f, x, h)

dy = (f(x + h) - f(x)) ./ h;

end

