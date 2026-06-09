% =========================================================================
% TEMA 1 - PROBLEMA 1: PÉRDIDA DE PRECISIÓN
% =========================================================================
clc; clear; close all;
%A)  Explicación:   En x aprox 0, sqrt(x+4) es muy cercano a 2.' La resta de dos números muy cercanos causa "cancelación catastrófica".   dejando solo error de redondeo (ruido).

FI = @(x) sqrt(x+4) - 2;
FE = @(x) x./(sqrt(x+4)+2);

limites = [5e-13,5e-14,5e-15];

for k = 1:3
    lim = limites(k);
    inicio = -lim;
    fin = lim;
    longitud = fin - inicio;
    h = longitud / 100;
    x = inicio : h : fin;
    y1 = FI(x);
    y2 = FE(x);
    subplot(3, 1, k);
    plot(x, y1, 'r-o', 'MarkerSize', 3); hold on; % Roja: Inestable
    plot(x, y2, 'b-', 'LineWidth', 2);            % Azul: Estable
    grid on;
end

% =========================================================================
% TEMA 1 - PROBLEMA 2: ENTROPÍA DE SHANNON
% =========================================================================
clc; clear; close all;
f_entropia = @(p) -p.*log2(p) - (1-p).*log2(1-p) - 0.6;
p_vals = 0.01 : 0.01 : 0.99;
y_vals = f_entropia(p_vals);

figure(1);
plot(p_vals, y_vals, 'b-', 'LineWidth', 2); hold on;
plot(p_vals, zeros(size(p_vals)), 'r--'); % Línea cero
grid on;

x0 = 0.2;
tol = 1e-6
itmax=20;
x = NewtonRaphsonDeriv(f_entropia,x0,tol,itmax)

# No te garantiza la convergencia la derivada en 0.5 es 0 y tambien porque si empezamos muy lejos o la correcion es muy grande el metodo podria saltar de p mayor a 0 , o, p menor a 1 donde log2 no esta definida rempiendo el algoritmo

% =========================================================================
% TEMA 1 - PROBLEMA 3: SISTEMA MAL CONDICIONADO
% =========================================================================
clc; clear;
A = [ 1276929.38, -1930737.61,  -617.40;
     -1930737.61,  3316209.17,  1755.30;
      -617.40,     1755.30,     2.00 ];

b = [10; 20; 30];

x = Gauss(A,b)

r=b-A*x
p=2;
npr=normap(r,p)
% Generalmente, si la norma es muy pequeña (cercana a cero o a 1e-15),se considera que satisface la ecuación numéricamente.
% Como su norma es alta, la aproximacion es mala

k = cond(A);
log_k = log10(k);
%   Aunque el residual sea pequeño, la aproximación NO es confiable.
%   Esto se debe a que la matriz está MAL CONDICIONADA (k muy grande).
%   La mezcla de valores muy grandes (10^6) con muy chicos (2.00)
%   hace que la matriz sea casi singular, amplificando cualquier error
%   de redondeo y haciendo la solución inestable.
% =========================================================================
% TEMA 1 - PROBLEMA 4: REGRESIÓN LINEAL MÚLTIPLE
% =========================================================================
clc; clear;
X = [ 1.0,  0.8,  0.5,  0.2, -0.5;
      1.0, -1.2, -1.5, -0.8, -0.5;
      1.0,  1.8,  1.5,  1.2, -1.5;
      1.0, -1.2, -0.5, -0.8,  1.5;
      1.0,  0.8,  0.5,  0.7,  0.5 ];


y = [1.5; -2.0; 3.0; -1.5; 1.2];

A = X' * X
b = X' * y

beta0 = zeros(5,1);
tol = 1e-5
itmax=1000

[xg,iterg] = GaussSeidel(A,b,beta0,tol,itmax)
[xj,iterj] = Jacobi(A,b,beta0,tol,itmax)
% Ambos convergen igual, ninguno itera menos que el otro

norma_A = norm(A, 1)
norma_A_inv = norm(inv(A), 1)
k_cond = norma_A * norma_A_inv
digitos_perdidos = log10(k_cond)
% =========================================================================
% TEMA 1 - PROBLEMA 5: MATRIZ PENTADIAGONAL Y SOR ÓPTIMO
% =========================================================================
clc; clear; close all;
% Diagonal principal (6)
D0 = 6 * eye(10);
D1_sup = -2 * diag(ones(9,1), 1);
D1_inf = -2 * diag(ones(9,1), -1);
D2_sup = -1 * diag(ones(8,1), 2);
D2_inf = -1 * diag(ones(8,1), -2);
A = D0 + D1_sup + D1_inf + D2_sup + D2_inf;
b = ones(10, 1);

x0 = zeros(10, 1);
omega=1.3
tol=1e-14
itmax=2000
[x,iter,resrel] = SOR(A,b,x0,omega,tol,itmax)

omegas= 0.1 : 0.05 : 1.95;
iteraciones=[]
residuos_rel=[]

for w = omegas
  [x,iter,resrel] = SOR(A,b,x0,w,tol,itmax)
  iteraciones = [iteraciones, iter];
  r_rel = norm(b - A*x) / norm(b);
  residuos_rel = [residuos_rel, resrel];
end

[min_iter, idx_opt] = min(iteraciones);
w_opt = omegas(idx_opt)
res_opt = residuos_rel(idx_opt)

subplot(2,1,1);
plot(omegas, iteraciones, '-o', 'LineWidth', 1.5);
grid on;
subplot(2,1,2);
semilogy(omegas, residuos_rel, '-r x', 'LineWidth', 1.5);
grid on;
