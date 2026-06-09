%% Ejercicio 1a - Explicacion perdida de precision
%% Autor: Agustin Formenti
%% Funcion: f(x) = ln(x+1) - ln(x)

clear; clc;

%% Para x muy grandes, x+1 es casi igual a x
%% En punto flotante, ln(x+1) y ln(x) son casi iguales
%% Al restar dos numeros muy cercanos ocurre cancelacion catastrofica
%% Se pierden cifras significativas por el error de redondeo


%% Ejercicio 1b - Reescribir f(x) algebraicamente
%% Autor: Agustin Formenti

clear; clc;

%% Funcion original: f(x) = ln(x+1) - ln(x)
%% Usando propiedades del logaritmo:
%% f(x) = ln((x+1)/x) = ln(1 + 1/x)

%% Esta forma es numericamente estable para x grandes
%% porque 1/x es pequeno y ln(1 + epsilon) se calcula bien


%% Ejercicio 1c - Plotear ambas expresiones
%% Autor: Agustin Formenti

clear; clc;

x = logspace(14, 16, 200);

f_original = log(x + 1) - log(x);
f_estable = log(1 + 1./x);

figure;
loglog(x, f_original, 'r-', 'LineWidth', 2);
hold on;
loglog(x, f_estable, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('f(x)');
title('Comparacion expresiones');
legend('Original', 'Estable');
grid on;
hold off;


%% Ejercicio 2a - Definir funcion y comprobar raiz
%% Autor: Agustin Formenti
%% Swish: S(x) = x/(1+e^(-x))
%% Resolver S(x) = 1

clear; clc;

x = -5:0.1:5;
f = @(x) x ./ (1 + exp(-x)) - 1;
y = f(x);

figure;
plot(x, y, 'b-', 'LineWidth', 2);
hold on;
plot(x, zeros(size(x)), 'r--');
xlabel('x');
ylabel('f(x)');
title('f(x) = S(x) - 1');
grid on;
hold off;

%% Comprobar raiz en [1, 3]
disp(['f(1) = ', num2str(f(1))])
disp(['f(3) = ', num2str(f(3))])

%% Como f(1) < 0 y f(3) > 0, existe una raiz positiva en el intervalo


%% Ejercicio 2b - Newton-Raphson para raiz de Swish
%% Autor: Agustin Formenti

clear; clc;

x0 = 2.0;
tol = 1e-6;

x = NewtonRaphson('f_ej2b_t2', 'fp_ej2b_t2', x0, tol, 100);


%% Ejercicio 2c - Analisis de convergencia
%% Autor: Agustin Formenti

clear; clc;

%% Newton-Raphson converge si f'(x0) no es cero y x0 esta cerca de la raiz
%% La derivada f'(x) es positiva y suave cerca de la raiz
%% La convergencia esta garantizada en el intervalo [1, 3]
%% donde la funcion es monotona y derivable
%% Si x0 esta muy lejos puede divergir o converger lentamente


%% Ejercicio 3a - Resolver SEL con metodo directo
%% Autor: Agustin Formenti

clear; clc;

A = [13.442 0 0 0;
     -13.442 12.252 0 0;
     0 -12.252 12.337 0;
     0 0 -12.337 11.797];

b = [750.5; 300; 102; 30];

x = Gauss(A, b);

disp('Solucion del sistema:')
disp(['x1 = ', num2str(x(1))])
disp(['x2 = ', num2str(x(2))])
disp(['x3 = ', num2str(x(3))])
disp(['x4 = ', num2str(x(4))])


%% Ejercicio 3b - Vector residual y norma
%% Autor: Agustin Formenti

clear; clc;

A = [13.442 0 0 0;
     -13.442 12.252 0 0;
     0 -12.252 12.337 0;
     0 0 -12.337 11.797];

b = [750.5; 300; 102; 30];

x = Gauss(A, b);

%% Vector residual r = b - Ax
r = b - A * x;

%% Norma 1 del residual
norma_r = norm(r, 1);

disp('Vector residual:')
disp(r)
disp(['Norma ||r||_1 = ', num2str(norma_r)])


%% Ejercicio 3c - Numero de condicion
%% Autor: Agustin Formenti

clear; clc;

A = [13.442 0 0 0;
     -13.442 12.252 0 0;
     0 -12.252 12.337 0;
     0 0 -12.337 11.797];

b = [750.5; 300; 102; 30];

%% Normas
norma_A = norm(A, 1);
norma_Ainv = norm(inv(A), 1);

%% Numero de condicion
kappa = norma_A * norma_Ainv;

%% Digitos perdidos
digitos = log10(kappa);

disp(['Norma ||A||_1 = ', num2str(norma_A)])
disp(['Norma ||A^-1||_1 = ', num2str(norma_Ainv)])
disp(['Numero de condicion kappa(A) = ', num2str(kappa)])
disp(['Digitos perdidos aprox = ', num2str(digitos)])


%% Ejercicio 4a - Convergencia de Jacobi y Gauss-Seidel
%% Autor: Agustin Formenti

clear; clc;

G = [1.0 -0.425 -0.425 0.0 -0.425;
     -0.425 1.0 0.0 -0.425 0.0;
     -0.425 -0.425 1.0 0.0 0.0;
     0.0 0.0 -0.425 1.0 -0.425;
     0.0 0.0 0.0 -0.425 1.0];

%% No se puede asegurar convergencia de antemano porque
%% la matriz G no es diagonal dominante estricta
%% Para diagonal dominancia necesitamos |g_ii| > suma|g_ij| para todo i
%% En este caso no se cumple para todas las filas


%% Ejercicio 4b - Resolver con Jacobi y Gauss-Seidel
%% Autor: Agustin Formenti

clear; clc;

G = [1.0 -0.425 -0.425 0.0 -0.425;
     -0.425 1.0 0.0 -0.425 0.0;
     -0.425 -0.425 1.0 0.0 0.0;
     0.0 0.0 -0.425 1.0 -0.425;
     0.0 0.0 0.0 -0.425 1.0];

e = [0.03; 0.03; 0.03; 0.03; 0.03];
p0 = [0.2; 0.2; 0.2; 0.2; 0.2];
tol = 1e-5;

disp('Jacobi:')
p_j = Jacobi(G, e, p0, tol, 1000);

disp(' ')
disp('Gauss-Seidel:')
p_gs = GaussSeidel(G, e, p0, tol, 1000);

%% Ordenar paginas
[puntajes, orden] = sort(p_gs, 'descend');

disp(' ')
disp('Orden de paginas (mayor a menor relevancia):')
for i = 1:length(orden)
    disp(['P', num2str(orden(i)), ' con puntaje ', num2str(puntajes(i))])
end


%% Ejercicio 4c - Cambiar tolerancia
%% Autor: Agustin Formenti

clear; clc;

G = [1.0 -0.425 -0.425 0.0 -0.425;
     -0.425 1.0 0.0 -0.425 0.0;
     -0.425 -0.425 1.0 0.0 0.0;
     0.0 0.0 -0.425 1.0 -0.425;
     0.0 0.0 0.0 -0.425 1.0];

e = [0.03; 0.03; 0.03; 0.03; 0.03];
p0 = [0.2; 0.2; 0.2; 0.2; 0.2; 0.2];
tol = 1e-10;

%% Al disminuir la tolerancia, esperamos que aumente el numero de iteraciones
%% porque el criterio de parada es mas estricto

disp('Jacobi con tol = 1e-10:')
p_j = Jacobi(G, e, p0, tol, 1000);

disp(' ')
disp('Gauss-Seidel con tol = 1e-10:')
p_gs = GaussSeidel(G, e, p0, tol, 1000);


%% Ejercicio 5a - SOR con diferentes omega
%% Autor: Agustin Formenti

clear; clc;

A = [4 -1 -1;
     -1 4 -1;
     -1 -1 4];

b = [2; 2; 2];
x0 = [0; 0; 0];
tol = 1e-9;

omegas = 0.1:0.1:1.9;

for k = 1:length(omegas)
    omega = omegas(k);
    [x, iter, resrel] = SOR(A, b, x0, omega, tol, 1000);
end


%% Ejercicio 5b - Calcular errores
%% Autor: Agustin Formenti

clear; clc;

A = [4 -1 -1;
     -1 4 -1;
     -1 -1 4];

b = [2; 2; 2];
x_exacta = [1; 1; 1];
x0 = [0; 0; 0];
tol = 1e-9;

omegas = 0.1:0.1:1.9;
errores = zeros(size(omegas));
residuos = zeros(size(omegas));

for k = 1:length(omegas)
    omega = omegas(k);
    [x, iter, resrel] = SOR(A, b, x0, omega, tol, 1000);

    errores(k) = norm(x - x_exacta, 2);
    r = b - A * x;
    residuos(k) = norm(r, 2) / norm(b, 2);
end


%% Ejercicio 5c - Graficar omega vs error y residuo
%% Autor: Agustin Formenti

clear; clc;

A = [4 -1 -1;
     -1 4 -1;
     -1 -1 4];

b = [2; 2; 2];
x_exacta = [1; 1; 1];
x0 = [0; 0; 0];
tol = 1e-9;

omegas = 0.1:0.1:1.9;
errores = zeros(size(omegas));
residuos = zeros(size(omegas));

for k = 1:length(omegas)
    omega = omegas(k);
    [x, iter, resrel] = SOR(A, b, x0, omega, tol, 1000);

    errores(k) = norm(x - x_exacta, 2);
    r = b - A * x;
    residuos(k) = norm(r, 2) / norm(b, 2);
end

figure;

subplot(2, 1, 1);
semilogy(omegas, errores, 'b-o', 'LineWidth', 2);
xlabel('omega');
ylabel('Error absoluto');
title('omega vs Error absoluto');
grid on;

subplot(2, 1, 2);
semilogy(omegas, residuos, 'r-x', 'LineWidth', 2);
xlabel('omega');
ylabel('Residuo relativo');
title('omega vs Residuo relativo');
grid on;

[min_err, idx] = min(errores);
omega_opt = omegas(idx);

disp(['omega optimo: ', num2str(omega_opt)])
disp(['Error minimo: ', num2str(min_err)])

