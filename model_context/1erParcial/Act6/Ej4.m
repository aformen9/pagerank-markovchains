% Actividad 6 - Ejercicio 4a
% Vector residual y numero de condicion - Parte a
% Generar vector b, resolver SEL con metodos iterativos y calcular error y residual
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 4a - ACTIVIDAD 6')
disp('Vector Residual y Numero de Condicion')
disp('========================================')
disp(' ')

%% Parametros para los metodos iterativos
% Aproximacion inicial (vector cero)
% Tolerancia
tol = 1e-6;
% Numero maximo de iteraciones
itmax = 1000;

%% Matriz i) A
disp('---------- MATRIZ i) A ----------')
A = [4 1; 12 2];
disp('Matriz A:')
disp(A)

% Genero vector b tal que la solucion sea el vector de unos
x_exacto = ones(size(A, 1), 1);
b_A = A * x_exacto;
disp('Vector b generado (b = A*x con x = [1; 1]):')
disp(b_A)

% Verifico si es diagonalmente dominante
if diagdom(A)
    disp('La matriz A es diagonalmente dominante.')
else
    disp('La matriz A NO es diagonalmente dominante.')
end
disp(' ')

% Resuelvo con Jacobi
x0 = zeros(size(A, 1), 1);
disp('Resolviendo con metodo de Jacobi...')
x_aprox_A = Jacobi(A, b_A, x0, tol, itmax);
disp(' ')

disp('Solucion aproximada x_aprox:')
disp(x_aprox_A)

% Calculo el vector error e = x - x_aprox
e_A = x_exacto - x_aprox_A;
disp('Vector error e = x_exacto - x_aprox:')
disp(e_A)

% Calculo el vector residual r = b - A*x_aprox
r_A = b_A - A * x_aprox_A;
disp('Vector residual r = b - A*x_aprox:')
disp(r_A)

% Calculo las normas del residual para p = 1, 2, inf
norma_r_A_1 = normap(r_A, 1);
norma_r_A_2 = normap(r_A, 2);
norma_r_A_inf = normap(r_A, inf);

fprintf('Norma del residual (p=1): %.10e\n', norma_r_A_1)
fprintf('Norma del residual (p=2): %.10e\n', norma_r_A_2)
fprintf('Norma del residual (p=inf): %.10e\n', norma_r_A_inf)
disp(' ')
disp('==================================================')
disp(' ')

%% Matriz ii) B
disp('---------- MATRIZ ii) B ----------')
B = [0 3; -5 4];
disp('Matriz B:')
disp(B)

x_exacto = ones(size(B, 1), 1);
b_B = B * x_exacto;
disp('Vector b generado (b = B*x con x = [1; 1]):')
disp(b_B)

if diagdom(B)
    disp('La matriz B es diagonalmente dominante.')
else
    disp('La matriz B NO es diagonalmente dominante.')
end
disp(' ')

x0 = zeros(size(B, 1), 1);
disp('Resolviendo con metodo de Jacobi...')
x_aprox_B = Jacobi(B, b_B, x0, tol, itmax);
disp(' ')

disp('Solucion aproximada x_aprox:')
disp(x_aprox_B)

e_B = x_exacto - x_aprox_B;
disp('Vector error e = x_exacto - x_aprox:')
disp(e_B)

r_B = b_B - B * x_aprox_B;
disp('Vector residual r = b - B*x_aprox:')
disp(r_B)

norma_r_B_1 = normap(r_B, 1);
norma_r_B_2 = normap(r_B, 2);
norma_r_B_inf = normap(r_B, inf);

fprintf('Norma del residual (p=1): %.10e\n', norma_r_B_1)
fprintf('Norma del residual (p=2): %.10e\n', norma_r_B_2)
fprintf('Norma del residual (p=inf): %.10e\n', norma_r_B_inf)
disp(' ')
disp('==================================================')
disp(' ')

%% Matriz iii) C
disp('---------- MATRIZ iii) C ----------')
C = [0 1 1; -1 2 -4; 2 -5 1];
disp('Matriz C:')
disp(C)

x_exacto = ones(size(C, 1), 1);
b_C = C * x_exacto;
disp('Vector b generado (b = C*x con x = [1; 1; 1]):')
disp(b_C)

if diagdom(C)
    disp('La matriz C es diagonalmente dominante.')
else
    disp('La matriz C NO es diagonalmente dominante.')
end
disp(' ')

x0 = zeros(size(C, 1), 1);
disp('Resolviendo con metodo de Jacobi...')
x_aprox_C = Jacobi(C, b_C, x0, tol, itmax);
disp(' ')

disp('Solucion aproximada x_aprox:')
disp(x_aprox_C)

e_C = x_exacto - x_aprox_C;
disp('Vector error e = x_exacto - x_aprox:')
disp(e_C)

r_C = b_C - C * x_aprox_C;
disp('Vector residual r = b - C*x_aprox:')
disp(r_C)

norma_r_C_1 = normap(r_C, 1);
norma_r_C_2 = normap(r_C, 2);
norma_r_C_inf = normap(r_C, inf);

fprintf('Norma del residual (p=1): %.10e\n', norma_r_C_1)
fprintf('Norma del residual (p=2): %.10e\n', norma_r_C_2)
fprintf('Norma del residual (p=inf): %.10e\n', norma_r_C_inf)
disp(' ')
disp('==================================================')
disp(' ')

%% Matriz iv) D
disp('---------- MATRIZ iv) D ----------')
D = [2 -2 1; -8 11 5; 4 -13 3];
disp('Matriz D:')
disp(D)

x_exacto = ones(size(D, 1), 1);
b_D = D * x_exacto;
disp('Vector b generado (b = D*x con x = [1; 1; 1]):')
disp(b_D)

if diagdom(D)
    disp('La matriz D es diagonalmente dominante.')
else
    disp('La matriz D NO es diagonalmente dominante.')
end
disp(' ')

x0 = zeros(size(D, 1), 1);
disp('Resolviendo con metodo de Gauss-Seidel...')
x_aprox_D = GaussSeidel(D, b_D, x0, tol, itmax);
disp(' ')

disp('Solucion aproximada x_aprox:')
disp(x_aprox_D)

e_D = x_exacto - x_aprox_D;
disp('Vector error e = x_exacto - x_aprox:')
disp(e_D)

r_D = b_D - D * x_aprox_D;
disp('Vector residual r = b - D*x_aprox:')
disp(r_D)

norma_r_D_1 = normap(r_D, 1);
norma_r_D_2 = normap(r_D, 2);
norma_r_D_inf = normap(r_D, inf);

fprintf('Norma del residual (p=1): %.10e\n', norma_r_D_1)
fprintf('Norma del residual (p=2): %.10e\n', norma_r_D_2)
fprintf('Norma del residual (p=inf): %.10e\n', norma_r_D_inf)
disp(' ')
disp('==================================================')
disp(' ')

%% Matriz v) E
disp('---------- MATRIZ v) E ----------')
E = [eps 1; 0 1];
disp('Matriz E:')
disp(E)

x_exacto = ones(size(E, 1), 1);
b_E = E * x_exacto;
disp('Vector b generado (b = E*x con x = [1; 1]):')
disp(b_E)

if diagdom(E)
    disp('La matriz E es diagonalmente dominante.')
else
    disp('La matriz E NO es diagonalmente dominante.')
end
disp(' ')

x0 = zeros(size(E, 1), 1);
disp('Resolviendo con metodo de Jacobi...')
x_aprox_E = Jacobi(E, b_E, x0, tol, itmax);
disp(' ')

disp('Solucion aproximada x_aprox:')
disp(x_aprox_E)

e_E = x_exacto - x_aprox_E;
disp('Vector error e = x_exacto - x_aprox:')
disp(e_E)

r_E = b_E - E * x_aprox_E;
disp('Vector residual r = b - E*x_aprox:')
disp(r_E)

norma_r_E_1 = normap(r_E, 1);
norma_r_E_2 = normap(r_E, 2);
norma_r_E_inf = normap(r_E, inf);

fprintf('Norma del residual (p=1): %.10e\n', norma_r_E_1)
fprintf('Norma del residual (p=2): %.10e\n', norma_r_E_2)
fprintf('Norma del residual (p=inf): %.10e\n', norma_r_E_inf)
disp(' ')
disp('==================================================')
disp(' ')

%% Matriz vi) H5 (Hilbert)
disp('---------- MATRIZ vi) H5 (Hilbert) ----------')
H5 = hilb(5);
disp('Matriz H5 (Hilbert 5x5):')
disp(H5)

x_exacto = ones(size(H5, 1), 1);
b_H5 = H5 * x_exacto;
disp('Vector b generado (b = H5*x con x = [1; 1; 1; 1; 1]):')
disp(b_H5)

if diagdom(H5)
    disp('La matriz H5 es diagonalmente dominante.')
else
    disp('La matriz H5 NO es diagonalmente dominante.')
end
disp(' ')

x0 = zeros(size(H5, 1), 1);
disp('Resolviendo con metodo de Gauss-Seidel...')
x_aprox_H5 = GaussSeidel(H5, b_H5, x0, tol, itmax);
disp(' ')

disp('Solucion aproximada x_aprox:')
disp(x_aprox_H5)

e_H5 = x_exacto - x_aprox_H5;
disp('Vector error e = x_exacto - x_aprox:')
disp(e_H5)

r_H5 = b_H5 - H5 * x_aprox_H5;
disp('Vector residual r = b - H5*x_aprox:')
disp(r_H5)

norma_r_H5_1 = normap(r_H5, 1);
norma_r_H5_2 = normap(r_H5, 2);
norma_r_H5_inf = normap(r_H5, inf);

fprintf('Norma del residual (p=1): %.10e\n', norma_r_H5_1)
fprintf('Norma del residual (p=2): %.10e\n', norma_r_H5_2)
fprintf('Norma del residual (p=inf): %.10e\n', norma_r_H5_inf)
disp(' ')

disp('========== FIN EJERCICIO 4a ==========')


% Actividad 6 - Ejercicio 4b
% Vector residual y numero de condicion - Parte b
% Tabla comparativa de normas del residual
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 4b - ACTIVIDAD 6')
disp('Tabla Comparativa de Normas del Residual')
disp('========================================')
disp(' ')

%% Defino todas las matrices
A = [4 1; 12 2];
B = [0 3; -5 4];
C = [0 1 1; -1 2 -4; 2 -5 1];
D = [2 -2 1; -8 11 5; 4 -13 3];
E = [eps 1; 0 1];
H5 = hilb(5);

%% Proceso cada matriz y guardo los resultados

% Matriz A
x_exacto_A = ones(size(A, 1), 1);
b_A = A * x_exacto_A;
x_aprox_A = A \ b_A;
e_A = x_exacto_A - x_aprox_A;
r_A = b_A - A * x_aprox_A;
norma_r_A = [normap(r_A, 1), normap(r_A, 2), normap(r_A, inf)];

% Matriz B
x_exacto_B = ones(size(B, 1), 1);
b_B = B * x_exacto_B;
x_aprox_B = B \ b_B;
e_B = x_exacto_B - x_aprox_B;
r_B = b_B - B * x_aprox_B;
norma_r_B = [normap(r_B, 1), normap(r_B, 2), normap(r_B, inf)];

% Matriz C
x_exacto_C = ones(size(C, 1), 1);
b_C = C * x_exacto_C;
x_aprox_C = C \ b_C;
e_C = x_exacto_C - x_aprox_C;
r_C = b_C - C * x_aprox_C;
norma_r_C = [normap(r_C, 1), normap(r_C, 2), normap(r_C, inf)];

% Matriz D
x_exacto_D = ones(size(D, 1), 1);
b_D = D * x_exacto_D;
x_aprox_D = D \ b_D;
e_D = x_exacto_D - x_aprox_D;
r_D = b_D - D * x_aprox_D;
norma_r_D = [normap(r_D, 1), normap(r_D, 2), normap(r_D, inf)];

% Matriz E
x_exacto_E = ones(size(E, 1), 1);
b_E = E * x_exacto_E;
x_aprox_E = E \ b_E;
e_E = x_exacto_E - x_aprox_E;
r_E = b_E - E * x_aprox_E;
norma_r_E = [normap(r_E, 1), normap(r_E, 2), normap(r_E, inf)];

% Matriz H5
x_exacto_H5 = ones(size(H5, 1), 1);
b_H5 = H5 * x_exacto_H5;
x_aprox_H5 = H5 \ b_H5;
e_H5 = x_exacto_H5 - x_aprox_H5;
r_H5 = b_H5 - H5 * x_aprox_H5;
norma_r_H5 = [normap(r_H5, 1), normap(r_H5, 2), normap(r_H5, inf)];

%% Creo la tabla comparativa
disp('TABLA COMPARATIVA - NORMAS DEL VECTOR RESIDUAL')
disp('================================================')
disp(' ')
fprintf('%-10s | %-15s | %-15s | %-15s\n', 'Matriz', '||r||_1', '||r||_2', '||r||_inf')
fprintf('--------------------------------------------------------------\n')
fprintf('%-10s | %15.6e | %15.6e | %15.6e\n', 'A', norma_r_A(1), norma_r_A(2), norma_r_A(3))
fprintf('%-10s | %15.6e | %15.6e | %15.6e\n', 'B', norma_r_B(1), norma_r_B(2), norma_r_B(3))
fprintf('%-10s | %15.6e | %15.6e | %15.6e\n', 'C', norma_r_C(1), norma_r_C(2), norma_r_C(3))
fprintf('%-10s | %15.6e | %15.6e | %15.6e\n', 'D', norma_r_D(1), norma_r_D(2), norma_r_D(3))
fprintf('%-10s | %15.6e | %15.6e | %15.6e\n', 'E', norma_r_E(1), norma_r_E(2), norma_r_E(3))
fprintf('%-10s | %15.6e | %15.6e | %15.6e\n', 'H5', norma_r_H5(1), norma_r_H5(2), norma_r_H5(3))
disp(' ')

%% Analisis de resultados
disp('ANALISIS DE RESULTADOS')
disp('======================')
disp(' ')
disp('Observaciones:')
disp('- Las matrices A, B, C y D tienen residuales muy pequenos (cercanos a cero)')
disp('  lo que indica que las soluciones aproximadas son muy buenas.')
disp(' ')
disp('- La matriz E tiene un residual ligeramente mayor debido a que contiene')
disp('  el valor eps (epsilon de maquina) que es extremadamente pequeno.')
disp(' ')
disp('- La matriz H5 (Hilbert) probablemente tenga el residual mas grande')
disp('  debido a que es una matriz mal condicionada.')
disp(' ')

disp('========== FIN EJERCICIO 4b ==========')
