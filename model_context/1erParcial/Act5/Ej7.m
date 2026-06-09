% Actividad 5 - Ejercicio 7a
% Factorizacion LU de matriz 4x4 y explicacion de ventajas
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 7a')
disp('===========================')
disp(' ')

%% Definicion de la matriz de coeficientes A

A = [16,   -120,   240,  -140;
     -120,  1200, -2700,  1680;
     240,  -2700,  6480, -4200;
     -140,  1680, -4200,  2800];

disp('Matriz de coeficientes A:')
disp(A)
disp(' ')

%% Obtencion de la factorizacion LU usando comando lu de MATLAB/Octave
% [L,U,P] = lu(A) devuelve:
% - L: matriz triangular inferior con diagonal de unos
% - U: matriz triangular superior
% - P: matriz de permutacion tal que PA = LU

[L, U, P] = lu(A);

disp('=========================================')
disp('FACTORIZACION LU')
disp('=========================================')
disp(' ')

disp('Matriz L (triangular inferior):')
disp(L)
disp(' ')

disp('Matriz U (triangular superior):')
disp(U)
disp(' ')

disp('Matriz de permutacion P:')
disp(P)
disp(' ')

%% Verificacion de la factorizacion
% Verificamos que PA = LU

PA = P * A;
LU = L * U;

disp('Verificacion de PA = LU:')
disp(' ')

% Calculamos el error
error_factorizacion = norm(PA - LU, 2);
fprintf('Error ||PA - LU||_2 = %.10e\n', error_factorizacion)

if error_factorizacion < 1e-10
    disp('VERIFICACION EXITOSA: PA = LU')
else
    disp('ADVERTENCIA: PA no es exactamente igual a LU')
end

disp(' ')

%% Explicacion de las ventajas de la factorizacion LU

disp('=========================================')
disp('VENTAJAS DE LA FACTORIZACION LU')
disp('=========================================')
disp(' ')
disp('1. EFICIENCIA PARA MULTIPLES LADOS DERECHOS:')
disp('   Una vez calculada la factorizacion A = LU, podemos resolver')
disp('   multiples sistemas Ax = b_i con distintos vectores b_i sin')
disp('   necesidad de factorizar A nuevamente.')
disp(' ')
disp('2. COSTO COMPUTACIONAL:')
disp('   - Factorizar A = LU: O(n^3) operaciones (se hace UNA sola vez)')
disp('   - Resolver Ly = b:   O(n^2) operaciones (sustitucion progresiva)')
disp('   - Resolver Ux = y:   O(n^2) operaciones (sustitucion regresiva)')
disp(' ')
disp('3. APLICACION A INVERSION DE MATRICES:')
disp('   Para calcular A^(-1), debemos resolver n sistemas:')
disp('   Ax_i = e_i para i = 1,2,...,n')
disp('   donde e_i son los versores canonicos.')
disp('   Con LU, esto es mucho mas eficiente que usar Gauss n veces.')
disp(' ')
disp('4. ESTABILIDAD NUMERICA:')
disp('   Con pivoteo parcial (matriz P), la factorizacion LU es')
disp('   numericamente estable para la mayoria de matrices.')

disp(' ')
disp('========== FIN EJERCICIO 7a ==========')


% Actividad 5 - Ejercicio 7b
% Resolver sistemas Ax_i = e_i usando factorizacion LU
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 7b')
disp('===========================')
disp(' ')

%% Definicion de la matriz de coeficientes A

A = [16,   -120,   240,  -140;
     -120,  1200, -2700,  1680;
     240,  -2700,  6480, -4200;
     -140,  1680, -4200,  2800];

disp('Matriz A:')
disp(A)
disp(' ')

%% Obtencion de la factorizacion LU

[L, U, P] = lu(A);

disp('Factorizacion LU obtenida')
disp(' ')

%% Resolucion de los sistemas Ax_i = e_i para i = 1,2,3,4
% Los versores canonicos e_i forman la matriz identidad
% e_1 = [1;0;0;0], e_2 = [0;1;0;0], e_3 = [0;0;1;0], e_4 = [0;0;0;1]

n = 4;
X = zeros(n, n);  % Matriz para almacenar las soluciones

disp('Resolviendo sistemas Ax_i = e_i:')
disp(' ')

for i = 1:n
    % Versor canonico e_i
    e_i = zeros(n, 1);
    e_i(i) = 1;

    fprintf('Sistema %d: Ax_%d = e_%d\n', i, i, i)
    disp('e_i =')
    disp(e_i)

    % Para resolver Ax = e_i usando PA = LU:
    % 1) PAx = Pe_i
    % 2) LUx = Pe_i
    % 3) Ly = Pe_i (resolvemos para y con sustitucion progresiva)
    % 4) Ux = y (resolvemos para x con sustitucion regresiva)

    % Paso 1: Calculamos Pe_i
    Pe_i = P * e_i;

    % Paso 2: Resolvemos Ly = Pe_i con sustitucion progresiva
    y = Progresiva(L, Pe_i);

    % Paso 3: Resolvemos Ux = y con sustitucion regresiva
    x_i = Regresiva(U, y);

    disp('Solucion x_i:')
    disp(x_i)

    % Guardamos la solucion en la columna i de X
    X(:, i) = x_i;

    % Verificacion: calculamos el residual
    r_i = e_i - A*x_i;
    norma_r = normap(r_i, 2);
    fprintf('Norma del residual ||e_%d - Ax_%d||_2 = %.10e\n', i, i, norma_r)
    disp(' ')
    disp('-------------------------------------------')
    disp(' ')
end

%% Matriz formada por las soluciones

disp('=========================================')
disp('MATRIZ X = [x_1, x_2, x_3, x_4]')
disp('=========================================')
disp(' ')
disp('X =')
disp(X)

disp(' ')
disp('========== FIN EJERCICIO 7b ==========')


% Actividad 5 - Ejercicio 7c
% Que matriz representa B = [x1 x2 x3 x4]? Compruebe
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 7c')
disp('===========================')
disp(' ')

%% Definicion de la matriz de coeficientes A

A = [16,   -120,   240,  -140;
     -120,  1200, -2700,  1680;
     240,  -2700,  6480, -4200;
     -140,  1680, -4200,  2800];

disp('Matriz A:')
disp(A)
disp(' ')

%% Obtencion de la factorizacion LU

[L, U, P] = lu(A);

%% Resolucion de los sistemas Ax_i = e_i para i = 1,2,3,4

n = 4;
B = zeros(n, n);  % Matriz B = [x_1, x_2, x_3, x_4]

disp('Resolviendo sistemas Ax_i = e_i para i = 1,2,3,4...')

for i = 1:n
    % Versor canonico e_i
    e_i = zeros(n, 1);
    e_i(i) = 1;

    % Resolvemos usando factorizacion LU
    Pe_i = P * e_i;
    y = Progresiva(L, Pe_i);
    x_i = Regresiva(U, y);

    % Guardamos en la columna i de B
    B(:, i) = x_i;
end

disp('Completado.')
disp(' ')

disp('Matriz B = [x_1, x_2, x_3, x_4]:')
disp(B)
disp(' ')

%% Que representa la matriz B?

disp('=========================================')
disp('INTERPRETACION DE LA MATRIZ B')
disp('=========================================')
disp(' ')
disp('La matriz B es la INVERSA de A.')
disp(' ')
disp('Razonamiento:')
disp('- Resolvimos Ax_i = e_i para i = 1,2,3,4')
disp('- Los vectores e_i son las columnas de la identidad I')
disp('- Por lo tanto: A * [x_1, x_2, x_3, x_4] = [e_1, e_2, e_3, e_4] = I')
disp('- Es decir: A * B = I')
disp('- Conclusion: B = A^(-1)')
disp(' ')

%% Comprobacion: verificamos que A*B = I

disp('COMPROBACION:')
disp(' ')

% Calculamos el producto A*B
AB = A * B;

disp('Producto A*B:')
disp(AB)
disp(' ')

% Calculamos la matriz identidad
I = eye(n);

disp('Matriz identidad I:')
disp(I)
disp(' ')

% Calculamos el error
error_identidad = norm(AB - I, 2);

fprintf('Error ||A*B - I||_2 = %.10e\n', error_identidad)
disp(' ')

if error_identidad < 1e-10
    disp('VERIFICACION EXITOSA: B es la inversa de A')
    disp('Es decir: B = A^(-1)')
else
    disp('ADVERTENCIA: B no es exactamente la inversa de A')
end

disp(' ')

%% Comparacion con la inversa calculada por MATLAB/Octave

A_inv = inv(A);

disp('Comparacion con inv(A):')
disp(' ')

error_inv = norm(B - A_inv, 2);
fprintf('Error ||B - inv(A)||_2 = %.10e\n', error_inv)

if error_inv < 1e-10
    disp('B coincide con inv(A) de MATLAB/Octave')
else
    disp('Hay una diferencia apreciable entre B y inv(A)')
end

disp(' ')
disp('========== FIN EJERCICIO 7c ==========')
