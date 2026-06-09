% Actividad 5 - Ejercicio 3b
% Comprobar solucion del sistema usando Gauss
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 3b')
disp('===========================')
disp(' ')

%% Definicion del sistema de ecuaciones lineales
% Sistema 3x3 en forma matricial Ax = b
% A = [2   1   1 ]      b = [ 1 ]
%     [12  11  5 ]          [17 ]
%     [-2  9   0 ]          [18 ]

% Matriz de coeficientes A
A = [2, 1, 1;
     12, 11, 5;
     -2, 9, 0];

% Vector lado derecho b
b = [1; 17; 18];

disp('Matriz de coeficientes A:')
disp(A)
disp(' ')
disp('Vector lado derecho b:')
disp(b)
disp(' ')

%% Resolucion usando Gauss con pivoteo parcial escalado
% Este metodo usa eliminacion gaussiana con pivote parcial escalado
% para mejorar la estabilidad numerica

x = Gauss(A, b);

disp('Solucion del sistema (x):')
disp(x)
disp(' ')

%% Verificacion de la solucion
% Calculamos Ax y comparamos con b para verificar que la solucion es correcta

Ax = A * x;

disp('Verificacion de la solucion:')
disp('A*x debe ser igual a b')
disp(' ')
disp('A*x =')
disp(Ax)
disp(' ')
disp('b =')
disp(b)
disp(' ')

%% Calculo del vector residual
% El vector residual mide el error: r = b - Ax
% Si r es muy pequeno, la solucion es buena

r = b - Ax;

disp('Vector residual r = b - Ax:')
disp(r)
disp(' ')

%% Calculo de normas del residual
% Calculamos diferentes normas para cuantificar el error

norma_1 = normap(r, 1);
norma_2 = normap(r, 2);
norma_inf = normap(r, inf);

disp('Normas del vector residual:')
fprintf('||r||_1   = %.10e\n', norma_1)
fprintf('||r||_2   = %.10e\n', norma_2)
fprintf('||r||_inf = %.10e\n', norma_inf)
disp(' ')

%% Interpretacion del resultado
% Un residual muy pequeno indica que la solucion numerica
% es muy cercana a la solucion exacta del sistema

if norma_2 < 1e-10
    disp('CONCLUSION: La solucion obtenida es muy precisa.')
    disp('El metodo de Gauss resolvio correctamente el sistema.')
else
    disp('CONCLUSION: Hay un error residual apreciable.')
end

disp(' ')
disp('========== FIN EJERCICIO 3b ==========')
