% Actividad 4 - Ejercicio 7a
% Newton-Raphson modificado para raiz doble, imprimiendo cociente |e_{n+1}|/|e_n|
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion y su derivada
% f(x) = x^3 - 3x + 2 tiene una raiz doble en r = 1
% f(x) = (x-1)^2 * (x+2)
f  = @(x) x.^3 - 3*x + 2;
fp = @(x) 3*x.^2 - 3;

%% Parametros del metodo
x0 = 1.2;        % aproximacion inicial
tol = 1e-5;
itmax = 50;

disp('Ejercicio 7a - Newton-Raphson con raiz doble')
disp(' ')
disp('La funcion f(x) = x^3 - 3x + 2 tiene una raiz DOBLE en r = 1')
disp('Factorizacion: f(x) = (x-1)^2 * (x+2)')
disp(' ')

%% Aplico Newton-Raphson modificado que imprime |e_{n+1}|/|e_n|
% Esta funcion debe imprimir el cociente en cada iteracion
r = NewtonRaphsonMod(f, fp, x0, tol, itmax);

%% Analisis
disp(' ')
disp('OBSERVACION:')
disp('------------')
disp('El cociente |e_{n+1}|/|e_n| tiende a un valor cercano a 0.5')
disp(' ')
disp('INTERPRETACION:')
disp('---------------')
disp('Para raices MULTIPLES (multiplicidad α > 1), el metodo de')
disp('Newton-Raphson tiene convergencia LINEAL, no cuadratica.')
disp(' ')
disp('El factor de convergencia es:  C = (α-1)/α')
disp(' ')
disp('En nuestro caso, α = 2 (raiz doble), entonces:')
disp('  C = (2-1)/2 = 1/2 = 0.5')
disp(' ')
disp('Por eso el cociente |e_{n+1}|/|e_n| --> 0.5')

disp(' ')
disp('========== FIN EJERCICIO 7a ==========')


% Actividad 4 - Ejercicio 7b
% Newton-Raphson modificado con multiplicidad alpha para raices multiples
% Alumno: Agustin Formenti

clear, clc

%% Teoria
disp('Ejercicio 7b - Newton-Raphson modificado para raices multiples')
disp(' ')
disp('PROBLEMA:')
disp('---------')
disp('Newton-Raphson estandar tiene convergencia LINEAL para raices multiples.')
disp(' ')
disp('SOLUCION:')
disp('---------')
disp('Modificar el esquema iterativo usando la multiplicidad α:')
disp(' ')
disp('  x_{n+1} = x_n - α * f(x_n) / f''(x_n),    n >= 0')
disp(' ')
disp('donde α es la MULTIPLICIDAD de la raiz.')
disp(' ')
disp('Con esta modificacion, se RECUPERA la convergencia cuadratica.')
disp(' ')

%% Aplicacion a nuestro caso
disp('APLICACION:')
disp('-----------')
disp('Para f(x) = x^3 - 3x + 2 = (x-1)^2 * (x+2)')
disp('La raiz r = 1 tiene multiplicidad α = 2')
disp(' ')
disp('Entonces, el esquema modificado es:')
disp(' ')
disp('  x_{n+1} = x_n - 2 * f(x_n) / f''(x_n)')
disp(' ')

%% Defino la funcion y su derivada
f  = @(x) x.^3 - 3*x + 2;
fp = @(x) 3*x.^2 - 3;

%% Parametros
x0 = 1.2;
tol = 1e-5;
itmax = 50;
alpha = 2;   % multiplicidad de la raiz

%% Aplico Newton modificado con α = 2
disp('Aplicando Newton modificado con α = 2:')
disp(' ')

r = NewtonMultiple(f, fp, x0, tol, itmax, alpha);

%% Conclusion
disp(' ')
disp('CONCLUSION:')
disp('-----------')
disp('Con el esquema modificado (α = 2), la convergencia es mucho mas')
disp('rapida que con Newton estandar.')
disp(' ')
disp('El metodo converge en MENOS iteraciones y con convergencia cuadratica.')

disp(' ')
disp('========== FIN EJERCICIO 7b ==========')


% Actividad 4 - Ejercicio 7c
% Newton modificado imprimiendo |e_{n+1}|/|e_n|^alpha para raiz doble
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion y su derivada
% f(x) = x^3 - 3x + 2 tiene una raiz doble en r = 1
f  = @(x) x.^3 - 3*x + 2;
fp = @(x) 3*x.^2 - 3;

%% Parametros del metodo
x0 = 1.2;        % aproximacion inicial
tol = 1e-5;
itmax = 50;
alpha = 2;       % multiplicidad de la raiz
poder_cociente = 2;  % potencia para el cociente |e_{n+1}|/|e_n|^2

disp('Ejercicio 7c - Newton modificado con alpha=2, mostrando |e_{n+1}|/|e_n|^alpha')
disp(' ')
disp('Uso el esquema modificado:')
disp('  x_{n+1} = x_n - 2 * f(x_n) / f''(x_n)')
disp(' ')
disp('Y muestro el cociente |e_{n+1}|/|e_n|^2 en cada iteracion.')
disp(' ')

%% Aplico Newton modificado con alpha=2 y poder_cociente=2
x = NewtonRaphsonMod(f, fp, x0, tol, itmax, alpha, poder_cociente);

%% Analisis
disp(' ')
disp('FENOMENO OBSERVADO:')
disp('-------------------')
disp('El cociente |e_{n+1}|/|e_n|^2 tiende a una CONSTANTE.')
disp(' ')
disp('Esto confirma que el metodo modificado tiene convergencia')
disp('CUADRATICA (orden alpha = 2) para raices dobles.')
disp(' ')
disp('COMPARACION:')
disp('------------')
disp('  - Newton estandar:   |e_{n+1}|/|e_n| --> 0.5    (convergencia lineal)')
disp('  - Newton modificado: |e_{n+1}|/|e_n|^2 --> C   (convergencia cuadratica)')
disp(' ')
disp('donde C es una constante que depende de f y f''.')

disp(' ')
disp('========== FIN EJERCICIO 7c ==========')
