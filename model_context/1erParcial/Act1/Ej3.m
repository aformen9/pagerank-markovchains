% Actividad 1 - Ejercicio 3a
% Prueba de funcion suma con vectores fila
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 3a ==========')
disp('Funcion suma: recibe dos vectores fila, devuelve vector columna')
v1 = [1, 2, 3];
v2 = [4, 5, 6];
disp('v1 = [1, 2, 3]')
disp('v2 = [4, 5, 6]')
resultado_a = suma(v1, v2)

disp(' ')
disp('========== FIN EJERCICIO 3a ==========')

% Actividad 1 - Ejercicio 3b
% Prueba de funcion suma_mejorada con diferentes tipos de vectores
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 3b ==========')
disp('Funcion suma_mejorada: acepta vectores fila o columna')

disp(' ')
disp('Caso 1: Ambos vectores fila')
v1_fila = [1, 2, 3];
v2_fila = [4, 5, 6];
resultado_b1 = suma_mejorada(v1_fila, v2_fila)

disp(' ')
disp('Caso 2: Ambos vectores columna')
v1_col = [1; 2; 3];
v2_col = [4; 5; 6];
resultado_b2 = suma_mejorada(v1_col, v2_col)

disp(' ')
disp('Caso 3: Un vector fila y otro columna')
resultado_b3 = suma_mejorada(v1_fila, v2_col)

disp(' ')
disp('========== FIN EJERCICIO 3b ==========')
