% Actividad 1 - Ejercicio 6b
% Calculo el producto de f1 y f2 en x = [-1, 0, 1] usando multi
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 6b ==========')
disp('Calculando el producto de f1 y f2 usando multi')
disp(' ')

%% Defino el vector de abscisas
x = [-1, 0, 1];
disp('Vector x = [-1, 0, 1]')
disp(' ')

%% Llamo a la funcion multi con f1 y f2
% Paso las funciones como function handles usando @
resultado = multi(@f1, @f2, x);

%% Muestro los resultados
disp('f1(x) = x^3 - x - 1:')
disp(f1(x))

disp('f2(x) = e^(-x) - x:')
disp(f2(x))

disp('Producto f1(x) .* f2(x):')
disp(resultado)

disp(' ')
disp('========== FIN EJERCICIO 6b ==========')
