# CHEATSHEET - ACTIVIDAD 1: INTRODUCCIÓN A MATLAB/OCTAVE

## 📚 TEORÍA BASE
**Lecturas relacionadas:** L1 (Intro), L2 (Operaciones), L3 (Funciones y Ploteos)

---

## 🎯 ESTRUCTURA DE UN SCRIPT TÍPICO
```matlab
% Titulo del ejercicio
% Descripcion breve
% Alumno: Agustin Formenti

clear, clc  % SIEMPRE arrancar limpiando variables y pantalla

%% Titulo del inciso (a)
% Comentarios explicando que hace este inciso

% Codigo del inciso

%% Titulo del inciso (b)
% Mas codigo...

disp('========== FIN EJERCICIO X ==========')
```
---

## 📊 PARTE 1: VECTORES Y MATRICES

### Definición de Vectores
```matlab
% VECTOR FILA (separado por comas o espacios)
x = [1, 2, 3]      % o x = [1 2 3]

% VECTOR COLUMNA (separado por punto y coma)
y = [1; 2; 3]

% Convertir fila ↔ columna
x'                 % transpuesta
v(:)               % fuerza a columna (siempre funciona)
```

### Definición de Matrices
```matlab
% Filas separadas por punto y coma
A = [1 2 3; 4 5 6; 7 8 9]  % matriz 3x3

% Transpuesta
A'

% Dimensiones
[m, n] = size(A)   % m filas, n columnas
```

**⚠️ IMPORTANTE:** MATLAB/Octave distingue mayúsculas y minúsculas.

---

## 🔢 PARTE 2: INDEXACIÓN

### Acceso a Elementos
```matlab
% VECTORES
v(i)               % elemento i-ésimo (índices empiezan en 1, no en 0!)

% MATRICES
A(i,j)             % elemento fila i, columna j
A(i,:)             % toda la fila i
A(:,j)             % toda la columna j
```

### Rangos e Intervalos
```matlab
v(a:b)             % elementos desde a hasta b
v(a:paso:b)        % desde a hasta b con paso específico
v(1:2:end)         % elementos impares (1,3,5,...)
v(2:2:end)         % elementos pares (2,4,6,...)
v(end)             % último elemento
v(end-1)           % penúltimo elemento
```

### Indexación Lineal (¡CLAVE PARA EXAMEN!)
```matlab
% Las matrices se indexan POR COLUMNAS
A = [1 2 3;
     4 5 6;
     7 8 9]

% Orden lineal: A(1)=1, A(2)=4, A(3)=7, A(4)=2, A(5)=5, A(6)=8, A(7)=3, A(8)=6, A(9)=9
% Se recorre: columna 1 completa, luego columna 2, luego columna 3...

A([2 5])           % devuelve [4, 5]
```

**🎯 TRUCO EXAMEN:** Si te piden `A(y)` donde `y=[2 5]`, recordá que indexa por columnas.

---

## ⚙️ PARTE 3: OPERACIONES

### Operaciones Elemento a Elemento vs Matriciales
```matlab
% MATRICIALES (sin punto)
A * B              % multiplicación matricial
A ^ 2              % A * A

% ELEMENTO A ELEMENTO (con punto)
A .* B             % multiplica cada elemento
A .^ 2             % cada elemento al cuadrado
A ./ B             % cada elemento dividido
```

**⚠️ REGLA:** Si trabajás con vectores/matrices y querés operar elemento por elemento, **siempre usá el punto** (`.*, .^, ./`)

### Operaciones con Escalares
```matlab
A + 5              % suma 5 a todos los elementos
A * 2              % multiplica todos por 2
```

---

## 📐 PARTE 4: FUNCIONES INTRÍNSECAS CLAVE

### Para Vectores
```matlab
min(v)             % mínimo valor
max(v)             % máximo valor
sum(v)             % suma de elementos
length(v)          % cantidad de elementos
mean(v)            % promedio
norm(v)            % norma euclidiana (√(sum(v.^2)))

% Con indices
[valor, indice] = min(v)  % devuelve valor y posición
[valor, indice] = max(v)
```

### Para Matrices
```matlab
size(A)            % devuelve [filas, columnas]
[m,n] = size(A)    % m=filas, n=columnas

% Operaciones por fila o columna
max(A, [], 1)      % máximo de cada COLUMNA
max(A, [], 2)      % máximo de cada FILA
sum(A, 1)          % suma cada columna
sum(A, 2)          % suma cada fila

% Para toda la matriz
sum(sum(A))        % suma de TODOS los elementos
sum(A(:))          % equivalente (más compacto)
```

**🎯 TRUCO:** `A(:)` convierte cualquier matriz en un vector columna con todos sus elementos.

### Funciones Especiales
```matlab
ones(m,n)          % matriz m×n de unos
zeros(m,n)         % matriz m×n de ceros
eye(n)             % matriz identidad n×n
diag(v)            % matriz diagonal con v en la diagonal
diag(A)            % extrae la diagonal de A

abs(x)             % valor absoluto
sqrt(x)            % raíz cuadrada
exp(x)             % e^x
log(x)             % ln(x) (logaritmo natural)
log10(x)           % log base 10

sin(x), cos(x), tan(x)  % funciones trigonométricas (en radianes)
```

---

## 🛠️ PARTE 5: MANIPULACIÓN DE MATRICES

### Concatenación
```matlab
% HORIZONTAL (agregar columnas)
[A B]              % A y B deben tener mismo número de filas

% VERTICAL (agregar filas)
[A; B]             % A y B deben tener mismo número de columnas
```

### Eliminar Elementos
```matlab
v(4) = []          % elimina el 4to elemento
A(2,:) = []        % elimina la fila 2
A(:,3) = []        % elimina la columna 3
```

---

## 📝 PARTE 6: CREAR FUNCIONES PROPIAS

### Estructura de una Función
```matlab
function [salida1, salida2] = nombre_funcion(entrada1, entrada2)
%% Descripción de la función
% Input: descripción de entradas
% Output: descripción de salidas
% Autor: Agustin Formenti

% Código de la función

end
```

### Ejemplo Completo
```matlab
function [x1, x2] = cuad(a, b, c)
%% Calcula raices de ax^2 + bx + c = 0
% Input: a,b,c - coeficientes
% Output: x1, x2 - raices

discriminante = b^2 - 4*a*c;
x1 = (-b + sqrt(discriminante)) / (2*a);
x2 = (-b - sqrt(discriminante)) / (2*a);

end
```

**🔑 REGLA:** El archivo debe llamarse igual que la función: `cuad.m`

### Funciones Anónimas (Lambda)
```matlab
% Sintaxis: @(variables) expresión
f = @(x) x.^2 + 2*sin(x) - 1;
g = @(x,y) x.*y + exp(x);

% Uso
f(2)               % evalúa f en x=2
f([1,2,3])         % evalúa f en vector
```

### Pasar Funciones como Argumentos
```matlab
% En la llamada, usar @nombre
resultado = multi(@f1, @f2, x);

% En la definición
function res = multi(func1, func2, x)
    res = func1(x) .* func2(x);
end
```

---

## 📊 PARTE 7: PLOTEOS 2D

### Plot Básico
```matlab
% Discretizar el dominio
x = linspace(a, b, n);   % n puntos entre a y b

% Evaluar función
y = f(x);

% Graficar
figure(1)                % crea/activa figura 1
plot(x, y, 'color')      % grafica y vs x
grid on                  % agrega grilla
xlabel('x')              % etiqueta eje x
ylabel('y')              % etiqueta eje y
title('Titulo')          % título
legend('f(x)')           % leyenda
```

### Colores y Estilos
```matlab
% Colores comunes
'b' - azul    'r' - rojo     'g' - verde
'm' - magenta 'c' - cyan     'k' - negro
'y' - amarillo

% Estilos de línea
'-'  línea sólida
'--' línea punteada
':'  línea de puntos
'*'  asteriscos
'o'  círculos

% Combinaciones
plot(x, y, 'r*')         % asteriscos rojos
plot(x, y, 'b--')        % línea punteada azul
```

### Múltiples Curvas en Misma Figura
```matlab
plot(x, y1, 'b', x, y2, 'r', x, y3, 'g')
legend('Curva 1', 'Curva 2', 'Curva 3')
```

### Hold On/Off
```matlab
plot(x, y1, 'b')
hold on                  % mantiene la gráfica
plot(x, y2, 'r')         % agrega otra curva
plot(x, y3, 'g')
hold off                 % libera la figura
```

---

## 📊 PARTE 8: SUBPLOTS

### Estructura Básica
```matlab
figure(1)
subplot(m, n, i)         % divide en m filas, n columnas, activa subplot i
plot(x, y)
title('Titulo subplot i')

% Ejemplo 2×2
subplot(2,2,1)  % arriba izquierda
subplot(2,2,2)  % arriba derecha
subplot(2,2,3)  % abajo izquierda
subplot(2,2,4)  % abajo derecha
```

**🎯 TRUCO:** Los subplots se numeran de izquierda a derecha, de arriba hacia abajo.

---

## 🌐 PARTE 9: PLOTEOS 3D

### Preparación del Dominio
```matlab
% 1. Discretizar cada eje
x = linspace(a, b, n);
y = linspace(c, d, m);

% 2. Crear malla con meshgrid
[X, Y] = meshgrid(x, y);
% X contiene coordenadas x (filas repetidas)
% Y contiene coordenadas y (columnas repetidas)

% 3. Evaluar función en la malla
Z = f(X, Y);  % usar operaciones elemento a elemento (.*, .^)
```

### Tipos de Gráficos 3D
```matlab
% MESH - superficie con líneas (malla)
figure(1)
mesh(X, Y, Z)
xlabel('x')
ylabel('y')
zlabel('z')
title('Superficie con mesh')
colorbar

% SURF - superficie sólida con colores
figure(2)
surf(X, Y, Z)
xlabel('x')
ylabel('y')
zlabel('z')
title('Superficie con surf')
colorbar

% CONTOUR - curvas de nivel (2D)
figure(3)
contour(X, Y, Z, n)  % n = número de niveles
xlabel('x')
ylabel('y')
title('Curvas de nivel')
colorbar
```

**🎯 TRUCO:** `colorbar` agrega una barra de colores para interpretar los valores.

---

## 💾 PARTE 10: MANEJO DE ARCHIVOS

### Leer Datos
```matlab
% Leer archivo .dat
A = load('matriz.dat');       % carga en variable A
b = load('rhs.dat');
```

### Guardar Datos
```matlab
% Guardar variable en archivo
save archivo.dat x;           % guarda x en archivo.dat
```

**⚠️ IMPORTANTE:** Los archivos deben estar en el mismo directorio que el script.

---

## 🧮 PARTE 11: RESOLUCIÓN DE SISTEMAS LINEALES

### Operador Barra Invertida `\`
```matlab
% Resolver Ax = b
x = A \ b;

% Equivalente a x = inv(A) * b pero MÁS EFICIENTE y ESTABLE
```

### Verificación de Solución
```matlab
% Calcular residual
r = b - A*x;

% Norma del residual
norma_r = norm(r);

% Si norma es muy pequeña (ej: 1e-14), la solución es buena
```

---

## 🎓 PARTE 12: TIPS PARA EL EXAMEN

### Errores Comunes y Cómo Evitarlos

1. **Dimensiones incompatibles en multiplicación**
   - Revisar: `size(A)` y `size(B)` antes de hacer `A*B`
   - Para multiplicar elemento a elemento: usar `.*`

2. **Confundir fila con columna**
   - Vector fila: `[1, 2, 3]` o `[1 2 3]`
   - Vector columna: `[1; 2; 3]`
   - Convertir: `v'` o `v(:)`

3. **Olvidar operaciones elemento a elemento**
   - Siempre usar punto: `.*, .^, ./` cuando trabajes con vectores

4. **Indexación desde 0**
   - MATLAB/Octave empieza en 1, NO en 0

5. **Olvidar `clear, clc`**
   - Siempre arrancar con esto

### Checklist Antes de Entregar

- [ ] Todos los scripts tienen `clear, clc` al inicio
- [ ] Los comentarios explican QUÉ hace el código
- [ ] Los nombres de archivos de funciones coinciden con el nombre de la función
- [ ] Cada inciso está en un script separado (si hay múltiples incisos)
- [ ] Las gráficas tienen `xlabel`, `ylabel`, `title`, `grid on`
- [ ] Verificaste que el código calcula TODO (nada pre-computado)

### Estructura de Entrega Típica
```
Ejercicio 1: A1_ej1.m
Ejercicio 2: A1_ej2.m
Ejercicio 3: suma.m, suma_mejorada.m, A1_ej3a.m, A1_ej3b.m
Ejercicio 4: cuad.m, cuad_mejorada.m, A1_ej4a.m, A1_ej4b.m
...
```

---

## 📋 PARTE 13: COMANDOS DE REFERENCIA RÁPIDA

### Información de Variables
```matlab
whos               % lista todas las variables con detalles
size(A)            % dimensiones de A
length(v)          % longitud de vector v
class(x)           % tipo de dato
```

### Display y Formato
```matlab
disp('texto')              % imprime texto
disp(variable)             % imprime variable
fprintf('x = %.4f\n', x)   % formato personalizado
format long                % más decimales
format short               % menos decimales (default)
```

### Control de Flujo (si necesitás)
```matlab
% IF
if condicion
    % codigo
elseif otra_condicion
    % codigo
else
    % codigo
end

% FOR
for i = 1:n
    % codigo
end

% WHILE
while condicion
    % codigo
end
```

---

## 🔥 RESUMEN ULTRA-RÁPIDO

**Vector fila:** `[1, 2, 3]` | **Vector columna:** `[1; 2; 3]`

**Indexar:** `v(i)`, `A(i,j)`, `v(a:b)`, `v(:)` fuerza columna

**Operaciones:** Sin punto = matricial | Con punto (`.*, .^, ./`) = elemento a elemento

**Funciones útiles:** `min, max, sum, size, length, norm, diag`

**Graficar 2D:** `linspace` → `plot` → `grid on` → `xlabel/ylabel/title`

**Graficar 3D:** `meshgrid` → `mesh/surf/contour` → etiquetas

**Función propia:** Archivo `nombre.m` con `function salida = nombre(entrada)`

**Sistema lineal:** `x = A \ b`

**SIEMPRE:** `clear, clc` al inicio, comentarios con `%%`, operaciones elemento a elemento con punto

---

## ✅ FIN DEL CHEATSHEET

**Recordá:** Este cheatsheet + los ejercicios resueltos son tu mejor herramienta para el examen. Leelos juntos para entender la teoría y la práctica.

¡Éxitos en el parcial Agu! 💪