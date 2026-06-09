% Actividad 2 - Ejercicio 7a
% Uso de la funcion taylor_exp para aproximar e^x
% Alumno: Agustin Formenti

clear, clc

%% Pido al usuario los datos de entrada
% x: punto donde quiero evaluar e^x
% n: numero de terminos de la suma de Taylor
x = input('Ingrese el valor de x: ');
n = input('Ingrese el numero de terminos n: ');

%% Calculo la aproximacion con el polinomio de Taylor
aprox = TaylorExp(x, n);

%% Calculo el valor "exacto" con la funcion exp de Octave
exacto = exp(x);

%% Muestro resultados
fprintf('\nAproximacion de e^x con polinomio de Taylor centrado en 0:\n');
fprintf('  x = %.6f,  n = %d terminos\n', x, n);
fprintf('  Aproximacion Taylor : %.12f\n', aprox);
fprintf('  Valor exacto exp(x) : %.12f\n', exacto);
fprintf('  Error absoluto      : %.12e\n', abs(exacto - aprox));

disp(' ')
disp('========== FIN EJERCICIO 7a ==========')


% Actividad 2 - Ejercicio 7b
% Uso de taylor_exp_tabla para imprimir sumas parciales y errores
% Alumno: Agustin Formenti

clear, clc

%% Pido valores de x y n
x = input('Ingrese el valor de x: ');
n = input('Ingrese el numero de terminos n: ');

%% Llamo a la funcion que imprime la tabla
S_final = TaylorExp_tabla(x, n);

%% Muestro un pequeño resumen al final
f_exacto = exp(x);
err_final = abs(f_exacto - S_final);

fprintf('\nResumen:\n');
fprintf('  Aproximacion final S_n = %.12f\n', S_final);
fprintf('  Valor exacto exp(x)    = %.12f\n', f_exacto);
fprintf('  Error absoluto final   = %.12e\n', err_final);

disp(' ')
disp('========== FIN EJERCICIO 7b ==========')


% Actividad 2 - Ejercicio 7c
% Analisis del error para x = 1, 10, 100 y n = 10, 15, 20
% usando el polinomio de Taylor de e^x centrado en 0
% Alumno: Agustin Formenti

clear, clc

%% Vectores de valores de x y n a estudiar
x_vals = [1, 10, 100];
n_vals = [10, 15, 20];

%% Inicializo matriz para guardar errores
% filas -> distintos x
% columnas -> distintos n
errores = zeros(length(x_vals), length(n_vals));

fprintf('Ejercicio 7c - Analisis del error\n\n');
fprintf('Tabla de errores absolutos |exp(x) - T_n(x)|\n');
fprintf('-----------------------------------------------------\n');
fprintf('          n = 10            n = 15            n = 20\n');
fprintf('-----------------------------------------------------\n');

%% Recorro todas las combinaciones de x y n
for i = 1:length(x_vals)
    x = x_vals(i);
    f_exacto = exp(x);

    fprintf('x = %3d  ', x);

    for j = 1:length(n_vals)
        n = n_vals(j);

        % Aproximacion con polinomio de Taylor hasta orden n
        aprox = TaylorExp(x, n);

        % Error absoluto
        err_abs = abs(f_exacto - aprox);
        errores(i, j) = err_abs;

        fprintf('   %12.4e', err_abs);
    end
    fprintf('\n');
end

fprintf('-----------------------------------------------------\n\n');

%% Comentario cualitativo sobre los errores
% Para x = 1:
%   Con n = 10, 15, 20 el error ya es muy chico porque la serie converge
%   rapido cerca del centro (0).
%
% Para x = 10:
%   Se necesita mayor cantidad de terminos para lograr un buen ajuste.
%   El error disminuye al aumentar n, pero mucho mas lento que para x = 1.
%
% Para x = 100:
%   La serie de Taylor centrada en 0 converge muy mal tan lejos del centro.
%   Incluso con n = 20 el error absoluto suele ser enorme:
%   el polinomio no alcanza para aproximar e^100 de forma razonable.
%
% Conclusion:
%   El polinomio de Taylor centrado en 0 es muy eficiente para valores
%   de x cercanos al centro, pero su precision se degrada fuerte cuando
%   x se aleja (caso x = 100). En esos casos se recomiendan tecnicas de
%   re-escalado o centrar la expansion en otro punto.

disp('========== FIN EJERCICIO 7c ==========')

