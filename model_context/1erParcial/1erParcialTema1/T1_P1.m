%% Ejercicio 1a - Explicacion error cerca de x=0
%% Autor: Agustin Formenti
%% Funcion: f(x) = sqrt(x+4) - 2

clear; clc;

%% Evaluando f(x) cerca de x=0 puede ser inexacto por cancelacion catastrofica
%% Cuando x esta cerca de 0, sqrt(x+4) esta cerca de 2
%% Al restar dos numeros casi iguales (sqrt(x+4) - 2), se pierden digitos significativos
%% Esto ocurre porque la diferencia de dos numeros cercanos amplifica el error relativo
%% en la representacion de punto flotante


%% Ejercicio 1b - Reescribir f(x) algebraicamente
%% Autor: Agustin Formenti

clear; clc;

%% Funcion original: f(x) = sqrt(x+4) - 2
%% Multiplicamos y dividimos por el conjugado:
%% f(x) = [sqrt(x+4) - 2] * [sqrt(x+4) + 2] / [sqrt(x+4) + 2]
%% f(x) = [(x+4) - 4] / [sqrt(x+4) + 2]
%% f(x) = x / [sqrt(x+4) + 2]

%% Esta forma evita la resta de numeros cercanos


%% Ejercicio 1c - Plotear ambas expresiones
%% Autor: Agustin Formenti

clear; clc;

figure;

%% Intervalo 1
I1 = [-5e-13, 5e-13];
h1 = (I1(2) - I1(1)) / 100;
x1 = I1(1):h1:I1(2);

f1_original = sqrt(x1 + 4) - 2;
f1_mejorada = x1 ./ (sqrt(x1 + 4) + 2);

subplot(3, 1, 1);
hold on;
plot(x1, f1_original, 'r-', 'LineWidth', 1.5);
plot(x1, f1_mejorada, 'b-', 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('I1 = [-5e-13, 5e-13]');
legend('Original', 'Mejorada');
grid on;
hold off;

%% Intervalo 2
I2 = [-5e-14, 5e-14];
h2 = (I2(2) - I2(1)) / 100;
x2 = I2(1):h2:I2(2);

f2_original = sqrt(x2 + 4) - 2;
f2_mejorada = x2 ./ (sqrt(x2 + 4) + 2);

subplot(3, 1, 2);
hold on;
plot(x2, f2_original, 'r-', 'LineWidth', 1.5);
plot(x2, f2_mejorada, 'b-', 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('I2 = [-5e-14, 5e-14]');
legend('Original', 'Mejorada');
grid on;
hold off;

%% Intervalo 3
I3 = [-5e-15, 5e-15];
h3 = (I3(2) - I3(1)) / 100;
x3 = I3(1):h3:I3(2);

f3_original = sqrt(x3 + 4) - 2;
f3_mejorada = x3 ./ (sqrt(x3 + 4) + 2);

subplot(3, 1, 3);
hold on;
plot(x3, f3_original, 'r-', 'LineWidth', 1.5);
plot(x3, f3_mejorada, 'b-', 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('I3 = [-5e-15, 5e-15]');
legend('Original', 'Mejorada');
grid on;
hold off;


%% Ejercicio 2a - Definir funcion y comprobar raiz
%% Autor: Agustin Formenti
%% Entropia de Shannon: H(p) = -p*log2(p) - (1-p)*log2(1-p)
%% Buscar p tal que H(p) = 0.6

clear; clc;

%% Definir f(p) = H(p) - 0.6
f = @(p) -p.*log2(p) - (1-p).*log2(1-p) - 0.6;

%% Graficar para encontrar intervalo con raiz
p = linspace(0.01, 0.99, 100);
y = f(p);

figure;
plot(p, y, 'b-', 'LineWidth', 1.5);
hold on;
plot(p, zeros(size(p)), 'k--');
xlabel('p');
ylabel('f(p)');
title('f(p) = H(p) - 0.6');
grid on;
hold off;

%% Comprobar que hay raiz en [0.1, 0.5]
disp(['f(0.1) = ', num2str(f(0.1))])
disp(['f(0.5) = ', num2str(f(0.5))])

%% Como f(0.1) > 0 y f(0.5) < 0, existe una raiz en el intervalo


%% Ejercicio 2b - Newton-Raphson para encontrar p
%% Autor: Agustin Formenti

clear; clc;

p0 = 0.3;
tol = 1e-10;

p = NewtonRaphson('f_ej2b', 'fp_ej2b', p0, tol, 100);


%% Ejercicio 2c - Analisis de convergencia
%% Autor: Agustin Formenti

clear; clc;

%% Para que Newton-Raphson converja, necesitamos que |f'(p)| sea acotado
%% y f''(p) no cambie de signo en el intervalo

%% f'(p) = -log2(p) + log2(1-p) = log2((1-p)/p)
%% f''(p) = -1/(p*ln(2)) - 1/((1-p)*ln(2))

%% f''(p) < 0 para todo p en (0,1), entonces f es concava
%% La convergencia esta garantizada si el punto inicial esta cerca de la raiz

%% Intervalo seguro: [0.1, 0.5] donde f(0.1) y f(0.5) tienen signos opuestos
%% y la funcion es continua y derivable

disp('Analisis de convergencia:')
disp('f es concava en (0,1) porque f''''(p) < 0')
disp('La convergencia esta garantizada en el intervalo [0.1, 0.5]')
disp('donde la funcion cambia de signo y es suave')


%% Ejercicio 3a - Resolver SEL con metodo directo
%% Autor: Agustin Formenti

clear; clc;

%% Matriz ampliada
Aum = [1276929.38 -1930737.61 -617.40 10;
       -1930737.61 3316209.17 1755.30 20;
       -617.40 1755.30 2.00 30];

A = Aum(:, 1:3);
b = Aum(:, 4);

%% Resolver usando Gauss
x = Gauss(A, b);

disp('Solucion del sistema:')
disp(['x1 = ', num2str(x(1))])
disp(['x2 = ', num2str(x(2))])
disp(['x3 = ', num2str(x(3))])


%% Ejercicio 3b - Vector residual y norma
%% Autor: Agustin Formenti

clear; clc;

Aum = [1276929.38 -1930737.61 -617.40 10;
       -1930737.61 3316209.17 1755.30 20;
       -617.40 1755.30 2.00 30];

A = Aum(:, 1:3);
b = Aum(:, 4);

x = Gauss(A, b);

%% Vector residual r = b - Ax
r = b - A * x;

%% Norma del residual
norma_r = norm(r, inf);

disp('Vector residual:')
disp(r)
disp(['Norma del residual: ', num2str(norma_r)])

%% La norma del residual es muy grande, NO es buena aproximacion


%% Ejercicio 3c - Explicacion de mala aproximacion
%% Autor: Agustin Formenti

clear; clc;

%% La mala aproximacion se debe a que la matriz A esta muy mal condicionada
%% Los numeros en la matriz tienen magnitudes muy diferentes (de 2 a 3316209)
%% Esto causa errores numericos grandes durante la eliminacion gaussiana
%% El sistema es extremadamente sensible a errores de redondeo

%% La matriz es casi singular (det(A) muy pequeno)
%% Pequenos cambios en los datos producen grandes cambios en la solucion


%% Ejercicio 4a - Calcular A y b del sistema normal
%% Autor: Agustin Formenti

clear; clc;

X = [1.0 0.8 0.5 0.2 -0.5;
     1.0 -1.2 -1.5 -0.8 -0.5;
     1.0 1.8 1.5 1.2 -1.5;
     1.0 -1.2 -0.5 -0.8 1.5;
     1.0 0.8 0.5 0.7 0.5];

y = [1.5; -2.0; 3.0; -1.5; 1.2];

%% Sistema normal: (X'*X)*beta = X'*y
A = X' * X;
b = X' * y;

disp('Matriz A = X''*X:')
disp(A)
disp(' ')
disp('Vector b = X''*y:')
disp(b)


%% Ejercicio 4b - Jacobi y Gauss-Seidel
%% Autor: Agustin Formenti

clear; clc;

X = [1.0 0.8 0.5 0.2 -0.5;
     1.0 -1.2 -1.5 -0.8 -0.5;
     1.0 1.8 1.5 1.2 -1.5;
     1.0 -1.2 -0.5 -0.8 1.5;
     1.0 0.8 0.5 0.7 0.5];

y = [1.5; -2.0; 3.0; -1.5; 1.2];

A = X' * X;
b = X' * y;
tol = 1e-5;
x0 = zeros(length(b), 1);

disp('Metodo de Jacobi:')
beta_j = Jacobi(A, b, x0, tol, 1000);

disp(' ')
disp('Metodo de Gauss-Seidel:')
beta_gs = GaussSeidel(A, b, x0, tol, 1000);


%% Ejercicio 4c - Numero de condicion
%% Autor: Agustin Formenti

clear; clc;

X = [1.0 0.8 0.5 0.2 -0.5;
     1.0 -1.2 -1.5 -0.8 -0.5;
     1.0 1.8 1.5 1.2 -1.5;
     1.0 -1.2 -0.5 -0.8 1.5;
     1.0 0.8 0.5 0.7 0.5];

y = [1.5; -2.0; 3.0; -1.5; 1.2];

A = X' * X;

%% Norma 1
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


%% Ejercicio 5a - SOR con omega=1.3
%% Autor: Agustin Formenti

clear; clc;

n = 10;
A = 6 * eye(n);
A = A + diag(-2*ones(n-1,1), 1) + diag(-2*ones(n-1,1), -1);
A = A + diag(-1*ones(n-2,1), 2) + diag(-1*ones(n-2,1), -2);

b = ones(n, 1);
x0 = zeros(n, 1);
omega = 1.3;
tol = 1e-14;

[x, iter, resrel] = SOR(A, b, x0, omega, tol, 10000);

disp(['SOR con omega = 1.3 converge en ', num2str(iter), ' iteraciones'])
disp(['Residuo relativo: ', num2str(resrel)])


%% Ejercicio 5b - Buscar mejor omega
%% Autor: Agustin Formenti

clear; clc;

n = 10;
A = 6 * eye(n);
A = A + diag(-2*ones(n-1,1), 1) + diag(-2*ones(n-1,1), -1);
A = A + diag(-1*ones(n-2,1), 2) + diag(-1*ones(n-2,1), -2);

b = ones(n, 1);
x0 = zeros(n, 1);
tol = 1e-14;

%% Probar omega = 1.5
omega = 1.5;
[x, iter, resrel] = SOR(A, b, x0, omega, tol, 10000);

disp(['SOR con omega = 1.5 converge en ', num2str(iter), ' iteraciones'])
disp(['Residuo relativo: ', num2str(resrel)])


%% Ejercicio 5c - Graficar omega vs residuo relativo
%% Autor: Agustin Formenti

clear; clc;

n = 10;
A = 6 * eye(n);
A = A + diag(-2*ones(n-1,1), 1) + diag(-2*ones(n-1,1), -1);
A = A + diag(-1*ones(n-2,1), 2) + diag(-1*ones(n-2,1), -2);

b = ones(n, 1);
x0 = zeros(n, 1);
tol = 1e-14;

omegas = 0.1:0.05:1.95;
residuos = zeros(size(omegas));

for k = 1:length(omegas)
    omega = omegas(k);
    [x, iter, resrel] = SOR(A, b, x0, omega, tol, 10000);
    residuos(k) = resrel;
end

figure;
plot(omegas, residuos, 'b-', 'LineWidth', 1.5);
xlabel('omega');
ylabel('Residuo relativo');
title('omega vs Residuo relativo');
grid on;

[min_res, idx] = min(residuos);
omega_opt = omegas(idx);

disp(['omega optimo aproximado: ', num2str(omega_opt)])
disp(['Residuo minimo: ', num2str(min_res)])
