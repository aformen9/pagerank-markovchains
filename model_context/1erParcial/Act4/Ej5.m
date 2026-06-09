% Actividad 4 - Ejercicio 5a
% Resolver 3x^3 + 1 = 0 con estudio grafico y numerico
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion y su derivada
% Ecuacion: 3x^3 + 1 = 0
% f(x) = 3x^3 + 1
% f'(x) = 9x^2
f  = @(x) 3*x.^3 + 1;
fp = @(x) 9*x.^2;

%% Estudio grafico
% Discretizo el intervalo [-2,2] para ver la raiz
x = linspace(-2, 2, 400);

figure(1)
plot(x, f(x), 'b', 'linewidth', 2)
grid on
hold on

% Agrego linea y=0
plot(x, 0*x, 'k--')

xlabel('x')
ylabel('f(x)')
title('f(x) = 3x^3 + 1')
legend('f(x)', 'y=0', 'Location', 'best')

disp(' ')
disp('Estudio grafico: La funcion tiene UNA raiz en x ≈ -0.7')
disp(' ')

%% Estudio numerico con Newton-Raphson
disp('===== METODO DE NEWTON-RAPHSON =====')
x0 = -1;      % aproximacion inicial
tol = 1e-12;
itmax = 100;

r = NewtonRaphson(f, fp, x0, tol, itmax);

%% Resultado
disp(' ')
fprintf('Raiz aproximada: %.15f\n', r)
fprintf('Raiz exacta:     %.15f\n', -1/3^(1/3))  % raiz exacta = -(1/3)^(1/3)
fprintf('Error absoluto:  %.15e\n', abs(r + 1/3^(1/3)))

disp(' ')
disp('========== FIN EJERCICIO 5a ==========')


% Actividad 4 - Ejercicio 5b
% Resolver sen(x+2) = 2+x con estudio grafico y numerico
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion y su derivada
% Ecuacion: sen(x+2) = 2+x  -->  f(x) = sen(x+2) - 2 - x = 0
% f(x) = sin(x+2) - 2 - x
% f'(x) = cos(x+2) - 1
f  = @(x) sin(x + 2) - 2 - x;
fp = @(x) cos(x + 2) - 1;

%% Estudio grafico
% El seno esta entre -1 y 1, entonces 2+x debe estar en [-1,1]
% Esto implica x ∈ [-3, -1]
x = linspace(-3, -1, 400);

figure(1)
plot(x, f(x), 'r', 'linewidth', 2)
grid on
hold on

% Agrego linea y=0
plot(x, 0*x, 'k--')

xlabel('x')
ylabel('f(x)')
title('f(x) = sen(x+2) - 2 - x')
legend('f(x)', 'y=0', 'Location', 'best')

disp(' ')
disp('Estudio grafico: La funcion tiene UNA raiz en x ≈ -2')
disp(' ')

%% Estudio numerico con Newton-Raphson
disp('===== METODO DE NEWTON-RAPHSON =====')
x0 = -2;      % aproximacion inicial
tol = 1e-12;
itmax = 100;

r = NewtonRaphson(f, fp, x0, tol, itmax);

%% Resultado
disp(' ')
fprintf('Raiz aproximada: %.15f\n', r)
fprintf('Verificacion f(r) = %.15e\n', f(r))

disp(' ')
disp('========== FIN EJERCICIO 5b ==========')


% Actividad 4 - Ejercicio 5c
% Resolver x^2 = tan(x) con estudio grafico y numerico
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion y su derivada
% Ecuacion: x^2 = tan(x)  -->  f(x) = x^2 - tan(x) = 0
% f(x) = x^2 - tan(x)
% f'(x) = 2x - sec^2(x) = 2x - 1/cos^2(x)
f  = @(x) x.^2 - tan(x);
fp = @(x) 2*x - 1./cos(x).^2;   % derivada: 2x - sec^2(x)

%% Estudio grafico (alrededor de 0)
% Busco raices cerca del origen
x = linspace(-1, 1, 400);

figure(1)
plot(x, f(x), 'm', 'linewidth', 2)
grid on
hold on

% Agrego linea y=0
plot(x, 0*x, 'k--')

xlabel('x')
ylabel('f(x)')
title('f(x) = x^2 - tan(x)')
legend('f(x)', 'y=0', 'Location', 'best')

disp(' ')
disp('Estudio grafico: La funcion tiene una raiz en x = 0')
disp('(y posiblemente otras raices fuera de este intervalo)')
disp(' ')

%% Estudio numerico con Newton-Raphson
disp('===== METODO DE NEWTON-RAPHSON =====')
x0 = 0.1;      % aproximacion inicial (cerca de 0 pero no exactamente 0)
tol = 1e-12;
itmax = 100;

r = NewtonRaphson(f, fp, x0, tol, itmax);

%% Resultado
disp(' ')
fprintf('Raiz aproximada: %.15f\n', r)
fprintf('Verificacion f(r) = %.15e\n', f(r))
disp(' ')
disp('Nota: x=0 es obviamente una raiz (0^2 = tan(0) = 0).')
disp('Pueden existir otras raices para |x| > π/2 donde tan(x) tiene asintotas.')

disp(' ')
disp('========== FIN EJERCICIO 5c ==========')
