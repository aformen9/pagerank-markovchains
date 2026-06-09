% Recuperatorio - Ejercicio 3
% Alumno: Agustin Formenti

clear, clc

%% a)

n = 50;

A = 11 * eye(n);

% Diagonales +1 y -1
for i = 1:n-1
    A(i, i+1) = -4;
    A(i+1, i) = -4;
end

% Diagonales +2 y -2
for i = 1:n-2
    A(i, i+2) = -1;
    A(i+2, i) = -1;
end

%% Elementos no nulos y densidad
nnz_A = nnz(A)

d = nnz_A / (n^2)

%% b)

b = 100 * rand(50, 1);

tol = 1e-9;
x0 = zeros(n, 1);
itmax = 1000

%% Jacobi
tic
x_jacobi = Jacobi(A, b, x0, tol, itmax);
tiempo_jacobi = toc

%% Gauss-Seidel
tic
x_gs = GaussSeidel(A, b, x0, tol, itmax);
tiempo_gs = toc

%% c)

es_diag_dom = diagdom(A)

% Si se puede asegurar la convergencia de Jacobi y GaussSeidel
% Cuando una matriz es diagonal dominante, los dos metodos iterativos
% convergen siempre
