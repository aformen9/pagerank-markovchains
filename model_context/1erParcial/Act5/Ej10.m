% Actividad 5 - Ejercicio 10a
% Crear funcion DescompCholesky que solo factoriza (no resuelve)
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 10a')
disp('============================')
disp(' ')

%% Explicacion de la modificacion

disp('MODIFICACION DEL ALGORITMO DE CHOLESKY:')
disp(' ')
disp('La funcion original Cholesky.m:')
disp('- Input:  matriz A y vector b')
disp('- Output: solucion x del sistema Ax=b y matriz R')
disp('- Pasos:  1) Factoriza A = R^T * R')
disp('          2) Resuelve R^T * y = b (sustitucion progresiva)')
disp('          3) Resuelve R * x = y (sustitucion regresiva)')
disp(' ')
disp('La nueva funcion DescompCholesky.m:')
disp('- Input:  matriz A solamente')
disp('- Output: matriz R triangular superior')
disp('- Pasos:  1) Factoriza A = R^T * R')
disp('          2) Devuelve R (SIN resolver sistema)')
disp(' ')
disp('VENTAJA: Se puede usar para factorizar matrices sin necesidad')
disp('de tener un vector lado derecho b.')

disp(' ')
disp('La funcion DescompCholesky.m ha sido creada.')
disp(' ')
disp('========== FIN EJERCICIO 10a ==========')


% Actividad 5 - Ejercicio 10b
% Encontrar la factorizacion de Cholesky A = R^T * R
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 10b')
disp('============================')
disp(' ')

%% Definicion de la matriz A

A = [1.0000, 0.2500, 0.0625, 0.0156;
     0.2500, 1.0000, 0.2500, 0.0625;
     0.0625, 0.2500, 1.0000, 0.2500;
     0.0156, 0.0625, 0.2500, 1.0000];

disp('Matriz A:')
disp(A)
disp(' ')

%% Verificaciones previas

% Verificar que A es simetrica
if isequal(A, A')
    disp('Verificacion: A es SIMETRICA')
else
    disp('ADVERTENCIA: A NO es simetrica')
end
disp(' ')

% Verificar que A es definida positiva
autovalores = eig(A);
disp('Autovalores de A:')
disp(autovalores)
disp(' ')

if all(autovalores > 0)
    disp('Todos los autovalores son POSITIVOS')
    disp('=> A es DEFINIDA POSITIVA')
    disp('=> Se puede usar factorizacion de Cholesky')
else
    disp('ADVERTENCIA: Hay autovalores no positivos')
    disp('=> NO se puede usar Cholesky')
end

disp(' ')
disp('-------------------------------------------')
disp(' ')

%% Factorizacion de Cholesky usando DescompCholesky

disp('Calculando factorizacion de Cholesky A = R^T * R...')
disp(' ')

R = DescompCholesky(A);

disp('Matriz R (triangular superior):')
disp(R)
disp(' ')

%% Visualizacion de la estructura de R

disp('Estructura de R:')
disp('R es una matriz triangular superior de 4x4')
disp('(todos los elementos debajo de la diagonal son cero)')
disp(' ')

disp('========== FIN EJERCICIO 10b ==========')


% Actividad 5 - Ejercicio 10c
% Verificar la factorizacion de Cholesky en maquina
% Alumno: Agustin Formenti

clear, clc

disp('Actividad 5 - Ejercicio 10c')
disp('============================')
disp('Verificacion de la factorizacion')
disp(' ')

%% Definicion de la matriz A

A = [1.0000, 0.2500, 0.0625, 0.0156;
     0.2500, 1.0000, 0.2500, 0.0625;
     0.0625, 0.2500, 1.0000, 0.0250;
     0.0156, 0.0625, 0.2500, 1.0000];

disp('Matriz A:')
disp(A)
disp(' ')

%% Factorizacion usando DescompCholesky

R = DescompCholesky(A);

disp('Matriz R obtenida:')
disp(R)
disp(' ')

%% Verificacion: reconstruir A a partir de R
% Si la factorizacion es correcta, R^T * R debe ser igual a A

R_T_R = R' * R;

disp('Reconstruccion de A:')
disp('R^T * R =')
disp(R_T_R)
disp(' ')

%% Comparacion con la matriz original

disp('Matriz A original:')
disp(A)
disp(' ')

%% Calculo del error

diferencia = A - R_T_R;

disp('Diferencia A - R^T*R:')
disp(diferencia)
disp(' ')

% Norma del error
error_factorizacion = norm(diferencia, 2);

fprintf('Error ||A - R^T*R||_2 = %.10e\n', error_factorizacion)
disp(' ')

%% Conclusion

if error_factorizacion < 1e-10
    disp('=========================================')
    disp('VERIFICACION EXITOSA')
    disp('=========================================')
    disp('La factorizacion de Cholesky es correcta:')
    disp('A = R^T * R')
    disp(' ')
    disp('El error es despreciable (menor que 1e-10)')
else
    disp('=========================================')
    disp('ADVERTENCIA')
    disp('=========================================')
    disp('Hay un error apreciable en la factorizacion')
    fprintf('Error: %.10e\n', error_factorizacion)
end

disp(' ')

%% Comparacion con la funcion chol de MATLAB/Octave
% MATLAB/Octave tiene una funcion interna chol() para Cholesky

disp('-------------------------------------------')
disp('COMPARACION CON chol() DE MATLAB/OCTAVE')
disp(' ')

R_matlab = chol(A);

disp('Matriz R calculada por chol(A):')
disp(R_matlab)
disp(' ')

% Comparamos nuestra R con la de MATLAB
diferencia_R = R - R_matlab;
error_R = norm(diferencia_R, 2);

fprintf('Diferencia ||R - chol(A)||_2 = %.10e\n', error_R)

if error_R < 1e-10
    disp('Nuestra factorizacion coincide con chol() de MATLAB/Octave')
else
    disp('Hay diferencias con chol() de MATLAB/Octave')
end

disp(' ')
disp('========== FIN EJERCICIO 10c ==========')
