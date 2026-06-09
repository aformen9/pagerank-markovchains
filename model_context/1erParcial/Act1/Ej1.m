% Actividad 1 - Ejercicio 1
% Funciones intrinsecas de MATLAB/Octave
% Alumno: Agustin Formenti

clear, clc % limpio variables y pantalla

%% Defino las variables dadas en el enunciado
% v es un vector columna (separado por ;)
v = [5; 0; 4; 5; -2; 1; 7];
% x es un vector fila (separado por ,)
x = [4, 1];
% y es un vector fila
y = [2 5];
% z es una matriz 3x3 (filas separadas por ;)
z = [3 0 1; 1 2 6; 0 -1 7];

disp('Variables definidas:')
disp('v = [5; 0; 4; 5; -2; 1; 7]')
disp('x = [4, 1]')
disp('y = [2 5]')
disp('z = [3 0 1; 1 2 6; 0 -1 7]')
disp(' ')

%% (a) min(v(2:5:7))
% v(2:5:7) extrae elementos de v desde posicion 2 hasta 7 con paso 5
% Es decir: v(2) y v(7)
% v(2) = 0, v(7) = 7
% min([0, 7]) = 0
disp('(a) min(v(2:5:7))')
disp('Analisis: v(2:5:7) toma elementos en posiciones 2 y 7')
disp('v(2) = 0, v(7) = 7, entonces min([0,7]) = 0')
resultado_a = min(v(2:5:7))

%% (b) size(z')
% z' es la transpuesta de z, entonces z' tiene tamaño 3x3 -> 3x3
% La transpuesta de una matriz 3x3 sigue siendo 3x3
disp(' ')
disp('(b) size(z'')')
disp('Analisis: z es 3x3, su transpuesta z'' tambien es 3x3')
resultado_b = size(z')

%% (c) ones(x)
% ones(x) crea matriz de unos con dimensiones dadas por x
% x = [4, 1], entonces crea matriz 4x1 (4 filas, 1 columna)
disp(' ')
disp('(c) ones(x)')
disp('Analisis: x = [4,1], entonces ones(x) crea matriz de 4x1 de unos')
resultado_c = ones(x)

%% (d) x*y'
% x es 1x2 (vector fila)
% y' es 2x1 (vector columna, transpuesta de y que es fila)
% Multiplicacion: (1x2) * (2x1) = 1x1 (escalar)
% Resultado: 4*2 + 1*5 = 8 + 5 = 13
disp(' ')
disp('(d) x*y''')
disp('Analisis: x(1x2) * y''(2x1) = escalar')
disp('Calculo: 4*2 + 1*5 = 13')
resultado_d = x*y'

%% (e) y*y
% ERROR: y es 1x2, intentar multiplicar (1x2)*(1x2) no es valido
% Las dimensiones internas no coinciden
disp(' ')
disp('(e) y*y')
disp('Analisis: y(1x2) * y(1x2) -> ERROR!')
disp('Las dimensiones internas no coinciden para multiplicacion matricial')
try
    resultado_e = y*y;
catch
    disp('ERROR: dimensiones incompatibles')
end

%% (f) x'*y
% x' es 2x1 (vector columna)
% y es 1x2 (vector fila)
% Multiplicacion: (2x1) * (1x2) = 2x2 (matriz)
% Resultado: [4;1] * [2 5] = [4*2 4*5; 1*2 1*5] = [8 20; 2 5]
disp(' ')
disp('(f) x''*y')
disp('Analisis: x''(2x1) * y(1x2) = matriz 2x2')
disp('Calculo: [4;1]*[2 5] = [8 20; 2 5]')
resultado_f = x'*y

%% (g) z*v(1:3)
% v(1:3) extrae elementos 1,2,3 de v -> [5; 0; 4] (vector 3x1)
% z es 3x3
% Multiplicacion: (3x3) * (3x1) = 3x1 (vector columna)
disp(' ')
disp('(g) z*v(1:3)')
disp('Analisis: z(3x3) * v(1:3)(3x1) = vector columna 3x1')
resultado_g = z*v(1:3)

%% (h) [z v]
% Concatenacion horizontal de z (3x3) y v (7x1)
% ERROR: no se pueden concatenar porque tienen distinto numero de filas
% z tiene 3 filas, v tiene 7 filas
disp(' ')
disp('(h) [z v]')
disp('Analisis: z(3x3) y v(7x1) -> ERROR!')
disp('No se pueden concatenar horizontalmente: diferente numero de filas')
try
    resultado_h = [z v];
catch
    disp('ERROR: dimensiones incompatibles para concatenacion')
end

%% (i) z(y)
% y = [2 5], se usa como indices para acceder a elementos de z
% z es matriz 3x3, tiene 9 elementos en total (indexados columna a columna)
% z(2) es elemento en posicion 2, z(5) es elemento en posicion 5
% Elementos de z por columnas: z(1)=3, z(2)=1, z(3)=0, z(4)=0, z(5)=2, z(6)=-1, z(7)=1, z(8)=6, z(9)=7
% z([2 5]) = [1, 2]
disp(' ')
disp('(i) z(y)')
disp('Analisis: y=[2 5] se usa como indices en z')
disp('z indexado por columnas: z(2)=1, z(5)=2')
resultado_i = z(y)

%% (j) sum(y+2)
% y+2 = [2 5] + 2 = [4 7] (suma elemento a elemento)
% sum([4 7]) = 4 + 7 = 11
disp(' ')
disp('(j) sum(y+2)')
disp('Analisis: y+2 = [2 5]+2 = [4 7]')
disp('sum([4 7]) = 11')
resultado_j = sum(y+2)

disp(' ')
disp('========== FIN EJERCICIO 1 ==========')
