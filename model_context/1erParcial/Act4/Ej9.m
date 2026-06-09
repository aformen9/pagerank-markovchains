% Actividad 4 - Ejercicio 9
% Aplicacion: Principio de Arquimedes - Esfera sumergida
% Aproximar altura h sumergida usando Newton-Raphson
% Alumno: Agustin Formenti

clear, clc

%% Problema
disp('Ejercicio 9 - Aplicacion: Principio de Arquimedes')
disp(' ')
disp('Una esfera de radio 1 cm y densidad γ = 0.75 gm/cm^3')
disp('esta parcialmente sumergida en agua.')
disp(' ')
disp('El equilibrio de fuerzas da la ecuacion:')
disp('  h^3 - 3h^2 + 3 = 0')
disp(' ')
disp('donde h es la altura de la parte sumergida.')
disp(' ')

%% Defino la funcion y su derivada
% f(h) = h^3 - 3h^2 + 3
% f'(h) = 3h^2 - 6h
f  = @(h) h.^3 - 3*h.^2 + 3;
fp = @(h) 3*h.^2 - 6*h;

%% Parametros del metodo
x0 = 0.5;        % aproximacion inicial razonable
tol = 1e-10;
itmax = 100;

%% Aplico Newton-Raphson
disp('Aplicando Newton-Raphson:')
disp(' ')

h = NewtonRaphson(f, fp, x0, tol, itmax);

%% Resultados
disp(' ')
disp('===== RESULTADO =====')
fprintf('Altura sumergida:     h = %.10f cm\n', h)
fprintf('Radio de la esfera:   r = 1.0 cm\n')
fprintf('Porcentaje sumergido: %.2f%%\n', (h/2)*100)
disp(' ')

% Verifico el resultado
fprintf('Verificacion: f(%.6f) = %.10e\n', h, f(h))

disp(' ')
disp('INTERPRETACION:')
disp('---------------')
fprintf('La esfera se hunde aproximadamente %.4f cm de sus 2 cm de diametro.\n', h)
fprintf('Esto representa el %.1f%% del diametro total.\n', (h/2)*100)
disp(' ')
disp('Nota: Como la densidad es 0.75 (menor que 1), la esfera flota.')
disp('El volumen sumergido debe ser 75% del volumen total segun Arquimedes.')

disp(' ')
disp('========== FIN EJERCICIO 9 ==========')
