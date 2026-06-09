% Actividad 2 - Ejercicio 1a
% Errores absoluto, relativo y cifras significativas para x
% Alumno: Agustin Formenti

clear, clc

%% Datos del ejercicio
x_exacto = 2.71828182;
x_aprox  = 2.7182;

disp('Ejercicio 1a - Errores para x')
disp(' ')
fprintf('Valor exacto     : %.8f\n', x_exacto);
fprintf('Valor aproximado : %.4f\n', x_aprox);
disp(' ')

%% Calculo el error absoluto
% Error absoluto = |valor exacto - valor aproximado|
error_abs = abs(x_exacto - x_aprox);
fprintf('Error absoluto          : %.8f\n', error_abs);

%% Calculo el error relativo
% Error relativo = error absoluto / |valor exacto|
error_rel = error_abs / abs(x_exacto);
fprintf('Error relativo          : %.8e\n', error_rel);

%% Error relativo porcentual
error_rel_pct = error_rel * 100;
fprintf('Error relativo porcentual: %.6f %%\n', error_rel_pct);

%% Cifras significativas (llamo a la funcion)
% Uso el error relativo para estimar cuantas cifras son confiables
cifras = cifras_significativas(error_rel);
fprintf('Cifras significativas   : %d\n', cifras);

disp(' ')
disp('========== FIN EJERCICIO 1a ==========')


% Actividad 2 - Ejercicio 1b
% Errores absoluto, relativo y cifras significativas para y
% Alumno: Agustin Formenti

clear, clc

%% Datos del ejercicio
y_exacto = 98350;
y_aprox  = 98000;

disp('Ejercicio 1b - Errores para y')
disp(' ')
fprintf('Valor exacto     : %.0f\n', y_exacto);
fprintf('Valor aproximado : %.0f\n', y_aprox);
disp(' ')

%% Calculo el error absoluto
error_abs = abs(y_exacto - y_aprox);
fprintf('Error absoluto          : %.0f\n', error_abs);

%% Calculo el error relativo
error_rel = error_abs / abs(y_exacto);
fprintf('Error relativo          : %.8e\n', error_rel);

%% Error relativo porcentual
error_rel_pct = error_rel * 100;
fprintf('Error relativo porcentual: %.6f %%\n', error_rel_pct);

%% Cifras significativas (llamo a la funcion)
cifras = cifras_significativas(error_rel);
fprintf('Cifras significativas   : %d\n', cifras);

disp(' ')
disp('========== FIN EJERCICIO 1b ==========')


% Actividad 2 - Ejercicio 1c
% Errores absoluto, relativo y cifras significativas para z
% Alumno: Agustin Formenti

clear, clc

%% Datos del ejercicio
z_exacto = 0.000068;
z_aprox  = 0.00006;

disp('Ejercicio 1c - Errores para z')
disp(' ')
fprintf('Valor exacto     : %.8f\n', z_exacto);
fprintf('Valor aproximado : %.8f\n', z_aprox);
disp(' ')

%% Calculo el error absoluto
error_abs = abs(z_exacto - z_aprox);
fprintf('Error absoluto          : %.8f\n', error_abs);

%% Calculo el error relativo
error_rel = error_abs / abs(z_exacto);
fprintf('Error relativo          : %.8e\n', error_rel);

%% Error relativo porcentual
error_rel_pct = error_rel * 100;
fprintf('Error relativo porcentual: %.6f %%\n', error_rel_pct);

%% Cifras significativas (llamo a la funcion)
cifras = cifras_significativas(error_rel);
fprintf('Cifras significativas   : %d\n', cifras);

disp(' ')
disp('========== FIN EJERCICIO 1c ==========')




