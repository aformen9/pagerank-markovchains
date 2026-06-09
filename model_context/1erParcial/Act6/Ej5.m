% Actividad 6 - Ejercicio 5a
% Numero de condicion - Calculo manual
% Calcular kappa(A) = ||A||_p * ||A^(-1)||_p para p = 1, 2, inf
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 5a - ACTIVIDAD 6')
disp('Numero de Condicion - Calculo Manual')
disp('========================================')
disp(' ')

%% Matriz i) A
disp('---------- MATRIZ i) A ----------')
A = [4 1; 12 2];
disp('Matriz A:')
disp(A)

% Calculo la inversa de A
A_inv = inv(A);
disp('Matriz inversa A^(-1):')
disp(A_inv)

% Calculo las normas de A para p = 1, 2, inf
norma_A_1 = norm(A, 1);
norma_A_2 = norm(A, 2);
norma_A_inf = norm(A, inf);

% Calculo las normas de A^(-1) para p = 1, 2, inf
norma_Ainv_1 = norm(A_inv, 1);
norma_Ainv_2 = norm(A_inv, 2);
norma_Ainv_inf = norm(A_inv, inf);

% Calculo el numero de condicion kappa(A) = ||A||_p * ||A^(-1)||_p
kappa_A_1 = norma_A_1 * norma_Ainv_1;
kappa_A_2 = norma_A_2 * norma_Ainv_2;
kappa_A_inf = norma_A_inf * norma_Ainv_inf;

fprintf('||A||_1 = %.6f,  ||A^(-1)||_1 = %.6f\n', norma_A_1, norma_Ainv_1)
fprintf('kappa_1(A) = ||A||_1 * ||A^(-1)||_1 = %.6f\n', kappa_A_1)
disp(' ')

fprintf('||A||_2 = %.6f,  ||A^(-1)||_2 = %.6f\n', norma_A_2, norma_Ainv_2)
fprintf('kappa_2(A) = ||A||_2 * ||A^(-1)||_2 = %.6f\n', kappa_A_2)
disp(' ')

fprintf('||A||_inf = %.6f,  ||A^(-1)||_inf = %.6f\n', norma_A_inf, norma_Ainv_inf)
fprintf('kappa_inf(A) = ||A||_inf * ||A^(-1)||_inf = %.6f\n', kappa_A_inf)
disp(' ')
disp('==================================================')
disp(' ')

%% Matriz ii) B
disp('---------- MATRIZ ii) B ----------')
B = [0 3; -5 4];
disp('Matriz B:')
disp(B)

B_inv = inv(B);
disp('Matriz inversa B^(-1):')
disp(B_inv)

norma_B_1 = norm(B, 1);
norma_B_2 = norm(B, 2);
norma_B_inf = norm(B, inf);

norma_Binv_1 = norm(B_inv, 1);
norma_Binv_2 = norm(B_inv, 2);
norma_Binv_inf = norm(B_inv, inf);

kappa_B_1 = norma_B_1 * norma_Binv_1;
kappa_B_2 = norma_B_2 * norma_Binv_2;
kappa_B_inf = norma_B_inf * norma_Binv_inf;

fprintf('||B||_1 = %.6f,  ||B^(-1)||_1 = %.6f\n', norma_B_1, norma_Binv_1)
fprintf('kappa_1(B) = ||B||_1 * ||B^(-1)||_1 = %.6f\n', kappa_B_1)
disp(' ')

fprintf('||B||_2 = %.6f,  ||B^(-1)||_2 = %.6f\n', norma_B_2, norma_Binv_2)
fprintf('kappa_2(B) = ||B||_2 * ||B^(-1)||_2 = %.6f\n', kappa_B_2)
disp(' ')

fprintf('||B||_inf = %.6f,  ||B^(-1)||_inf = %.6f\n', norma_B_inf, norma_Binv_inf)
fprintf('kappa_inf(B) = ||B||_inf * ||B^(-1)||_inf = %.6f\n', kappa_B_inf)
disp(' ')
disp('==================================================')
disp(' ')

%% Matriz iii) C
disp('---------- MATRIZ iii) C ----------')
C = [0 1 1; -1 2 -4; 2 -5 1];
disp('Matriz C:')
disp(C)

C_inv = inv(C);
disp('Matriz inversa C^(-1):')
disp(C_inv)

norma_C_1 = norm(C, 1);
norma_C_2 = norm(C, 2);
norma_C_inf = norm(C, inf);

norma_Cinv_1 = norm(C_inv, 1);
norma_Cinv_2 = norm(C_inv, 2);
norma_Cinv_inf = norm(C_inv, inf);

kappa_C_1 = norma_C_1 * norma_Cinv_1;
kappa_C_2 = norma_C_2 * norma_Cinv_2;
kappa_C_inf = norma_C_inf * norma_Cinv_inf;

fprintf('||C||_1 = %.6f,  ||C^(-1)||_1 = %.6f\n', norma_C_1, norma_Cinv_1)
fprintf('kappa_1(C) = ||C||_1 * ||C^(-1)||_1 = %.6f\n', kappa_C_1)
disp(' ')

fprintf('||C||_2 = %.6f,  ||C^(-1)||_2 = %.6f\n', norma_C_2, norma_Cinv_2)
fprintf('kappa_2(C) = ||C||_2 * ||C^(-1)||_2 = %.6f\n', kappa_C_2)
disp(' ')

fprintf('||C||_inf = %.6f,  ||C^(-1)||_inf = %.6f\n', norma_C_inf, norma_Cinv_inf)
fprintf('kappa_inf(C) = ||C||_inf * ||C^(-1)||_inf = %.6f\n', kappa_C_inf)
disp(' ')
disp('==================================================')
disp(' ')

%% Matriz iv) D
disp('---------- MATRIZ iv) D ----------')
D = [2 -2 1; -8 11 5; 4 -13 3];
disp('Matriz D:')
disp(D)

D_inv = inv(D);
disp('Matriz inversa D^(-1):')
disp(D_inv)

norma_D_1 = norm(D, 1);
norma_D_2 = norm(D, 2);
norma_D_inf = norm(D, inf);

norma_Dinv_1 = norm(D_inv, 1);
norma_Dinv_2 = norm(D_inv, 2);
norma_Dinv_inf = norm(D_inv, inf);

kappa_D_1 = norma_D_1 * norma_Dinv_1;
kappa_D_2 = norma_D_2 * norma_Dinv_2;
kappa_D_inf = norma_D_inf * norma_Dinv_inf;

fprintf('||D||_1 = %.6f,  ||D^(-1)||_1 = %.6f\n', norma_D_1, norma_Dinv_1)
fprintf('kappa_1(D) = ||D||_1 * ||D^(-1)||_1 = %.6f\n', kappa_D_1)
disp(' ')

fprintf('||D||_2 = %.6f,  ||D^(-1)||_2 = %.6f\n', norma_D_2, norma_Dinv_2)
fprintf('kappa_2(D) = ||D||_2 * ||D^(-1)||_2 = %.6f\n', kappa_D_2)
disp(' ')

fprintf('||D||_inf = %.6f,  ||D^(-1)||_inf = %.6f\n', norma_D_inf, norma_Dinv_inf)
fprintf('kappa_inf(D) = ||D||_inf * ||D^(-1)||_inf = %.6f\n', kappa_D_inf)
disp(' ')
disp('==================================================')
disp(' ')

%% Matriz v) E
disp('---------- MATRIZ v) E ----------')
E = [eps 1; 0 1];
disp('Matriz E:')
disp(E)

E_inv = inv(E);
disp('Matriz inversa E^(-1):')
disp(E_inv)

norma_E_1 = norm(E, 1);
norma_E_2 = norm(E, 2);
norma_E_inf = norm(E, inf);

norma_Einv_1 = norm(E_inv, 1);
norma_Einv_2 = norm(E_inv, 2);
norma_Einv_inf = norm(E_inv, inf);

kappa_E_1 = norma_E_1 * norma_Einv_1;
kappa_E_2 = norma_E_2 * norma_Einv_2;
kappa_E_inf = norma_E_inf * norma_Einv_inf;

fprintf('||E||_1 = %.6e,  ||E^(-1)||_1 = %.6e\n', norma_E_1, norma_Einv_1)
fprintf('kappa_1(E) = ||E||_1 * ||E^(-1)||_1 = %.6e\n', kappa_E_1)
disp(' ')

fprintf('||E||_2 = %.6e,  ||E^(-1)||_2 = %.6e\n', norma_E_2, norma_Einv_2)
fprintf('kappa_2(E) = ||E||_2 * ||E^(-1)||_2 = %.6e\n', kappa_E_2)
disp(' ')

fprintf('||E||_inf = %.6e,  ||E^(-1)||_inf = %.6e\n', norma_E_inf, norma_Einv_inf)
fprintf('kappa_inf(E) = ||E||_inf * ||E^(-1)||_inf = %.6e\n', kappa_E_inf)
disp(' ')
disp('==================================================')
disp(' ')

%% Matriz vi) H5 (Hilbert)
disp('---------- MATRIZ vi) H5 (Hilbert) ----------')
H5 = hilb(5);
disp('Matriz H5 (Hilbert 5x5):')
disp(H5)

H5_inv = inv(H5);
disp('Matriz inversa H5^(-1):')
disp(H5_inv)

norma_H5_1 = norm(H5, 1);
norma_H5_2 = norm(H5, 2);
norma_H5_inf = norm(H5, inf);

norma_H5inv_1 = norm(H5_inv, 1);
norma_H5inv_2 = norm(H5_inv, 2);
norma_H5inv_inf = norm(H5_inv, inf);

kappa_H5_1 = norma_H5_1 * norma_H5inv_1;
kappa_H5_2 = norma_H5_2 * norma_H5inv_2;
kappa_H5_inf = norma_H5_inf * norma_H5inv_inf;

fprintf('||H5||_1 = %.6e,  ||H5^(-1)||_1 = %.6e\n', norma_H5_1, norma_H5inv_1)
fprintf('kappa_1(H5) = ||H5||_1 * ||H5^(-1)||_1 = %.6e\n', kappa_H5_1)
disp(' ')

fprintf('||H5||_2 = %.6e,  ||H5^(-1)||_2 = %.6e\n', norma_H5_2, norma_H5inv_2)
fprintf('kappa_2(H5) = ||H5||_2 * ||H5^(-1)||_2 = %.6e\n', kappa_H5_2)
disp(' ')

fprintf('||H5||_inf = %.6e,  ||H5^(-1)||_inf = %.6e\n', norma_H5_inf, norma_H5inv_inf)
fprintf('kappa_inf(H5) = ||H5||_inf * ||H5^(-1)||_inf = %.6e\n', kappa_H5_inf)
disp(' ')

disp('========== FIN EJERCICIO 5a ==========')


% Actividad 6 - Ejercicio 5b
% Numero de condicion - Comparacion con cond()
% Comparar resultados del inciso 5a con el comando cond()
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 5b - ACTIVIDAD 6')
disp('Comparacion con comando cond()')
disp('========================================')
disp(' ')

%% Defino todas las matrices
A = [4 1; 12 2];
B = [0 3; -5 4];
C = [0 1 1; -1 2 -4; 2 -5 1];
D = [2 -2 1; -8 11 5; 4 -13 3];
E = [eps 1; 0 1];
H5 = hilb(5);

%% Matriz A
disp('---------- MATRIZ A ----------')

% Calculo manual (como en el ejercicio 5a)
kappa_A_1_manual = norm(A, 1) * norm(inv(A), 1);
kappa_A_2_manual = norm(A, 2) * norm(inv(A), 2);
kappa_A_inf_manual = norm(A, inf) * norm(inv(A), inf);

% Calculo con cond()
kappa_A_1_cond = cond(A, 1);
kappa_A_2_cond = cond(A, 2);
kappa_A_inf_cond = cond(A, inf);

fprintf('kappa_1(A) manual:  %.6f\n', kappa_A_1_manual)
fprintf('kappa_1(A) cond():  %.6f\n', kappa_A_1_cond)
fprintf('Diferencia:         %.10e\n', abs(kappa_A_1_manual - kappa_A_1_cond))
disp(' ')

fprintf('kappa_2(A) manual:  %.6f\n', kappa_A_2_manual)
fprintf('kappa_2(A) cond():  %.6f\n', kappa_A_2_cond)
fprintf('Diferencia:         %.10e\n', abs(kappa_A_2_manual - kappa_A_2_cond))
disp(' ')

fprintf('kappa_inf(A) manual:  %.6f\n', kappa_A_inf_manual)
fprintf('kappa_inf(A) cond():  %.6f\n', kappa_A_inf_cond)
fprintf('Diferencia:           %.10e\n', abs(kappa_A_inf_manual - kappa_A_inf_cond))
disp(' ')

% Determino si esta bien condicionada
% Una matriz esta bien condicionada si kappa(A) es cercano a 1
% Mal condicionada si kappa(A) >> 1 (por ejemplo, > 1000)
if kappa_A_2_cond < 100
    disp('La matriz A esta BIEN condicionada.')
else
    disp('La matriz A esta MAL condicionada.')
end
disp('==================================================')
disp(' ')

%% Matriz B
disp('---------- MATRIZ B ----------')

kappa_B_1_manual = norm(B, 1) * norm(inv(B), 1);
kappa_B_2_manual = norm(B, 2) * norm(inv(B), 2);
kappa_B_inf_manual = norm(B, inf) * norm(inv(B), inf);

kappa_B_1_cond = cond(B, 1);
kappa_B_2_cond = cond(B, 2);
kappa_B_inf_cond = cond(B, inf);

fprintf('kappa_1(B) manual:  %.6f\n', kappa_B_1_manual)
fprintf('kappa_1(B) cond():  %.6f\n', kappa_B_1_cond)
fprintf('Diferencia:         %.10e\n', abs(kappa_B_1_manual - kappa_B_1_cond))
disp(' ')

fprintf('kappa_2(B) manual:  %.6f\n', kappa_B_2_manual)
fprintf('kappa_2(B) cond():  %.6f\n', kappa_B_2_cond)
fprintf('Diferencia:         %.10e\n', abs(kappa_B_2_manual - kappa_B_2_cond))
disp(' ')

fprintf('kappa_inf(B) manual:  %.6f\n', kappa_B_inf_manual)
fprintf('kappa_inf(B) cond():  %.6f\n', kappa_B_inf_cond)
fprintf('Diferencia:           %.10e\n', abs(kappa_B_inf_manual - kappa_B_inf_cond))
disp(' ')

if kappa_B_2_cond < 100
    disp('La matriz B esta BIEN condicionada.')
else
    disp('La matriz B esta MAL condicionada.')
end
disp('==================================================')
disp(' ')

%% Matriz C
disp('---------- MATRIZ C ----------')

kappa_C_1_manual = norm(C, 1) * norm(inv(C), 1);
kappa_C_2_manual = norm(C, 2) * norm(inv(C), 2);
kappa_C_inf_manual = norm(C, inf) * norm(inv(C), inf);

kappa_C_1_cond = cond(C, 1);
kappa_C_2_cond = cond(C, 2);
kappa_C_inf_cond = cond(C, inf);

fprintf('kappa_1(C) manual:  %.6f\n', kappa_C_1_manual)
fprintf('kappa_1(C) cond():  %.6f\n', kappa_C_1_cond)
fprintf('Diferencia:         %.10e\n', abs(kappa_C_1_manual - kappa_C_1_cond))
disp(' ')

fprintf('kappa_2(C) manual:  %.6f\n', kappa_C_2_manual)
fprintf('kappa_2(C) cond():  %.6f\n', kappa_C_2_cond)
fprintf('Diferencia:         %.10e\n', abs(kappa_C_2_manual - kappa_C_2_cond))
disp(' ')

fprintf('kappa_inf(C) manual:  %.6f\n', kappa_C_inf_manual)
fprintf('kappa_inf(C) cond():  %.6f\n', kappa_C_inf_cond)
fprintf('Diferencia:           %.10e\n', abs(kappa_C_inf_manual - kappa_C_inf_cond))
disp(' ')

if kappa_C_2_cond < 100
    disp('La matriz C esta BIEN condicionada.')
else
    disp('La matriz C esta MAL condicionada.')
end
disp('==================================================')
disp(' ')

%% Matriz D
disp('---------- MATRIZ D ----------')

kappa_D_1_manual = norm(D, 1) * norm(inv(D), 1);
kappa_D_2_manual = norm(D, 2) * norm(inv(D), 2);
kappa_D_inf_manual = norm(D, inf) * norm(inv(D), inf);

kappa_D_1_cond = cond(D, 1);
kappa_D_2_cond = cond(D, 2);
kappa_D_inf_cond = cond(D, inf);

fprintf('kappa_1(D) manual:  %.6f\n', kappa_D_1_manual)
fprintf('kappa_1(D) cond():  %.6f\n', kappa_D_1_cond)
fprintf('Diferencia:         %.10e\n', abs(kappa_D_1_manual - kappa_D_1_cond))
disp(' ')

fprintf('kappa_2(D) manual:  %.6f\n', kappa_D_2_manual)
fprintf('kappa_2(D) cond():  %.6f\n', kappa_D_2_cond)
fprintf('Diferencia:         %.10e\n', abs(kappa_D_2_manual - kappa_D_2_cond))
disp(' ')

fprintf('kappa_inf(D) manual:  %.6f\n', kappa_D_inf_manual)
fprintf('kappa_inf(D) cond():  %.6f\n', kappa_D_inf_cond)
fprintf('Diferencia:           %.10e\n', abs(kappa_D_inf_manual - kappa_D_inf_cond))
disp(' ')

if kappa_D_2_cond < 100
    disp('La matriz D esta BIEN condicionada.')
else
    disp('La matriz D esta MAL condicionada.')
end
disp('==================================================')
disp(' ')

%% Matriz E
disp('---------- MATRIZ E ----------')

kappa_E_1_manual = norm(E, 1) * norm(inv(E), 1);
kappa_E_2_manual = norm(E, 2) * norm(inv(E), 2);
kappa_E_inf_manual = norm(E, inf) * norm(inv(E), inf);

kappa_E_1_cond = cond(E, 1);
kappa_E_2_cond = cond(E, 2);
kappa_E_inf_cond = cond(E, inf);

fprintf('kappa_1(E) manual:  %.6e\n', kappa_E_1_manual)
fprintf('kappa_1(E) cond():  %.6e\n', kappa_E_1_cond)
fprintf('Diferencia:         %.10e\n', abs(kappa_E_1_manual - kappa_E_1_cond))
disp(' ')

fprintf('kappa_2(E) manual:  %.6e\n', kappa_E_2_manual)
fprintf('kappa_2(E) cond():  %.6e\n', kappa_E_2_cond)
fprintf('Diferencia:         %.10e\n', abs(kappa_E_2_manual - kappa_E_2_cond))
disp(' ')

fprintf('kappa_inf(E) manual:  %.6e\n', kappa_E_inf_manual)
fprintf('kappa_inf(E) cond():  %.6e\n', kappa_E_inf_cond)
fprintf('Diferencia:           %.10e\n', abs(kappa_E_inf_manual - kappa_E_inf_cond))
disp(' ')

if kappa_E_2_cond < 100
    disp('La matriz E esta BIEN condicionada.')
else
    disp('La matriz E esta MAL condicionada.')
end
disp('==================================================')
disp(' ')

%% Matriz H5
disp('---------- MATRIZ H5 (Hilbert) ----------')

kappa_H5_1_manual = norm(H5, 1) * norm(inv(H5), 1);
kappa_H5_2_manual = norm(H5, 2) * norm(inv(H5), 2);
kappa_H5_inf_manual = norm(H5, inf) * norm(inv(H5), inf);

kappa_H5_1_cond = cond(H5, 1);
kappa_H5_2_cond = cond(H5, 2);
kappa_H5_inf_cond = cond(H5, inf);

fprintf('kappa_1(H5) manual:  %.6e\n', kappa_H5_1_manual)
fprintf('kappa_1(H5) cond():  %.6e\n', kappa_H5_1_cond)
fprintf('Diferencia:          %.10e\n', abs(kappa_H5_1_manual - kappa_H5_1_cond))
disp(' ')

fprintf('kappa_2(H5) manual:  %.6e\n', kappa_H5_2_manual)
fprintf('kappa_2(H5) cond():  %.6e\n', kappa_H5_2_cond)
fprintf('Diferencia:          %.10e\n', abs(kappa_H5_2_manual - kappa_H5_2_cond))
disp(' ')

fprintf('kappa_inf(H5) manual:  %.6e\n', kappa_H5_inf_manual)
fprintf('kappa_inf(H5) cond():  %.6e\n', kappa_H5_inf_cond)
fprintf('Diferencia:            %.10e\n', abs(kappa_H5_inf_manual - kappa_H5_inf_cond))
disp(' ')

if kappa_H5_2_cond < 100
    disp('La matriz H5 esta BIEN condicionada.')
else
    disp('La matriz H5 esta MAL condicionada.')
end
disp(' ')

disp('========== FIN EJERCICIO 5b ==========')


% Actividad 6 - Ejercicio 5c
% Relacion entre vector residual y numero de condicion
% Analizar la relacion entre ||r|| y kappa(A)
% Alumno: Agustin Formenti

clear, clc

disp('========================================')
disp('EJERCICIO 5c - ACTIVIDAD 6')
disp('Relacion entre Residual y Condicionamiento')
disp('========================================')
disp(' ')

%% Defino todas las matrices y resuelvo los SEL
A = [4 1; 12 2];
B = [0 3; -5 4];
C = [0 1 1; -1 2 -4; 2 -5 1];
D = [2 -2 1; -8 11 5; 4 -13 3];
E = [eps 1; 0 1];
H5 = hilb(5);

% Resuelvo SEL y calculo residuales (usando backslash para simplicidad)
x_exacto_A = ones(size(A, 1), 1);
b_A = A * x_exacto_A;
x_aprox_A = A \ b_A;
r_A = b_A - A * x_aprox_A;
norma_r_A_2 = norm(r_A, 2);
kappa_A_2 = cond(A, 2);

x_exacto_B = ones(size(B, 1), 1);
b_B = B * x_exacto_B;
x_aprox_B = B \ b_B;
r_B = b_B - B * x_aprox_B;
norma_r_B_2 = norm(r_B, 2);
kappa_B_2 = cond(B, 2);

x_exacto_C = ones(size(C, 1), 1);
b_C = C * x_exacto_C;
x_aprox_C = C \ b_C;
r_C = b_C - C * x_aprox_C;
norma_r_C_2 = norm(r_C, 2);
kappa_C_2 = cond(C, 2);

x_exacto_D = ones(size(D, 1), 1);
b_D = D * x_exacto_D;
x_aprox_D = D \ b_D;
r_D = b_D - D * x_aprox_D;
norma_r_D_2 = norm(r_D, 2);
kappa_D_2 = cond(D, 2);

x_exacto_E = ones(size(E, 1), 1);
b_E = E * x_exacto_E;
x_aprox_E = E \ b_E;
r_E = b_E - E * x_aprox_E;
norma_r_E_2 = norm(r_E, 2);
kappa_E_2 = cond(E, 2);

x_exacto_H5 = ones(size(H5, 1), 1);
b_H5 = H5 * x_exacto_H5;
x_aprox_H5 = H5 \ b_H5;
r_H5 = b_H5 - H5 * x_aprox_H5;
norma_r_H5_2 = norm(r_H5, 2);
kappa_H5_2 = cond(H5, 2);

%% Tabla comparativa
disp('TABLA COMPARATIVA: RESIDUAL vs NUMERO DE CONDICION')
disp('===================================================')
disp(' ')
fprintf('%-10s | %-15s | %-15s\n', 'Matriz', '||r||_2', 'kappa_2(A)')
fprintf('-----------------------------------------------\n')
fprintf('%-10s | %15.6e | %15.6e\n', 'A', norma_r_A_2, kappa_A_2)
fprintf('%-10s | %15.6e | %15.6e\n', 'B', norma_r_B_2, kappa_B_2)
fprintf('%-10s | %15.6e | %15.6e\n', 'C', norma_r_C_2, kappa_C_2)
fprintf('%-10s | %15.6e | %15.6e\n', 'D', norma_r_D_2, kappa_D_2)
fprintf('%-10s | %15.6e | %15.6e\n', 'E', norma_r_E_2, kappa_E_2)
fprintf('%-10s | %15.6e | %15.6e\n', 'H5', norma_r_H5_2, kappa_H5_2)
disp(' ')

%% Analisis de la relacion
disp('ANALISIS DE LA RELACION')
disp('========================')
disp(' ')
disp('Observaciones:')
disp(' ')
disp('1. MATRICES BIEN CONDICIONADAS (kappa pequeno):')
disp('   - A, B, C, D tienen numeros de condicion relativamente pequenos')
disp('   - Sus residuales son muy pequenos (cercanos al error de maquina)')
disp('   - La solucion aproximada es muy precisa')
disp(' ')
disp('2. MATRIZ MAL CONDICIONADA (kappa grande):')
disp('   - La matriz E tiene un kappa muy grande debido al epsilon de maquina')
disp('   - Sin embargo, su residual puede ser pequeno dependiendo del metodo')
disp(' ')
disp('3. MATRIZ DE HILBERT H5:')
disp('   - Es notoriamente mal condicionada (kappa muy grande)')
disp('   - Aunque el residual puede parecer pequeno, el ERROR en la solucion')
disp('     puede ser grande debido al mal condicionamiento')
disp(' ')
disp('RELACION CLAVE:')
disp('- Un residual pequeno NO garantiza una solucion precisa si kappa es grande')
disp('- El numero de condicion amplifica los errores de redondeo')
disp('- Para matrices mal condicionadas, pequenas perturbaciones en b pueden')
disp('  causar grandes cambios en la solucion x')
disp(' ')
disp('FORMULA TEORICA:')
disp('||e|| / ||x|| <= kappa(A) * ||r|| / ||b||')
disp(' ')
disp('donde:')
disp('- e = x_exacto - x_aprox (error en la solucion)')
disp('- r = b - A*x_aprox (residual)')
disp('- kappa(A) es el numero de condicion')
disp(' ')
disp('Esto muestra que el error relativo en x esta acotado por')
disp('el numero de condicion multiplicado por el residual relativo.')
disp(' ')

disp('========== FIN EJERCICIO 5c ==========')
