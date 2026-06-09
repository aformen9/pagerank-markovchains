% Actividad 4 - Ejercicio 10a
% Aplicacion: Concentracion de medicamento en sangre - Parte a
% Calcular cantidad A que se puede inyectar
% Alumno: Agustin Formenti

clear, clc

%% Problema
disp('Ejercicio 10a - Aplicacion: Concentracion de medicamento')
disp(' ')
disp('La concentracion en sangre de un medicamento es:')
disp('  c(t) = A*t*e^(-t/3)  [mg/ml]')
disp(' ')
disp('donde:')
disp('  A = cantidad inyectada (unidades)')
disp('  t = tiempo en horas')
disp(' ')
disp('Condiciones:')
disp('  - La concentracion maxima es 1 mg/ml (limite autorizado)')
disp('  - El maximo se alcanza a las 3 horas')
disp(' ')

%% Calculo del maximo
% Para hallar el maximo, derivo c(t) e igualo a cero:
% c(t) = A*t*e^(-t/3)
% c'(t) = A*e^(-t/3) + A*t*(-1/3)*e^(-t/3) = A*e^(-t/3)*(1 - t/3)
% c'(t) = 0  cuando  1 - t/3 = 0  -->  t = 3 horas

disp('ANALISIS:')
disp('---------')
disp('Para hallar el tiempo del maximo, derivo c(t) = A*t*e^(-t/3):')
disp(' ')
disp('  c''(t) = A*e^(-t/3) * (1 - t/3)')
disp(' ')
disp('  c''(t) = 0  cuando  t = 3 horas')
disp(' ')
disp('Confirmo que el maximo ocurre a las 3 horas (dato del problema).')
disp(' ')

%% Calculo de A
% En t=3, la concentracion debe ser c(3) = 1 mg/ml:
% c(3) = A*3*e^(-3/3) = 3*A*e^(-1) = 1
% Entonces: A = 1/(3*e^(-1)) = e/3

A = exp(1) / 3;

disp('CALCULO DE A:')
disp('-------------')
disp('En t = 3 horas, la concentracion debe ser maxima e igual a 1 mg/ml:')
disp(' ')
disp('  c(3) = A*3*e^(-1) = 1')
disp(' ')
disp('Despejando:')
disp('  3*A*e^(-1) = 1')
disp('  A = e/3')
disp(' ')

%% Resultado
disp('===== RESULTADO =====')
fprintf('Cantidad a inyectar:  A = %.10f unidades\n', A)
fprintf('                      A = e/3 = %.10f unidades\n', exp(1)/3)
disp(' ')

% Verifico
c_max = A * 3 * exp(-1);
fprintf('Verificacion: c(3) = %.10f mg/ml\n', c_max)

disp(' ')
disp('INTERPRETACION:')
disp('---------------')
fprintf('Se pueden inyectar %.6f unidades de medicamento.\n', A)
disp('Con esta cantidad, la concentracion maxima sera exactamente')
disp('1 mg/ml a las 3 horas, cumpliendo el limite autorizado.')

disp(' ')
disp('========== FIN EJERCICIO 10a ==========')


% Actividad 4 - Ejercicio 10b
% Aplicacion: Concentracion de medicamento en sangre - Parte b
% Determinar tiempo para aplicar segunda dosis (cuando c = 0.25 mg/ml)
% Alumno: Agustin Formenti

clear, clc

%% Datos del problema
disp('Ejercicio 10b - Aplicacion: Segunda dosis de medicamento')
disp(' ')
disp('Del ejercicio anterior, sabemos que A = e/3')
disp(' ')
disp('La concentracion es:')
disp('  c(t) = (e/3)*t*e^(-t/3)  [mg/ml]')
disp(' ')
disp('Queremos hallar t tal que c(t) = 0.25 mg/ml')
disp('para aplicar la segunda dosis.')
disp(' ')

%% Defino A y las funciones
A = exp(1) / 3;

% Queremos resolver: A*t*e^(-t/3) = 0.25
% Es decir: f(t) = A*t*e^(-t/3) - 0.25 = 0
% f'(t) = A*e^(-t/3)*(1 - t/3)

f  = @(t) A*t.*exp(-t/3) - 0.25;
fp = @(t) A*exp(-t/3).*(1 - t/3);

%% Parametros del metodo
x0 = 5;          % aproximacion inicial razonable (despues del pico en t=3)
tol = 1e-10;
itmax = 100;

%% Aplico Newton-Raphson
disp('Aplicando Newton-Raphson:')
disp(' ')

t = NewtonRaphson(f, fp, x0, tol, itmax);

%% Resultados
disp(' ')
disp('===== RESULTADO =====')
fprintf('Tiempo para segunda dosis:  t = %.10f horas\n', t)
fprintf('                            t = %.2f minutos\n', t*60)
fprintf('                            t = %.0f horas y %.0f minutos\n', ...
        floor(t), (t - floor(t))*60)
disp(' ')

% Verifico el resultado
c_final = A * t * exp(-t/3);
fprintf('Verificacion: c(%.6f) = %.10f mg/ml\n', t, c_final)
fprintf('Error: |c(t) - 0.25| = %.10e\n', abs(c_final - 0.25))

disp(' ')
disp('INTERPRETACION:')
disp('---------------')
fprintf('La segunda dosis debe aplicarse aproximadamente %.2f horas\n', t)
fprintf('despues de la primera, lo que equivale a %.0f minutos.\n', t*60)
disp(' ')
disp('En ese momento, la concentracion habra bajado a 0.25 mg/ml,')
disp('que es el limite para aplicar la siguiente dosis.')

disp(' ')
disp('========== FIN EJERCICIO 10b ==========')
