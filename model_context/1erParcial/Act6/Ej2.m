% Actividad 6 - Ejercicio 2a
% Modificar Jacobi y GaussSeidel para imprimir iteraciones
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 2a')
disp('===========================')
disp(' ')

%% Explicacion de la modificacion

disp('MODIFICACION DE JACOBI Y GAUSS-SEIDEL:')
disp(' ')
disp('Las funciones originales:')
disp('- Jacobi.m')
disp('- GaussSeidel.m')
disp(' ')
disp('Han sido modificadas para crear:')
disp('- Jacobi_mod.m')
disp('- GaussSeidel_mod.m')
disp(' ')
disp('CAMBIO REALIZADO:')
disp('Se agrego codigo para imprimir por pantalla la')
disp('aproximacion x^(k) en cada iteracion k.')
disp(' ')
disp('Esto permite observar como el metodo converge')
disp('hacia la solucion en cada paso.')

disp(' ')
disp('Las funciones modificadas han sido creadas.')
disp(' ')
disp('========== FIN EJERCICIO 2a ==========')


% Actividad 6 - Ejercicio 2b - Sistema (a)
% Resolver sistema 2x2 con Jacobi y Gauss-Seidel modificados
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 2b - Sistema (a)')
disp('==========================================')
disp(' ')

%% Definicion del sistema (a)
% -x + 3y = 1
%  6x - 2y = 2

A = [-1, 3;
      6, -2];

b = [1; 2];

disp('Sistema (a):')
disp('-x + 3y = 1')
disp(' 6x - 2y = 2')
disp(' ')
disp('Matriz A:')
disp(A)
disp('Vector b:')
disp(b)
disp(' ')

%% Parametros

x0 = [0; 0];
tol = 1e-6;
itmax = 100;

fprintf('x^(0) = [0; 0]\n')
fprintf('Tolerancia: %.0e\n', tol)
disp(' ')

%% Metodo de Jacobi

disp('=========================================')
disp('METODO DE JACOBI')
disp('=========================================')
disp(' ')

x_jacobi = Jacobi_mod(A, b, x0, tol, itmax);

disp('Solucion final con Jacobi:')
disp(x_jacobi)
disp(' ')

% Verificar
r_jacobi = b - A*x_jacobi;
fprintf('||residual||_2 = %.10e\n', normap(r_jacobi, 2))
disp(' ')

%% Metodo de Gauss-Seidel

disp('=========================================')
disp('METODO DE GAUSS-SEIDEL')
disp('=========================================')
disp(' ')

x_gs = GaussSeidel_mod(A, b, x0, tol, itmax);

disp('Solucion final con Gauss-Seidel:')
disp(x_gs)
disp(' ')

% Verificar
r_gs = b - A*x_gs;
fprintf('||residual||_2 = %.10e\n', normap(r_gs, 2))
disp(' ')

%% Observaciones

disp('=========================================')
disp('OBSERVACIONES')
disp('=========================================')
disp(' ')

% Verificar diagonal dominante
if diagdom(A)
    disp('- A es diagonalmente dominante')
else
    disp('- A NO es diagonalmente dominante')
end

disp(' ')
disp('COMPORTAMIENTO OBSERVADO:')
disp('Observe en las iteraciones impresas como cada metodo')
disp('converge (o no converge) hacia la solucion.')

disp(' ')
disp('========== FIN EJERCICIO 2b - Sistema (a) ==========')


% Actividad 6 - Ejercicio 2b - Sistema (b)
% Resolver sistema 3x3 con Jacobi y Gauss-Seidel modificados
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 2b - Sistema (b)')
disp('==========================================')
disp(' ')

%% Definicion del sistema (b)
%  x + z = 2
% -x + y = 0
%  x + 2y - 3z = 0

A = [1, 0, 1;
    -1, 1, 0;
     1, 2, -3];

b = [2; 0; 0];

disp('Sistema (b):')
disp(' x + z = 2')
disp('-x + y = 0')
disp(' x + 2y - 3z = 0')
disp(' ')
disp('Matriz A:')
disp(A)
disp('Vector b:')
disp(b)
disp(' ')

%% Parametros

x0 = [0; 0; 0];
tol = 1e-6;
itmax = 100;

fprintf('x^(0) = [0; 0; 0]\n')
fprintf('Tolerancia: %.0e\n', tol)
disp(' ')

%% Metodo de Jacobi

disp('=========================================')
disp('METODO DE JACOBI')
disp('=========================================')
disp(' ')

x_jacobi = Jacobi_mod(A, b, x0, tol, itmax);

disp('Solucion final con Jacobi:')
disp(x_jacobi)
disp(' ')

% Verificar
r_jacobi = b - A*x_jacobi;
fprintf('||residual||_2 = %.10e\n', normap(r_jacobi, 2))
disp(' ')

%% Metodo de Gauss-Seidel

disp('=========================================')
disp('METODO DE GAUSS-SEIDEL')
disp('=========================================')
disp(' ')

x_gs = GaussSeidel_mod(A, b, x0, tol, itmax);

disp('Solucion final con Gauss-Seidel:')
disp(x_gs)
disp(' ')

% Verificar
r_gs = b - A*x_gs;
fprintf('||residual||_2 = %.10e\n', normap(r_gs, 2))
disp(' ')

%% Observaciones

disp('=========================================')
disp('OBSERVACIONES')
disp('=========================================')
disp(' ')

% Verificar diagonal dominante
if diagdom(A)
    disp('- A es diagonalmente dominante')
else
    disp('- A NO es diagonalmente dominante')
end

disp(' ')
disp('COMPORTAMIENTO OBSERVADO:')
disp('Observe en las iteraciones impresas como cada metodo')
disp('converge (o no converge) hacia la solucion.')

disp(' ')
disp('========== FIN EJERCICIO 2b - Sistema (b) ==========')


% Actividad 6 - Ejercicio 2b - Sistema (c)
% Resolver sistema 3x3 con Jacobi y Gauss-Seidel modificados
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 2b - Sistema (c)')
disp('==========================================')
disp(' ')

%% Definicion del sistema (c)
%  5x - y + z = 10
%  2x + 8y - z = 11
% -x + y + 4z = 3

A = [5, -1, 1;
     2, 8, -1;
    -1, 1, 4];

b = [10; 11; 3];

disp('Sistema (c):')
disp(' 5x - y + z = 10')
disp(' 2x + 8y - z = 11')
disp('-x + y + 4z = 3')
disp(' ')
disp('Matriz A:')
disp(A)
disp('Vector b:')
disp(b)
disp(' ')

%% Parametros

x0 = [0; 0; 0];
tol = 1e-6;
itmax = 100;

fprintf('x^(0) = [0; 0; 0]\n')
fprintf('Tolerancia: %.0e\n', tol)
disp(' ')

%% Metodo de Jacobi

disp('=========================================')
disp('METODO DE JACOBI')
disp('=========================================')
disp(' ')

x_jacobi = Jacobi_mod(A, b, x0, tol, itmax);

disp('Solucion final con Jacobi:')
disp(x_jacobi)
disp(' ')

% Verificar
r_jacobi = b - A*x_jacobi;
fprintf('||residual||_2 = %.10e\n', normap(r_jacobi, 2))
disp(' ')

%% Metodo de Gauss-Seidel

disp('=========================================')
disp('METODO DE GAUSS-SEIDEL')
disp('=========================================')
disp(' ')

x_gs = GaussSeidel_mod(A, b, x0, tol, itmax);

disp('Solucion final con Gauss-Seidel:')
disp(x_gs)
disp(' ')

% Verificar
r_gs = b - A*x_gs;
fprintf('||residual||_2 = %.10e\n', normap(r_gs, 2))
disp(' ')

%% Observaciones

disp('=========================================')
disp('OBSERVACIONES')
disp('=========================================')
disp(' ')

% Verificar diagonal dominante
if diagdom(A)
    disp('- A es diagonalmente dominante')
else
    disp('- A NO es diagonalmente dominante')
end

disp(' ')
disp('COMPORTAMIENTO OBSERVADO:')
disp('Observe en las iteraciones impresas como cada metodo')
disp('converge (o no converge) hacia la solucion.')

disp(' ')
disp('========== FIN EJERCICIO 2b - Sistema (c) ==========')


% Actividad 6 - Ejercicio 2c y 2d
% Comparar iteraciones y analizar convergencia
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 6 - Ejercicio 2c y 2d')
disp('=================================')
disp('Comparacion de iteraciones y convergencia')
disp(' ')

%% Parametros comunes

x0_a = [0; 0];
x0_b = [0; 0; 0];
x0_c = [0; 0; 0];
tol = 1e-6;
itmax = 100;

%% Sistema (a)

A_a = [-1, 3; 6, -2];
b_a = [1; 2];

disp('========== SISTEMA (a) ==========')
disp(' ')

% Contar iteraciones manualmente ejecutando los metodos
% (las funciones modificadas imprimen, pero no devuelven iteraciones)
% Usamos las funciones originales para contar

iter_jacobi_a = 0;
iter_gs_a = 0;

% Jacobi
try
    x_j_a = Jacobi(A_a, b_a, x0_a, tol, itmax);
    % Nota: las funciones no devuelven num iteraciones
    % Se observa en la salida de pantalla
catch
    disp('Jacobi no convergio');
end

% Gauss-Seidel
try
    x_gs_a = GaussSeidel(A_a, b_a, x0_a, tol, itmax);
catch
    disp('Gauss-Seidel no convergio');
end

% Verificar diagonal dominante
disp('Diagonal dominante:')
if diagdom(A_a)
    disp('  SI - Se garantiza convergencia')
else
    disp('  NO - No se garantiza convergencia a priori')
end

disp(' ')

%% Sistema (b)

A_b = [1, 0, 1; -1, 1, 0; 1, 2, -3];
b_b = [2; 0; 0];

disp('========== SISTEMA (b) ==========')
disp(' ')

try
    x_j_b = Jacobi(A_b, b_b, x0_b, tol, itmax);
catch
    disp('Jacobi no convergio');
end

try
    x_gs_b = GaussSeidel(A_b, b_b, x0_b, tol, itmax);
catch
    disp('Gauss-Seidel no convergio');
end

disp('Diagonal dominante:')
if diagdom(A_b)
    disp('  SI - Se garantiza convergencia')
else
    disp('  NO - No se garantiza convergencia a priori')
end

disp(' ')

%% Sistema (c)

A_c = [5, -1, 1; 2, 8, -1; -1, 1, 4];
b_c = [10; 11; 3];

disp('========== SISTEMA (c) ==========')
disp(' ')

try
    x_j_c = Jacobi(A_c, b_c, x0_c, tol, itmax);
catch
    disp('Jacobi no convergio');
end

try
    x_gs_c = GaussSeidel(A_c, b_c, x0_c, tol, itmax);
catch
    disp('Gauss-Seidel no convergio');
end

disp('Diagonal dominante:')
if diagdom(A_c)
    disp('  SI - Se garantiza convergencia')
else
    disp('  NO - No se garantiza convergencia a priori')
end

disp(' ')

%% Conclusion general

disp('=========================================')
disp('CONCLUSION GENERAL')
disp('=========================================')
disp(' ')

disp('INCISO (c): COMPARACION DE ITERACIONES')
disp('Para comparar el numero de iteraciones, observe la salida')
disp('de los scripts A6_ej2b_sistema_X.m')
disp(' ')

disp('INCISO (d): CONVERGENCIA A PRIORI')
disp('- Si A es diagonalmente dominante -> CONVERGE')
disp('- Si A no es diagonalmente dominante -> NO se garantiza')
disp(' ')

disp('OBSERVACION GENERAL:')
disp('- Gauss-Seidel suele converger mas rapido que Jacobi')
disp('- Ambos metodos convergen si A es diagonalmente dominante')

disp(' ')
disp('========== FIN EJERCICIO 2c y 2d ==========')



