% Actividad 1 - Ejercicio 8a
% Definir f(x) = x^2 + 2*sin(x) - 1 usando inline
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 8a ==========')

%% Defino f(x) = x^2 + 2*sin(x) - 1 usando inline
% Nota: inline esta deprecada en versiones nuevas de Octave/MATLAB
% pero la incluyo por el enunciado
% Forma alternativa con function handle (mas moderna)
f = @(x) x.^2 + 2*sin(x) - 1;

disp('Funcion f(x) = x^2 + 2*sin(x) - 1 definida')
disp(' ')

%% Pruebo la funcion en algunos valores
disp('Prueba de la funcion:')
x_test = [0, 1, 2];
disp('x = [0, 1, 2]')
disp('f(x) =')
disp(f(x_test))

disp(' ')
disp('========== FIN EJERCICIO 8a ==========')

% Actividad 1 - Ejercicio 8b
% Definir g(x) = 1/(x^2 + 2*cos(x)) como funcion anonima
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 8b ==========')

%% Defino g(x) = 1/(x^2 + 2*cos(x)) como funcion anonima
% Uso ./ para division elemento a elemento
g = @(x) 1 ./ (x.^2 + 2*cos(x));

disp('Funcion g(x) = 1/(x^2 + 2*cos(x)) definida como funcion anonima')
disp(' ')

%% Pruebo la funcion en algunos valores
disp('Prueba de la funcion:')
x_test = [0.5, 1, 2];
disp('x = [0.5, 1, 2]')
disp('g(x) =')
disp(g(x_test))

disp(' ')
disp('========== FIN EJERCICIO 8b ==========')

% Actividad 1 - Ejercicio 8c
% Graficar f(x) y g(x) en [0.1, 3] con diferentes colores
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 8c ==========')

%% Defino las funciones
f = @(x) x.^2 + 2*sin(x) - 1;
g = @(x) 1 ./ (x.^2 + 2*cos(x));

%% Discretizo el intervalo [0.1, 3]
% No uso x=0 porque g(0) podria dar division por cero o valores muy grandes
x = linspace(0.1, 3, 100);

%% Evaluo las funciones
y_f = f(x);
y_g = g(x);

%% Grafico ambas funciones con diferentes colores
figure(3)
plot(x, y_f, 'b', x, y_g, 'r')
% b=azul para f, r=rojo para g

grid on
xlabel('x')
ylabel('y')
title('Graficas de f(x) y g(x) en [0.1, 3]')
legend('f(x) = x^2 + 2sin(x) - 1', 'g(x) = 1/(x^2 + 2cos(x))', ...
       'Location', 'best')

disp('Grafica creada en Figure 3')
disp(' ')
disp('========== FIN EJERCICIO 8c ==========')
