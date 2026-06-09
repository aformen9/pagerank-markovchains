% Actividad 1 - Ejercicio 5a
% Script res_sel: lee matrices desde archivos
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 5a ==========')
disp('Leyendo datos desde archivos...')
disp(' ')

%% Leo la matriz A desde matriz.dat
% El comando load lee datos desde un archivo y los almacena en una variable
A = load('matriz.dat');
disp('Matriz A (desde matriz.dat):')
disp(A)

%% Leo el vector b desde rhs.dat
% rhs = right hand side (lado derecho del sistema)
b = load('rhs.dat');
disp('Vector b (desde rhs.dat):')
disp(b)

disp(' ')
disp('========== FIN EJERCICIO 5a ==========')

% Actividad 1 - Ejercicio 5b
% Resuelve el sistema Ax = b y guarda la solucion
% Alumno: Agustin Formenti

clear, clc

disp('========== Ejercicio 5b ==========')

%% Leo los datos desde archivos
A = load('matriz.dat');
b = load('rhs.dat');

disp('Sistema a resolver: Ax = b')
disp('Matriz A:')
disp(A)
disp('Vector b:')
disp(b)
disp(' ')

%% Resuelvo el sistema Ax = b usando barra invertida \
% El operador \ (backslash) resuelve sistemas lineales
% Es equivalente a x = inv(A) * b pero mas eficiente y estable numericamente
% MATLAB/Octave usa eliminacion gaussiana con pivoteo parcial internamente
disp('Resolviendo sistema Ax = b con operador \...')
x = A \ b;

disp('Solucion x:')
disp(x)

%% Guardo la solucion en sol.dat
% El comando save guarda variables en un archivo
save sol.dat x;
disp('Solucion guardada en sol.dat')

%% Verificacion: calculo Ax para verificar que aproxima b
disp(' ')
disp('Verificacion: Ax deberia aproximar b')
Ax = A * x;
disp('A*x =')
disp(Ax)
disp('b =')
disp(b)

%% Calculo el residual r = b - Ax
% El residual mide cuan bien x aproxima la solucion verdadera
residual = b - Ax;
norma_residual = norm(residual);
fprintf('Norma del residual ||b - Ax|| = %.10e\n', norma_residual)

disp(' ')
disp('========== FIN EJERCICIO 5b ==========')
```

%%---

%%**Nota importante:** Para que estos scripts funcionen, necesitás crear los archivos `matriz.dat` y `rhs.dat` con datos de prueba. Por ejemplo:

%%**matriz.dat:**
%%```
%%2 -1 0
%%-1 2 -1
%%0 -1 2
%%```

%%**rhs.dat:**
%%```
%%1
%%2
%%3
