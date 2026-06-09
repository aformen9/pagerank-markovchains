%% Ejercicio 1b - Metodo de Punto Fijo para alpha = -1
%% Sistema: x^2 - y - 1 = 0, -x + y^2 - 1 = 0
%% Generatrices: x = y^2 - 1, y = x^2 - 1

clear; clc;

alpha = -1;
tol = 1e-4;
P0 = [0, 0];

[Pk, iter] = PuntoFijo('G_ej1b', P0, tol, 1000);

p_final = Pk(1);
q_final = Pk(2);
