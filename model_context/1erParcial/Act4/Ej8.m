% Actividad 4 - Ejercicio 8
% Aplicacion: Concentracion de bacterias en un lago
% Determinar tiempo t para que c(t) = 9 usando Newton-Raphson
% Alumno: Agustin Formenti

clear, clc

%% Problema
disp('Ejercicio 8 - Aplicacion: Concentracion de bacterias')
disp(' ')
disp('La concentracion de bacterias en un lago decrece segun:')
disp('  c(t) = 70*e^(-1.5t) + 25*e^(-0.075t)')
disp(' ')
disp('Queremos hallar t tal que c(t) = 9')
disp(' ')

%% Defino la funcion y su derivada
% Queremos resolver: c(t) = 9
% Es decir: 70*e^(-1.5t) + 25*e^(-0.075t) - 9 = 0
% Defino f(t) = 70*e^(-1.5t) + 25*e^(-0.075t) - 9
% f'(t) = -105*e^(-1.5t) - 1.875*e^(-0.075t)

f  = @(t) 70*exp(-1.5*t) + 25*exp(-0.075*t) - 9;
fp = @(t) -105*exp(-1.5*t) - 1.875*exp(-0.075*t);

%% Parametros del metodo
x0 = 1;          % aproximacion inicial razonable (1 hora)
tol = 1e-10;
itmax = 100;

%% Aplico Newton-Raphson
disp('Aplicando Newton-Raphson:')
disp(' ')

t = NewtonRaphson(f, fp, x0, tol, itmax);

%% Resultados
disp(' ')
disp('===== RESULTADO =====')
fprintf('Tiempo requerido:     t = %.10f horas\n', t)
fprintf('Equivale a:           t = %.2f minutos\n', t*60)
disp(' ')

% Verifico el resultado
c_final = 70*exp(-1.5*t) + 25*exp(-0.075*t);
fprintf('Verificacion: c(%.6f) = %.10f\n', t, c_final)
fprintf('Error: |c(t) - 9| = %.10e\n', abs(c_final - 9))

disp(' ')
disp('INTERPRETACION:')
disp('---------------')
fprintf('La concentracion de bacterias se reduce a 9 mg/ml\n')
fprintf('aproximadamente %.2f horas (%.0f minutos) despues.\n', t, t*60)

disp(' ')
disp('========== FIN EJERCICIO 8 ==========')
