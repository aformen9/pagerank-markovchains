%% Ejercicio 2c - Newton-Raphson para otra raiz
%% Autor: Agustin Formenti
%% Sistema: 7x^3 - 10x - y = 1, 8y^3 - 11y + x = 1

clear; clc;

X0 = [1; 1];
tol = 1e-7;

[X, iter, err] = NewtonRaphsonSENL('F_ej2c', 'JF_ej2c', X0, tol, 100);
