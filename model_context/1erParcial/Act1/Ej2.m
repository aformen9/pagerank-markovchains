% Actividad 1 - Ejercicio 2
% Comandos unicos para operaciones con vectores y matrices
% Alumno: Agustin Formenti

clear, clc % limpio variables y pantalla

%% Defino las variables dadas
a = [1, 5, -1];
b = 3:-2:-2;  % genera [3, 1, -1]
c = [4 6 -1 0 -6 7 9 1 5];
d = [-1 1 5; 2 3 0; 1 5 -2];

disp('Variables definidas:')
disp('a = [1, 5, -1]')
disp('b = 3:-2:-2 (genera [3, 1, -1])')
disp('c = [4 6 -1 0 -6 7 9 1 5]')
disp('d = [-1 1 5; 2 3 0; 1 5 -2]')
disp(' ')

%% (i) Obtener el maximo de cada fila de la matriz d
% Uso max(d, [], 2) donde el 2 indica que opere por filas
disp('(i) Maximo de cada fila de d:')
disp('Comando: max(d, [], 2)')
resultado_i = max(d, [], 2)

%% (ii) Obtener la suma de los valores absolutos de todos los elementos de d
% Primero tomo valor absoluto con abs(d)
% Luego sumo todos los elementos con sum(sum(...)) o sum(abs(d(:)))
disp(' ')
disp('(ii) Suma de valores absolutos de d:')
disp('Comando: sum(sum(abs(d))) o sum(abs(d(:)))')
resultado_ii = sum(sum(abs(d)))

%% (iii) Obtener la suma de los elementos de posicion par del vector c
% c(2:2:end) toma elementos en posiciones 2,4,6,8 (posiciones pares)
disp(' ')
disp('(iii) Suma de elementos en posiciones pares de c:')
disp('Comando: sum(c(2:2:end))')
disp('Elementos: c(2)=6, c(4)=0, c(6)=7, c(8)=1')
resultado_iii = sum(c(2:2:end))

%% (iv) Calcular el minimo valor entre los elementos de posicion 3,4,5 y 6 de c
% c(3:6) toma elementos en posiciones 3,4,5,6
disp(' ')
disp('(iv) Minimo entre elementos posiciones 3,4,5,6 de c:')
disp('Comando: min(c(3:6))')
disp('Elementos: c(3)=-1, c(4)=0, c(5)=-6, c(6)=7')
resultado_iv = min(c(3:6))

%% (v) Calcular la primer columna del producto externo de a por b
% Producto externo: a' * b (columna por fila = matriz)
% Primera columna: (a' * b)(:,1)
disp(' ')
disp('(v) Primera columna del producto externo a''*b:')
disp('Comando: resultado_v = (a''*b)(:,1)')
resultado_v = (a'*b)(:,1)

%% (vi) Eliminar el cuarto elemento del vector c
% Asigno [] al elemento c(4) para eliminarlo
disp(' ')
disp('(vi) Eliminar cuarto elemento de c:')
disp('Comando: c_nuevo = c; c_nuevo(4) = []')
c_nuevo = c;
c_nuevo(4) = []

%% (vii) Generar un vector llamado z con los elementos de posicion impar de c
% c(1:2:end) toma elementos en posiciones 1,3,5,7,9 (impares)
disp(' ')
disp('(vii) Vector z con elementos de posiciones impares de c:')
disp('Comando: z = c(1:2:end)')
z = c(1:2:end)

%% (viii) Agregar una cuarta columna a la matriz d cuyos elementos sean -2,3 y 0
% Concateno horizontalmente: [d, columna_nueva]
disp(' ')
disp('(viii) Agregar cuarta columna [-2; 3; 0] a d:')
disp('Comando: d_nuevo = [d, [-2; 3; 0]]')
d_nuevo = [d, [-2; 3; 0]]

%% (ix) Armar una matriz diagonal con la diagonal de d
% Primero extraigo diagonal con diag(d)
% Luego creo matriz diagonal con diag(...)
disp(' ')
disp('(ix) Matriz diagonal con la diagonal de d:')
disp('Comando: diag(diag(d))')
resultado_ix = diag(diag(d))

%% (x) Calcular la norma del vector a-b
% Resto vectores: a-b
% Calculo norma con norm(...)
disp(' ')
disp('(x) Norma del vector a-b:')
disp('Comando: norm(a-b)')
disp('a-b = [1,5,-1] - [3,1,-1] = [-2, 4, 0]')
resultado_x = norm(a-b)

disp(' ')
disp('========== FIN EJERCICIO 2 ==========')
