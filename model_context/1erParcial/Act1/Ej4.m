% Actividad 1 - Ejercicio 4a
% Prueba de funcion cuad
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 4a ==========')
disp('Funcion cuad: calcula raices de ax^2 + bx + c = 0')
disp(' ')

%% Prueba 1: Raices reales distintas (x^2 - 5x + 6 = 0 -> x=2, x=3)
disp('Caso 1: x^2 - 5x + 6 = 0 (raices: 2 y 3)')
[x1, x2] = cuad(1, -5, 6);
fprintf('x1 = %.4f, x2 = %.4f\n', x1, x2);

disp(' ')
%% Prueba 2: Raiz doble (x^2 - 4x + 4 = 0 -> x=2 doble)
disp('Caso 2: x^2 - 4x + 4 = 0 (raiz doble: 2)')
[x1, x2] = cuad(1, -4, 4);
fprintf('x1 = %.4f, x2 = %.4f\n', x1, x2);

disp(' ')
%% Prueba 3: Raices complejas (x^2 + 2x + 5 = 0)
disp('Caso 3: x^2 + 2x + 5 = 0 (raices complejas)')
[x1, x2] = cuad(1, 2, 5);
fprintf('x1 = %.4f + %.4fi\n', real(x1), imag(x1));
fprintf('x2 = %.4f + %.4fi\n', real(x2), imag(x2));

disp(' ')
disp('========== FIN EJERCICIO 4a ==========')

% Actividad 1 - Ejercicio 4b
% Prueba de funcion cuad_mejorada que informa tipo de raices
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 4b ==========')
disp('Funcion cuad_mejorada: informa el tipo de raices')
disp(' ')

%% Caso 1: Raices reales distintas
disp('Caso 1: x^2 - 5x + 6 = 0')
[x1, x2] = cuad_mejorada(1, -5, 6);

disp(' ')
%% Caso 2: Raices reales iguales
disp('Caso 2: x^2 - 4x + 4 = 0')
[x1, x2] = cuad_mejorada(1, -4, 4);

disp(' ')
%% Caso 3: Raices complejas conjugadas
disp('Caso 3: x^2 + 2x + 5 = 0')
[x1, x2] = cuad_mejorada(1, 2, 5);

disp(' ')
disp('========== FIN EJERCICIO 4b ==========')
