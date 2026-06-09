% Actividad 4 - Ejercicio 2a
% Aproximar raiz de h(x) = x*sin(x) - 1 en [0,2] usando bisecciones
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion h(x)
% La funcion es h(x) = x*sin(x) - 1
% Queremos hallar x tal que h(x) = 0, es decir, x*sin(x) = 1
h = @(x) x .* sin(x) - 1;

%% Parametros del metodo
a = 0;
b = 2;
tol = 1e-12;
itmax = 100;

%% Llamo a bisecciones
% Uso el algoritmo general de bisecciones en [0,2]
r = bisecciones(h, a, b, tol, itmax);

%% Muestro resultados
disp('Ejercicio 2a - Aproximacion de raiz con bisecciones')
disp(' ')
fprintf('Raiz aproximada: %.15f\n', r)
fprintf('Verificacion h(r) = %.15e\n', h(r))

disp(' ')
disp('========== FIN EJERCICIO 2a ==========')

% Actividad 4 - Ejercicio 2b
% Bisecciones imprimiendo extremos y puntos medios de cada iteracion
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion h(x)
% La funcion es h(x) = x*sin(x) - 1
h = @(x) x .* sin(x) - 1;

%% Parametros iniciales
a = 0;
b = 2;
tol = 1e-12;
itmax = 100;

disp('Ejercicio 2b - Bisecciones con impresion de extremos')
disp(' ')

%% Llamo a bisecciones con verbose=true
% El parametro verbose=true hace que imprima a, b y c en cada iteracion
r = bisecciones(h, a, b, tol, itmax, true);

%% Resultado final
disp(' ')
fprintf('Aproximacion final: %.15f\n', r)
disp(' ')
disp('Conclusion: Los extremos a, b y el punto medio c convergen')
disp('todos al mismo valor, que es la raiz de la ecuacion.')

disp(' ')
disp('========== FIN EJERCICIO 2b ==========')


% Actividad 4 - Ejercicio 2c
% Determinar iteraciones necesarias para error de 1e-6
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion h(x)
% La funcion es h(x) = x*sin(x) - 1
h = @(x) x .* sin(x) - 1;

%% Parametros iniciales
% Intervalo [0,2] y tolerancia 1e-6
a = 0;
b = 2;
tol = 1e-6;
itmax = 100;

%% Llamo a bisecciones
% La funcion retorna la raiz y el numero de iteraciones
[r, k] = bisecciones(h, a, b, tol, itmax);

%% Muestro resultados
disp('Ejercicio 2c - Iteraciones necesarias para error < 1e-6')
disp(' ')
fprintf('Iteraciones necesarias: %d\n', k)
fprintf('Raiz aproximada:        %.10f\n', r)
fprintf('Error estimado:         %.10e\n', tol)

disp(' ')
disp('Nota: El error es aproximadamente (b-a)/2 en cada paso.')
disp('Para bisecciones, el error se reduce a la mitad en cada iteracion.')

disp(' ')
disp('========== FIN EJERCICIO 2c ==========')
