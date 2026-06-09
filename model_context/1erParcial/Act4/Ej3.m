% Actividad 4 - Ejercicio 3a
% Estudio grafico de f(x) = e^x - 3x en [0,4]
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion
% La funcion es f(x) = e^x - 3x
f = @(x) exp(x) - 3*x;

%% Discretizo el intervalo [0,4]
% Creo 400 puntos uniformemente espaciados
x = linspace(0, 4, 400);

%% Grafico la funcion
% Ploteo f(x) en azul con grosor 2
figure(1)
plot(x, f(x), 'b', 'linewidth', 2)
grid on
hold on

% Agrego la linea y=0 para ver donde cruza (raices)
plot(x, 0*x, 'k--')

xlabel('x')
ylabel('f(x)')
title('f(x) = e^x - 3x en [0,4]')
legend('f(x)', 'y=0', 'Location', 'best')

disp(' ')
disp('Ejercicio 3a - Estudio grafico')
disp(' ')
disp('Observacion: El grafico muestra que f(x) = 0 tiene DOS raices en [0,4].')
disp('Una raiz esta cerca de x = 0.6 y otra cerca de x = 1.5')

disp(' ')
disp('========== FIN EJERCICIO 3a ==========')


% Actividad 4 - Ejercicio 3b
% Aproximar raices de f(x) = e^x - 3x con Newton-Raphson
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion y su derivada
% La funcion es f(x) = e^x - 3x
% Su derivada es f'(x) = e^x - 3
f  = @(x) exp(x) - 3*x;
fp = @(x) exp(x) - 3;

%% Parametros del metodo
tol = 1e-12;
itmax = 100;

%% Aproximo la primera raiz (cerca de x = 0.6)
disp('===== PRIMERA RAIZ (x0 = 1) =====')
x0_1 = 1;
r1 = NewtonRaphson(f, fp, x0_1, tol, itmax);

disp(' ')

%% Aproximo la segunda raiz (cerca de x = 1.5)
disp('===== SEGUNDA RAIZ (x0 = 2) =====')
x0_2 = 2;
r2 = NewtonRaphson(f, fp, x0_2, tol, itmax);

%% Resumen
disp(' ')
disp('===== RESUMEN =====')
fprintf('Primera raiz:  r1 = %.15f\n', r1)
fprintf('Segunda raiz:  r2 = %.15f\n', r2)
disp(' ')
fprintf('Verificacion f(r1) = %.15e\n', f(r1))
fprintf('Verificacion f(r2) = %.15e\n', f(r2))

disp(' ')
disp('========== FIN EJERCICIO 3b ==========')


% Actividad 4 - Ejercicio 3c
% Analisis de convergencia de Newton-Raphson para f(x) = e^x - 3x
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion y su derivada
f  = @(x) exp(x) - 3*x;
fp = @(x) exp(x) - 3;

%% Analisis de convergencia
disp('Ejercicio 3c - Analisis de convergencia de Newton-Raphson')
disp(' ')

disp('CONVERGENCIA LOCAL:')
disp('------------------')
disp('Newton-Raphson tiene convergencia LOCAL, no GLOBAL.')
disp(' ')
disp('Para que N-R converja a una raiz r, se deben cumplir:')
disp('  1. f(r) = 0  (r es raiz)')
disp('  2. f''(r) ≠ 0  (raiz simple)')
disp('  3. x0 debe estar "suficientemente cerca" de r')
disp(' ')

%% Verifico condiciones para las dos raices
% Las raices aproximadas son r1 ≈ 0.619 y r2 ≈ 1.512

r1 = 0.619061286736510;
r2 = 1.512134551657842;

fprintf('Para r1 ≈ %.6f:\n', r1)
fprintf('  f(r1) ≈ %.15e  (muy cercano a 0)\n', f(r1))
fprintf('  f''(r1) = %.6f  (distinto de 0)\n', fp(r1))
disp('  --> Condiciones cumplidas para convergencia local')
disp(' ')

fprintf('Para r2 ≈ %.6f:\n', r2)
fprintf('  f(r2) ≈ %.15e  (muy cercano a 0)\n', f(r2))
fprintf('  f''(r2) = %.6f  (distinto de 0)\n', fp(r2))
disp('  --> Condiciones cumplidas para convergencia local')
disp(' ')

%% Pruebo con diferentes x0 para ver dependencia
disp('DEPENDENCIA DE x0:')
disp('------------------')
disp('Si elijo x0 = 1,  converge a r1 ≈ 0.619')
disp('Si elijo x0 = 2,  converge a r2 ≈ 1.512')
disp('Si elijo x0 = -1, puede diverger o converger a raiz fuera de [0,4]')
disp(' ')

%% Conclusion
disp('CONCLUSION:')
disp('-----------')
disp('La convergencia es LOCAL, no GLOBAL.')
disp('Depende fuertemente de la eleccion de x0.')
disp('Con x0 bien elegido (cerca de la raiz), N-R converge rapidamente.')
disp('Con x0 mal elegido (lejos de la raiz), N-R puede diverger.')

disp(' ')
disp('========== FIN EJERCICIO 3c ==========')
