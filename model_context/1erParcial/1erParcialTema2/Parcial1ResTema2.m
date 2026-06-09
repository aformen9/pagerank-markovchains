% =========================================================================
% RECUPERATORIO METODOS Y COMPUTOS NUMERICOS
% Alumno: [Tu Nombre]
% Fecha: 20/11/2025
% Software: Octave
% =========================================================================

clc; clear; close all;

%% --- PROBLEMA 1: ESTABILIDAD NUMÉRICA ---
disp('--- Resolviendo Problema 1 ---');

% a) Explicación:
% Para x muy grandes, x+1 es casi igual a x en la representación de punto flotante.
% La resta de dos números muy cercanos causa "cancelación catastrófica",
% perdiendo cifras significativas.

x= logspace(14 , 16, 200);
f1= log(x+1)-log(x);
f2= log(1+1./x);

figure;
loglog(x,f1,'r-','LineWidth',2); hold on;
loglog(x,f2,'b-','LineWidth',2)
grid on;

%% --- PROBLEMA 2: NEWTON-RAPHSON (Swish) ---
disp('--- Resolviendo Problema 2 ---');

clc; clear; close all;
FS = @(x) (x ./ (1 + exp(-x))) -1 ;

xr = -5:0.1:5
plot(xr, FS(xr), 'k-','LineWidth',2)
grid on; hold on;
plot(xr, zeros(size(xr)), 'r--','LineWidth',2);

DFS = @(x) (1 + exp(-x) + x.*exp(-x)) ./ (1 + exp(-x)).^2;
x0 = 2.0;
tol = 1e-6;
max_iter = 20;
[raiz] = NewtonRaphson(FS, DFS, x0, tol, max_iter);;

%%% C) % c) Análisis de convergencia:
% Newton garantiza convergencia si f'(xo) != 0 y x0 está cerca.
% En este caso, la derivada es positiva y suave alrededor de la raíz,
% por lo que la convergencia es cuadrática y segura en este entorno.

% =========================================================================
% PROBLEMA 3: SISTEMA LINEAL Y CONDICIONAMIENTO (Datos Corregidos)
% =========================================================================
clc; clear;
disp('--- Resolviendo Problema 3 ---');

A = [ 13.442,       0,       0,       0;
     -13.442,  12.252,       0,       0;
           0, -12.252,  12.337,       0;
           0,       0, -12.337,  11.797 ];

b = [750.5; 300; 102; 30];

x = Gauss(A,b)

r=b-A*x;
p=1
np=normap(r,p)

NormA1 = norm(A,1);
NormAInv1 = norm(inv(A),1);
Cond_num = NormA1 * NormAInv1
DigPerd = log10(Cond_num);

% =========================================================================
% EJERCICIO 4: RANKING WEB (Usando funciones propias)
% =========================================================================
clc; clear;

disp('--- Resolviendo Ejercicio 4 ---');
A = [ 1.0,   -0.425, -0.425,  0.0,   -0.425;
     -0.425,  1.0,    0.0,   -0.425,  0.0;
     -0.425, -0.425,  1.0,    0.0,    0.0;
      0.0,    0.0,   -0.425,  1.0,   -0.425;
      0.0,    0.0,    0.0,   -0.425,  1.0 ];

b = [0.03; 0.03; 0.03; 0.03; 0.03];

% Punto de arranque dado
x0 = [0.2; 0.2; 0.2; 0.2; 0.2];

%% A) No podemos asegurar convergencia porque la matiz no es diagonal dominante estricta

tolb = 1e-5;
itmax = 1000;
[xg,iterg] = GaussSeidel(A,b,x0,tolb,itmax)
[xj,iterj] = Jacobi(A,b,x0,tolb,itmax)
[puntajes, indices] = sort(xg, 'descend');

tolc = 1e-10
[xg,iterg] = GaussSeidel(A,b,x0,tolc,itmax)
[xj,iterj] = Jacobi(A,b,x0,tolc,itmax)
%% al bajar lo tolerancia aumenta las iteraciones

% =========================================================================
% EJERCICIO 5: MÉTODO SOR (Usando función propia)
% =========================================================================
clc; clear; close all;

disp('--- Resolviendo Ejercicio 5 ---');

clc; clear; close all;
A = [ 4, -1, -1;
     -1,  4, -1;
     -1, -1,  4 ];

b = [2; 2; 2];

% Solución exacta (x = 1,1,1)
x_exacta = [1; 1; 1];
omegas = 0.1 : 0.1 : 1.9;
tol = 1e-9;
max_iter = 1000;
x0 = [0; 0; 0];

errores_abs = [];
residuos_rel = [];

for w = omegas
  [x, iter,resrel] = SOR(A, b, x0, w, tol, max_iter);
  e_abs = norm(x - x_exacta, 2);
  residuo = b - A*x;
  res_rel = norm(residuo, 2) / norm(b, 2);

  errores_abs = [errores_abs, e_abs];
  residuos_rel = [residuos_rel, res_rel];
end

subplot(2,1,1)
semilogy(omegas, errores_abs, '-bo', 'LineWidth', 2);
grid on;
subplot(2,1,2)
semilogy(omegas, errores_abs, '-rx', 'LineWidth', 2);
grid on;

[min_err, idx] = min(errores_abs)
