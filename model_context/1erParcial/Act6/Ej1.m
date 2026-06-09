% Actividad 6 - Ejercicio 1b
% Resolver SEL usando metodo de Jacobi
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 1b')
disp('===========================')
disp(' ')

%% Definicion del sistema de ecuaciones lineales
% Sistema 3x3:
%   3x1 - x2 + x3 = 1
%   3x1 + 6x2 + 2x3 = 0
%   3x1 + 3x2 + 7x3 = 4

% Matriz de coeficientes A
A = [3, -1, 1;
     3, 6, 2;
     3, 3, 7];

% Vector lado derecho b
b = [1; 0; 4];

disp('Matriz de coeficientes A:')
disp(A)
disp(' ')
disp('Vector lado derecho b:')
disp(b)
disp(' ')

%% Parametros del metodo de Jacobi
% Aproximacion inicial: x^(0) = [0; 0; 0]
x0 = [0; 0; 0];

% Tolerancia
tol = 1e-3;

% Numero maximo de iteraciones
itmax = 100;

disp('Parametros del metodo de Jacobi:')
fprintf('Aproximacion inicial x^(0): [%.1f; %.1f; %.1f]\n', x0(1), x0(2), x0(3))
fprintf('Tolerancia: %.0e\n', tol)
fprintf('Iteraciones maximas: %d\n', itmax)
disp(' ')

%% Resolucion con metodo de Jacobi

disp('=========================================')
disp('Resolviendo con metodo de Jacobi...')
disp('=========================================')
disp(' ')

x_jacobi = Jacobi(A, b, x0, tol, itmax);

disp(' ')
disp('Solucion obtenida con Jacobi (x):')
disp(x_jacobi)
disp(' ')

%% Verificacion de la solucion
% Calculamos el residual r = b - Ax

r = b - A*x_jacobi;

disp('Vector residual r = b - Ax:')
disp(r)
disp(' ')

% Calculamos normas del residual
norma_1 = normap(r, 1);
norma_2 = normap(r, 2);
norma_inf = normap(r, inf);

disp('Normas del vector residual:')
fprintf('||r||_1   = %.10e\n', norma_1)
fprintf('||r||_2   = %.10e\n', norma_2)
fprintf('||r||_inf = %.10e\n', norma_inf)
disp(' ')

if norma_2 < 1e-6
    disp('La solucion es muy precisa')
else
    disp('Hay un error residual apreciable')
end

disp(' ')
disp('========== FIN EJERCICIO 1b ==========')


% Actividad 6 - Ejercicio 1c
% Analizar convergencia del metodo de Jacobi
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 1c')
disp('===========================')
disp(' ')

%% Definicion del sistema de ecuaciones lineales

A = [3, -1, 1;
     3, 6, 2;
     3, 3, 7];

b = [1; 0; 4];

disp('Matriz de coeficientes A:')
disp(A)
disp(' ')

%% Analisis de convergencia del metodo de Jacobi

disp('=========================================')
disp('ANALISIS DE CONVERGENCIA - METODO JACOBI')
disp('=========================================')
disp(' ')

%% Criterio 1: Diagonal dominante estricta

disp('CRITERIO 1: DIAGONAL DOMINANTE ESTRICTA')
disp(' ')
disp('Una matriz A es diagonalmente dominante estricta si:')
disp('|a_ii| > sum(|a_ij|) para j != i, para todo i')
disp(' ')
disp('Si A es diagonalmente dominante, Jacobi CONVERGE.')
disp(' ')

% Verificar diagonal dominante
es_diagdom = diagdom(A);

if es_diagdom
    disp('Resultado: A ES diagonalmente dominante')
    disp('=> Jacobi CONVERGE')
else
    disp('Resultado: A NO es diagonalmente dominante')
    disp('=> NO se puede garantizar convergencia a priori')
end

disp(' ')

% Mostrar calculos por fila
disp('Verificacion fila por fila:')
disp(' ')

for i = 1:size(A, 1)
    diagonal = abs(A(i, i));
    suma_fuera_diagonal = sum(abs(A(i, :))) - diagonal;

    fprintf('Fila %d: |a_%d%d| = %.1f, suma_resto = %.1f', i, i, i, diagonal, suma_fuera_diagonal);

    if diagonal > suma_fuera_diagonal
        fprintf(' => CUMPLE\n');
    else
        fprintf(' => NO CUMPLE\n');
    end
end

disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Criterio 2: Radio espectral

disp('CRITERIO 2: RADIO ESPECTRAL')
disp(' ')
disp('Jacobi converge si el radio espectral de la matriz')
disp('de iteracion T_J es menor que 1.')
disp(' ')

% Construir matriz de iteracion de Jacobi
% T_J = D^(-1) * (L + U)
% donde A = D - L - U

D = diag(diag(A));  % Diagonal de A
L = -tril(A, -1);   % Triangular inferior (sin diagonal)
U = -triu(A, 1);    % Triangular superior (sin diagonal)

T_J = inv(D) * (L + U);

disp('Matriz de iteracion T_J = D^(-1)*(L+U):')
disp(T_J)
disp(' ')

% Calcular autovalores de T_J
autovalores = eig(T_J);

disp('Autovalores de T_J:')
disp(autovalores)
disp(' ')

% Radio espectral = max(|autovalores|)
radio_espectral = max(abs(autovalores));

fprintf('Radio espectral rho(T_J) = %.6f\n', radio_espectral)
disp(' ')

if radio_espectral < 1
    disp('Como rho(T_J) < 1, Jacobi CONVERGE')
else
    disp('Como rho(T_J) >= 1, Jacobi NO CONVERGE')
end

disp(' ')
disp('=========================================')
disp(' ')

%% Conclusion

disp('CONCLUSION:')
disp(' ')

if es_diagdom && radio_espectral < 1
    disp('Ambos criterios se cumplen.')
    disp('=> Se puede ASEGURAR la convergencia de Jacobi')
elseif radio_espectral < 1
    disp('Aunque A no es diagonalmente dominante,')
    disp('el radio espectral es < 1.')
    disp('=> Se puede ASEGURAR la convergencia de Jacobi')
elseif es_diagdom
    disp('A es diagonalmente dominante.')
    disp('=> Se puede ASEGURAR la convergencia de Jacobi')
else
    disp('NO se puede garantizar convergencia a priori.')
    disp('Sin embargo, Jacobi podria converger en algunos casos.')
end

disp(' ')
disp('========== FIN EJERCICIO 1c ==========')


% Actividad 6 - Ejercicio 1d
% Resolver con Gauss-Seidel y comparar con Jacobi
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 1d')
disp('===========================')
disp(' ')

%% Definicion del sistema de ecuaciones lineales

A = [3, -1, 1;
     3, 6, 2;
     3, 3, 7];

b = [1; 0; 4];

disp('Matriz de coeficientes A:')
disp(A)
disp(' ')
disp('Vector lado derecho b:')
disp(b)
disp(' ')

%% Parametros de los metodos iterativos

x0 = [0; 0; 0];
tol = 1e-3;
itmax = 100;

disp('Parametros:')
fprintf('x^(0) = [0; 0; 0]\n')
fprintf('Tolerancia: %.0e\n', tol)
fprintf('Iteraciones maximas: %d\n', itmax)
disp(' ')

%% Resolucion con metodo de Gauss-Seidel

disp('=========================================')
disp('Resolviendo con metodo de GAUSS-SEIDEL...')
disp('=========================================')
disp(' ')

x_gs = GaussSeidel(A, b, x0, tol, itmax);

disp(' ')
disp('Solucion obtenida con Gauss-Seidel (x):')
disp(x_gs)
disp(' ')

%% Verificacion de la solucion Gauss-Seidel

r_gs = b - A*x_gs;

disp('Vector residual r = b - Ax:')
disp(r_gs)
disp(' ')

norma_r_gs = normap(r_gs, 2);
fprintf('||r||_2 = %.10e\n', norma_r_gs)
disp(' ')

%% Resolucion con metodo de Jacobi (para comparar)

disp('-------------------------------------------')
disp(' ')
disp('Resolviendo con metodo de JACOBI...')
disp(' ')

x_jacobi = Jacobi(A, b, x0, tol, itmax);

disp(' ')
disp('Solucion obtenida con Jacobi (x):')
disp(x_jacobi)
disp(' ')

%% Verificacion de la solucion Jacobi

r_jacobi = b - A*x_jacobi;
norma_r_jacobi = normap(r_jacobi, 2);
fprintf('||r||_2 = %.10e\n', norma_r_jacobi)
disp(' ')

%% Comparacion de metodos

disp('=========================================')
disp('COMPARACION: GAUSS-SEIDEL vs JACOBI')
disp('=========================================')
disp(' ')

% Comparar soluciones
diferencia = normap(x_gs - x_jacobi, 2);
fprintf('Diferencia entre soluciones: ||x_GS - x_J||_2 = %.10e\n', diferencia)
disp(' ')

if diferencia < 1e-6
    disp('Ambos metodos convergen a la misma solucion')
else
    disp('Las soluciones difieren')
end

disp(' ')

%% Analisis de convergencia de Gauss-Seidel

disp('-------------------------------------------')
disp(' ')
disp('ANALISIS DE CONVERGENCIA - GAUSS-SEIDEL')
disp(' ')

% Verificar diagonal dominante
es_diagdom = diagdom(A);

if es_diagdom
    disp('A es diagonalmente dominante')
    disp('=> Gauss-Seidel CONVERGE')
else
    disp('A NO es diagonalmente dominante')
    disp('=> NO se puede garantizar convergencia a priori')
end

disp(' ')

% Nota: Gauss-Seidel generalmente converge mas rapido que Jacobi
disp('OBSERVACION:')
disp('En general, Gauss-Seidel converge mas rapido que Jacobi')
disp('porque utiliza las componentes actualizadas inmediatamente.')

disp(' ')
disp('========== FIN EJERCICIO 1d ==========')
