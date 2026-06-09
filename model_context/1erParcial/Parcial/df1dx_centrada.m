% Recuperatorio - Ejercicio 1
% Alumno: Agustin Formenti
function dy = df1dx_centrada(f, x, h)

dy = (f(x + h) - f(x - h)) ./ (2*h);

end
