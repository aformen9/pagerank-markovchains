% Actividad 4 - Ejercicio 1a
% Aproximar raiz cuadrada de 2 con metodo de bisecciones
% Alumno: Agustin Formenti

clear, clc

%% Llamo a la funcion rcuad2_bisec
% La funcion aproxima sqrt(2) en [1,2] usando bisecciones
tol = 1e-12;
itmax = 100;

r = rcuad2_bisec(tol, itmax);

disp(' ')
fprintf('Raiz cuadrada de 2 aproximada: %.15f\n', r)
fprintf('Valor real sqrt(2):            %.15f\n', sqrt(2))
fprintf('Error absoluto:                %.15e\n', abs(r - sqrt(2)))

disp(' ')
disp('========== FIN EJERCICIO 1a ==========')


% Actividad 4 - Ejercicio 1b
% Comparacion: Bisecciones vs Newton-Raphson para sqrt(2)
% Alumno: Agustin Formenti

clear, clc

%% Metodo de Bisecciones
% Uso rcuad2_bisec para aproximar sqrt(2)
disp('===== METODO DE BISECCIONES =====')
tol = 1e-12;
itmax = 100;

tic  % inicio contador de tiempo
r_bisec = rcuad2_bisec(tol, itmax);
t_bisec = toc;  % tiempo transcurrido

disp(' ')
fprintf('Raiz con bisecciones: %.15f\n', r_bisec)
fprintf('Tiempo bisecciones:   %.6f segundos\n', t_bisec)
disp(' ')

%% Metodo de Newton-Raphson
% Uso rcuad2 (debe existir en tu carpeta) para aproximar sqrt(2)
disp('===== METODO DE NEWTON-RAPHSON =====')

% Si no tenes rcuad2.m, implemento N-R aca:
f = @(x) x.^2 - 2;
fp = @(x) 2*x;
x0 = 1.5;

tic
r_newton = NewtonRaphson(f, fp, x0, tol, itmax);
t_newton = toc;

disp(' ')
fprintf('Raiz con Newton-Raphson: %.15f\n', r_newton)
fprintf('Tiempo Newton-Raphson:   %.6f segundos\n', t_newton)
disp(' ')

%% Comparacion
disp('===== COMPARACION =====')
fprintf('Valor real sqrt(2):         %.15f\n', sqrt(2))
fprintf('Error bisecciones:          %.15e\n', abs(r_bisec - sqrt(2)))
fprintf('Error Newton-Raphson:       %.15e\n', abs(r_newton - sqrt(2)))
disp(' ')

if t_bisec > t_newton
    fprintf('Newton-Raphson es mas rapido (%.2fx mas rapido)\n', t_bisec/t_newton)
else
    fprintf('Bisecciones es mas rapido (%.2fx mas rapido)\n', t_newton/t_bisec)
end

disp(' ')
disp('Conclusion: Newton-Raphson converge mas rapido que bisecciones.')
disp('N-R tiene convergencia cuadratica, bisecciones tiene convergencia lineal.')

disp(' ')
disp('========== FIN EJERCICIO 1b ==========')
