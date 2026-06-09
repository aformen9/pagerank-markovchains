%% Ejercicio 2b - Metodo de Punto Fijo
%% Autor: Agustin Formenti
%% Sistema: 7x^3 - 10x - y = 1, 8y^3 - 11y + x = 1
%% Generatrices: y = 7x^3 - 10x - 1, x = 1 - 8y^3 + 11y

clear; clc;

tol = 1e-7;
P0 = [1.2, 1.2];

[Pk, iter] = PuntoFijo('G_ej2b', P0, tol, 10000);

disp(' ')
disp('Verificacion:')
f1 = 7*Pk(1)^3 - 10*Pk(1) - Pk(2) - 1;
f2 = 8*Pk(2)^3 - 11*Pk(2) + Pk(1) - 1;
disp(['f1 = ', num2str(f1)])
disp(['f2 = ', num2str(f2)])

%% El metodo diverge porque las generatrices no satisfacen
%% la condicion de contraccion. Las derivadas son muy grandes
%% y provoca que las iteraciones diverjan.
%% Para este sistema punto fijo no es adecuado.
