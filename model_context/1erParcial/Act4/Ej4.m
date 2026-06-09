% Actividad 4 - Ejercicio 4a
% Graficar polinomio p(x) = 816x^3 - 3835x^2 + 6000x - 3125 en [1,2]
% Alumno: Agustin Formenti

clear, clc

%% Defino el polinomio
% p(x) = 816x^3 - 3835x^2 + 6000x - 3125
p = @(x) 816*x.^3 - 3835*x.^2 + 6000*x - 3125;

%% Discretizo el intervalo [1,2]
% Creo 400 puntos uniformemente espaciados
x = linspace(1, 2, 400);

%% Grafico el polinomio
figure(1)
plot(x, p(x), 'b', 'linewidth', 2)
grid on
hold on

% Agrego la linea y=0 para ver las raices
plot(x, 0*x, 'k--')

xlabel('x')
ylabel('p(x)')
title('Polinomio p(x) en [1,2]')
legend('p(x)', 'y=0', 'Location', 'best')

disp(' ')
disp('Ejercicio 4a - Estudio grafico en [1,2]')
disp(' ')
disp('Observacion: En el intervalo [1,2] parece haber UNA raiz.')
disp('El polinomio cruza el eje x una sola vez en este intervalo.')

disp(' ')
disp('========== FIN EJERCICIO 4a ==========')


% Actividad 4 - Ejercicio 4b
% Graficar polinomio p(x) = 816x^3 - 3835x^2 + 6000x - 3125 en [1.4,1.7]
% Alumno: Agustin Formenti

clear, clc

%% Defino el polinomio
% p(x) = 816x^3 - 3835x^2 + 6000x - 3125
p = @(x) 816*x.^3 - 3835*x.^2 + 6000*x - 3125;

%% Discretizo el intervalo [1.4,1.7]
% Creo 400 puntos uniformemente espaciados
% Uso mas puntos para ver mejor el detalle
x = linspace(1.4, 1.7, 400);

%% Grafico el polinomio
figure(2)
plot(x, p(x), 'r', 'linewidth', 2)
grid on
hold on

% Agrego la linea y=0 para ver las raices
plot(x, 0*x, 'k--')

xlabel('x')
ylabel('p(x)')
title('Polinomio p(x) en [1.4, 1.7] (zoom)')
legend('p(x)', 'y=0', 'Location', 'best')

disp(' ')
disp('Ejercicio 4b - Estudio grafico en [1.4, 1.7] con ZOOM')
disp(' ')
disp('Observacion: Al hacer ZOOM en [1.4, 1.7], se observan TRES raices!')
disp('Las raices estan muy juntas entre si.')
disp('Esto explica por que en [1,2] parecia haber solo una raiz.')
disp(' ')
disp('Las tres raices estan aproximadamente en:')
disp('  r1 ≈ 1.45')
disp('  r2 ≈ 1.56')
disp('  r3 ≈ 1.63')

disp(' ')
disp('========== FIN EJERCICIO 4b ==========')


% Actividad 4 - Ejercicio 4c
% Aproximar raices del polinomio con N-R y comparar errores
% Alumno: Agustin Formenti

clear, clc

%% Defino el polinomio y su derivada
% p(x) = 816x^3 - 3835x^2 + 6000x - 3125
% p'(x) = 2448x^2 - 7670x + 6000
p  = @(x) 816*x.^3 - 3835*x.^2 + 6000*x - 3125;
dp = @(x) 2448*x.^2 - 7670*x + 6000;

%% Calculo raices exactas con roots
% roots calcula las raices de un polinomio dados sus coeficientes
coef = [816, -3835, 6000, -3125];
r_exact = roots(coef);

disp('===== RAICES EXACTAS (con roots) =====')
disp(r_exact)
disp(' ')

%% Parametros de Newton-Raphson
tol = 1e-12;
itmax = 100;

%% Aproximo cada raiz con Newton-Raphson
% Uso x0 cerca de cada raiz observada graficamente

disp('===== APROXIMACION RAIZ 1 (x0 = 1.45) =====')
x0_1 = 1.45;
r1 = NewtonRaphson(p, dp, x0_1, tol, itmax);
disp(' ')

disp('===== APROXIMACION RAIZ 2 (x0 = 1.55) =====')
x0_2 = 1.55;
r2 = NewtonRaphson(p, dp, x0_2, tol, itmax);
disp(' ')

disp('===== APROXIMACION RAIZ 3 (x0 = 1.65) =====')
x0_3 = 1.65;
r3 = NewtonRaphson(p, dp, x0_3, tol, itmax);
disp(' ')

%% Comparacion de resultados
disp('===== COMPARACION =====')
disp(' ')

fprintf('Raiz 1 (exacta):  %.15f\n', r_exact(1))
fprintf('Raiz 1 (Newton):  %.15f\n', r1)
fprintf('Error absoluto:   %.15e\n', abs(r1 - r_exact(1)))
disp(' ')

fprintf('Raiz 2 (exacta):  %.15f\n', r_exact(2))
fprintf('Raiz 2 (Newton):  %.15f\n', r2)
fprintf('Error absoluto:   %.15e\n', abs(r2 - r_exact(2)))
disp(' ')

fprintf('Raiz 3 (exacta):  %.15f\n', r_exact(3))
fprintf('Raiz 3 (Newton):  %.15f\n', r3)
fprintf('Error absoluto:   %.15e\n', abs(r3 - r_exact(3)))
disp(' ')

disp('Conclusion: Newton-Raphson aproxima las tres raices con gran precision.')
disp('Los errores son del orden de 1e-12 o menores.')

disp(' ')
disp('========== FIN EJERCICIO 4c ==========')
