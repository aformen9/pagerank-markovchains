# 📘 CHEATSHEET - ACTIVIDAD 5: MÉTODOS DIRECTOS PARA SEL

**Asignatura:** Métodos y Cómputos Numéricos  
**Tema:** Resolución de Sistemas de Ecuaciones Lineales (SEL) - Métodos Directos  
**Alumno:** Agustín Formenti  

---

## 📋 ÍNDICE RÁPIDO

1. [Conceptos Fundamentales](#1-conceptos-fundamentales)
2. [Método de Gauss con Pivoteo](#2-método-de-gauss-con-pivoteo)
3. [Método de Cramer](#3-método-de-cramer)
4. [Factorización LU](#4-factorización-lu)
5. [Método de Cholesky](#5-método-de-cholesky)
6. [Verificación de Soluciones](#6-verificación-de-soluciones)
7. [Matrices Especiales](#7-matrices-especiales)
8. [Trucos y Advertencias](#8-trucos-y-advertencias)
9. [Checklist de Examen](#9-checklist-de-examen)

---

## 1. CONCEPTOS FUNDAMENTALES

### 1.1 Sistema de Ecuaciones Lineales (SEL)

**Forma general:**
```
a11*x1 + a12*x2 + ... + a1n*xn = b1
a21*x1 + a22*x2 + ... + a2n*xn = b2
...
an1*x1 + an2*x2 + ... + ann*xn = bn
```

**Forma matricial:**
```
Ax = b
```
- **A**: matriz de coeficientes (n×n)
- **x**: vector incógnita (n×1)
- **b**: vector lado derecho (n×1)

### 1.2 Métodos Directos vs Iterativos

| Aspecto | Métodos Directos | Métodos Iterativos |
|---------|------------------|-------------------|
| **Resultado** | Solución "exacta" (con error de redondeo) | Solución aproximada |
| **Iteraciones** | Número fijo de pasos | Converge gradualmente |
| **Costo** | O(n³) operaciones | Depende de convergencia |
| **Ejemplos** | Gauss, Cramer, LU, Cholesky | Jacobi, Gauss-Seidel |

### 1.3 Matriz Aumentada

**Definición:** Matriz que combina A y b
```matlab
Aum = [A b]
```

**Ejemplo 3×3:**
```
[2  -3  100 | 1  ]
[1  10 -0.001| 0  ]
[3 -100 0.01 | 0  ]
```

---

## 2. MÉTODO DE GAUSS CON PIVOTEO

### 2.1 ¿Qué es?

Transforma el sistema Ax = b en un sistema triangular superior Ux = c mediante **operaciones elementales** sobre filas.

### 2.2 Operaciones Elementales

1. **Intercambio**: rk ↔ rj (cambiar orden de filas)
2. **Escalamiento**: α·rk → rk (multiplicar fila por constante ≠ 0)
3. **Sustitución**: rk + m·rj → rk (sumar múltiplo de otra fila)

### 2.3 Pivoteo Parcial Escalado

**¿Por qué?** Mejora la estabilidad numérica evitando divisiones por números muy pequeños.

**Paso a paso:**

1. **Calcular factores de escala** para cada fila:
   ```
   Si = max(|aij|) para j = 1,...,n
   ```

2. **En cada paso k**, elegir pivote:
   ```
   max(|aik|/Si) para i = k,...,n
   ```

3. **Intercambiar filas** si es necesario

4. **Eliminar** elementos debajo del pivote:
   ```
   mik = aik/akk
   ri = ri - mik*rk
   ```

### 2.4 Sustitución Regresiva

Después de tener matriz triangular superior, resolver desde la última ecuación hacia arriba:

```
x(n) = c(n)/U(n,n)

Para k = n-1:-1:1:
    x(k) = (c(k) - U(k,k+1:n)*x(k+1:n)') / U(k,k)
```

### 2.5 Código MATLAB/Octave

```matlab
% Resolver sistema con Gauss
x = Gauss(A, b);

% Verificar solución
r = b - A*x;
norma_r = normap(r, 2);
```

### 2.6 Ventajas y Desventajas

✅ **Ventajas:**
- General (funciona para cualquier matriz invertible)
- Numericamente estable con pivoteo
- Costo O(n³/2)

❌ **Desventajas:**
- No aprovecha estructura especial de matrices
- Más lento que métodos especializados
- Puede ser inestable sin pivoteo

---

## 3. MÉTODO DE CRAMER

### 3.1 ¿Qué es?

Resuelve SEL usando **determinantes**. Cada incógnita se calcula como:

```
xi = det(Ai) / det(A)
```

donde **Ai** es A con la i-ésima columna reemplazada por b.

### 3.2 Fórmula

Para un sistema 3×3:
```
     |b1 a12 a13|        |a11 b1 a13|        |a11 a12 b1|
x1 = |b2 a22 a23| / |A|  x2 = |a21 b2 a23| / |A|  x3 = |a21 a22 b2| / |A|
     |b3 a32 a33|        |a31 b3 a33|        |a31 a32 b3|
```

### 3.3 Código MATLAB/Octave

```matlab
% Resolver con Cramer
x = Cramer(A, b);
```

### 3.4 Ventajas y Desventajas

✅ **Ventajas:**
- Fácil de entender conceptualmente
- Útil para sistemas pequeños (2×2, 3×3)

❌ **Desventajas:**
- **MUY INEFICIENTE** para n > 3
- Complejidad O(n·n!) 
- Para n=1000, puede tardar horas/días
- Gauss es **órdenes de magnitud más rápido**

### 3.5 ⚠️ ADVERTENCIA IMPORTANTE

**NUNCA uses Cramer para matrices grandes en el examen**, a menos que el ejercicio lo pida explícitamente. Es extremadamente lento.

---

## 4. FACTORIZACIÓN LU

### 4.1 ¿Qué es?

Descompone A en producto de dos matrices triangulares:

```
PA = LU
```
- **P**: matriz de permutación (para pivoteo)
- **L**: triangular inferior (Lower) con diagonal de unos
- **U**: triangular superior (Upper)

### 4.2 ¿Para qué sirve?

**Ventaja principal:** Resolver múltiples sistemas con la **misma matriz A** pero **diferentes vectores b**.

**Costo:**
- Factorizar PA = LU: **O(n³)** (una sola vez)
- Resolver cada sistema: **O(n²)** (sustitucion progresiva + regresiva)

### 4.3 Cómo resolver Ax = b con LU

Si PA = LU, entonces:

```
PAx = Pb
LUx = Pb
```

**Paso 1:** Resolver **Ly = Pb** (sustitución progresiva)
```matlab
y = Progresiva(L, Pb);
```

**Paso 2:** Resolver **Ux = y** (sustitución regresiva)
```matlab
x = Regresiva(U, y);
```

### 4.4 Obtener factorización LU

```matlab
% Obtener L, U, P
[L, U, P] = lu(A);

% Verificar
PA = P * A;
LU = L * U;
error = norm(PA - LU, 2);  % debe ser ≈ 0
```

### 4.5 Reconstruir A desde LU

Si conoces L, U, P:

```matlab
A = P' * L * U;    % porque P^(-1) = P'
```

### 4.6 Aplicación: Inversión de Matrices

Para calcular A^(-1), resolver n sistemas:
```
Ax_i = e_i    para i = 1,2,...,n
```

donde e_i son los versores canónicos (columnas de la identidad).

Entonces:
```
A^(-1) = [x_1  x_2  ...  x_n]
```

### 4.7 Código MATLAB/Octave

```matlab
% Factorización
[L, U, P] = lu(A);

% Resolver sistema
Pb = P * b;
y = Progresiva(L, Pb);
x = Regresiva(U, y);

% Verificar
r = b - A*x;
```

### 4.8 Sustitución Progresiva y Regresiva

**Sustitución Progresiva** (Ly = b, L triangular inferior):
```matlab
y(1) = b(1) / L(1,1);
for k = 2:n
    y(k) = (b(k) - L(k,1:k-1)*y(1:k-1)') / L(k,k);
end
```

**Sustitución Regresiva** (Ux = y, U triangular superior):
```matlab
x(n) = y(n) / U(n,n);
for k = n-1:-1:1
    x(k) = (y(k) - U(k,k+1:n)*x(k+1:n)') / U(k,k);
end
```

---

## 5. MÉTODO DE CHOLESKY

### 5.1 ¿Qué es?

Factorización especializada para matrices **simétricas y definidas positivas**:

```
A = R^T * R
```

donde **R** es triangular superior.

### 5.2 ¿Cuándo se puede usar?

**Condiciones necesarias:**
1. A debe ser **simétrica**: A = A^T
2. A debe ser **definida positiva**: x^T·A·x > 0 para todo x ≠ 0

### 5.3 Verificar matriz definida positiva

**Método 1: Autovalores**
```matlab
autovalores = eig(A);
if all(autovalores > 0)
    disp('A es definida positiva');
end
```

**Método 2: Intentar Cholesky**
- Si falla → no es definida positiva
- Si funciona → es definida positiva

### 5.4 Ventajas de Cholesky

✅ **Más rápido que Gauss**: ~2 veces más rápido
- Cholesky: O(n³/3) operaciones
- Gauss: O(n³/2) operaciones

✅ **Más estable numéricamente**: no requiere pivoteo

✅ **Aprovecha simetría**: solo almacena mitad de la matriz

### 5.5 Cómo resolver Ax = b con Cholesky

**Opción 1: Función completa**
```matlab
[x, R] = Cholesky(A, b);
```

**Opción 2: Manual**
```matlab
% Factorizar
R = DescompCholesky(A);

% Resolver R^T * y = b
y = Progresiva(R', b);

% Resolver R * x = y
x = Regresiva(R, y);
```

### 5.6 Código MATLAB/Octave

```matlab
% Verificar condiciones
if ~isequal(A, A')
    disp('A no es simétrica');
end

autovalores = eig(A);
if ~all(autovalores > 0)
    disp('A no es definida positiva');
end

% Resolver
[x, R] = Cholesky(A, b);

% Verificar factorización
error = norm(A - R'*R, 2);  % debe ser ≈ 0
```

### 5.7 Matrices comunes definidas positivas

- **Matrices diagonales** con diagonal > 0
- **Matrices de covarianza**
- **Matrices de Gram** (A = B^T·B)
- **Matrices de Hilbert**
- **Matrices tridiagonales simétricas con diagonal dominante**

---

## 6. VERIFICACIÓN DE SOLUCIONES

### 6.1 Vector Residual

**Definición:**
```
r = b - Ax
```

**Interpretación:** mide qué tan bien la solución aproximada satisface el sistema original.

### 6.2 Norma del Residual

```matlab
r = b - A*x;
norma_1 = normap(r, 1);      % norma-1
norma_2 = normap(r, 2);      % norma-2 (más común)
norma_inf = normap(r, inf);  % norma-infinito
```

**Criterio:**
- Si ||r||₂ < 10⁻¹⁰ → solución muy precisa
- Si ||r||₂ > 10⁻⁶ → hay error apreciable

### 6.3 Verificación completa

```matlab
% Calcular residual
r = b - A*x;

% Mostrar normas
fprintf('||r||_1   = %.10e\n', normap(r, 1));
fprintf('||r||_2   = %.10e\n', normap(r, 2));
fprintf('||r||_inf = %.10e\n', normap(r, inf));

% Verificar
Ax = A * x;
disp('A*x debe ser ≈ b:');
disp([Ax b]);
```

### 6.4 Comparar con solución exacta

```matlab
% Solución exacta (usando backslash)
x_exacto = A \ b;

% Error absoluto
error = normap(x - x_exacto, 2);
fprintf('Error: %.10e\n', error);
```

---

## 7. MATRICES ESPECIALES

### 7.1 Matriz Triangular Superior

```
[a11  a12  a13  a14]
[ 0   a22  a23  a24]
[ 0    0   a33  a34]
[ 0    0    0   a44]
```

**Resolver:** Sustitución regresiva (de abajo hacia arriba)

### 7.2 Matriz Triangular Inferior

```
[a11   0    0    0 ]
[a21  a22   0    0 ]
[a31  a32  a33   0 ]
[a41  a42  a43  a44]
```

**Resolver:** Sustitución progresiva (de arriba hacia abajo)

### 7.3 Matriz de Permutación

**Propiedades:**
- Cada fila y columna tiene un solo 1
- Es la identidad con filas/columnas intercambiadas
- P^(-1) = P^T

**Ejemplo:**
```matlab
P = [0 1 0;
     1 0 0;
     0 0 1];  % intercambia filas 1 y 2
```

### 7.4 Matriz Simétrica

```
A = A^T
```

**Verificar:**
```matlab
if isequal(A, A')
    disp('A es simétrica');
end
```

### 7.5 Matriz Definida Positiva

**Definición:** A simétrica tal que x^T·A·x > 0 para todo x ≠ 0

**Verificar:**
```matlab
autovalores = eig(A);
if isequal(A, A') && all(autovalores > 0)
    disp('A es definida positiva');
end
```

---

## 8. TRUCOS Y ADVERTENCIAS

### 8.1 ⚠️ Errores Comunes

#### Error 1: Usar `normap` con matrices
```matlab
❌ error = normap(A - B, 2);  % INCORRECTO (A,B son matrices)
✅ error = norm(A - B, 2);     % CORRECTO
```

**Regla:** 
- `normap(x, p)` → solo para **vectores**
- `norm(A, p)` → para **matrices**

#### Error 2: Olvidar transponer P
```matlab
❌ A = P * L * U;     % INCORRECTO
✅ A = P' * L * U;    % CORRECTO (P^(-1) = P')
```

#### Error 3: No verificar simetría antes de Cholesky
```matlab
% SIEMPRE verificar antes de usar Cholesky
if ~isequal(A, A')
    disp('ERROR: A no es simétrica, no usar Cholesky');
end
```

#### Error 4: Confundir orden en factorización
```matlab
PA = LU   ✅ CORRECTO
AP = LU   ❌ INCORRECTO
```

### 8.2 💡 Trucos de Examen

#### Truco 1: Identificar el método apropiado

| Característica | Método Recomendado |
|----------------|-------------------|
| Matriz general | Gauss |
| Sistema pequeño (2×2, 3×3) | Cramer (si lo piden) |
| Múltiples vectores b | LU |
| Matriz simétrica definida positiva | Cholesky |
| Calcular inversa | LU |

#### Truco 2: Verificación rápida

```matlab
% Verificar solución rápidamente
max(abs(b - A*x))  % debe ser ≈ 0
```

#### Truco 3: Sistemas con infinitas soluciones

Si dos filas son proporcionales:
- El sistema tiene infinitas soluciones (o ninguna)
- La última fila quedará [0 0 ... 0 | c]
- Si c ≈ 0 → infinitas soluciones
- Si c ≠ 0 → sin solución

#### Truco 4: Matrices mal condicionadas

Si det(A) ≈ 0 o muy pequeño → matriz mal condicionada
- Puede haber gran error numérico
- La solución es sensible a perturbaciones

### 8.3 📊 Comparación de Tiempos

Para matriz n×n:

| Método | Complejidad | Tiempo relativo (n=1000) |
|--------|-------------|--------------------------|
| Cramer | O(n·n!) | ⏰ AÑOS/SIGLOS |
| Gauss | O(n³/2) | ⏰ ~1 segundo |
| LU | O(n³) | ⏰ ~1 segundo (primera vez) |
| Cholesky | O(n³/3) | ⏰ ~0.5 segundos |

**Conclusión:** NUNCA usar Cramer para n > 10

---

## 9. CHECKLIST DE EXAMEN

### 9.1 Antes de resolver

- [ ] Leer el problema completo
- [ ] Identificar qué pide cada inciso
- [ ] Ver qué funciones están disponibles
- [ ] Elegir el método apropiado

### 9.2 Durante la resolución

- [ ] Crear un script por inciso
- [ ] Comenzar con `clear, clc`
- [ ] Definir A y b correctamente
- [ ] Comentar cada sección con `%%`
- [ ] Calcular TODO con código (nada pre-computado)
- [ ] Mostrar resultados con `disp()` o `fprintf()`

### 9.3 Verificación

- [ ] Calcular residual r = b - A*x
- [ ] Calcular normas del residual
- [ ] Verificar que ||r|| < 10⁻¹⁰
- [ ] Si pide comparar, calcular x_exacto = A\b
- [ ] Agregar mensaje de fin

### 9.4 Para factorizaciones

- [ ] Verificar que PA = LU (o A = R^T·R)
- [ ] Calcular error de factorización
- [ ] Mostrar matrices L, U, P (o R)

### 9.5 Casos especiales

**Si pide modificar función:**
- [ ] Copiar función original
- [ ] Renombrar (ej: Gauss_mod)
- [ ] Hacer modificación pedida
- [ ] Probar con ejemplo

**Si matriz no es invertible:**
- [ ] Verificar det(A) ≈ 0
- [ ] Verificar si última fila es [0...0|c]
- [ ] Explicar en comentarios

**Si pide comparar tiempos:**
- [ ] Usar `tic` antes de llamar función
- [ ] Usar `tiempo = toc` después
- [ ] Calcular factor = tiempo1/tiempo2
- [ ] Mostrar tabla comparativa

---

## 10. EJEMPLOS RÁPIDOS

### 10.1 Sistema 3×3 con Gauss

```matlab
% Definir sistema
A = [10, 3, 1;
     3, 10, 2;
     1, 2, 10];
b = [19; 29; 35];

% Resolver
x = Gauss(A, b);

% Verificar
r = b - A*x;
fprintf('||r||_2 = %.10e\n', normap(r, 2));
```

### 10.2 Factorización LU

```matlab
% Obtener factorización
[L, U, P] = lu(A);

% Resolver Ax = b
Pb = P * b;
y = Progresiva(L, Pb);
x = Regresiva(U, y);

% Verificar factorización
error = norm(P*A - L*U, 2);
```

### 10.3 Cholesky

```matlab
% Verificar condiciones
if ~isequal(A, A') || ~all(eig(A) > 0)
    error('A no es simétrica definida positiva');
end

% Resolver
[x, R] = Cholesky(A, b);

% Verificar factorización
error = norm(A - R'*R, 2);
```

### 10.4 Comparar métodos

```matlab
% Método 1
tic
x1 = Cramer(A, b);
t1 = toc;

% Método 2
tic
x2 = Gauss(A, b);
t2 = toc;

% Comparar
fprintf('Tiempo Cramer: %.6f s\n', t1);
fprintf('Tiempo Gauss:  %.6f s\n', t2);
fprintf('Factor: %.2f\n', t1/t2);
```

---

## 11. FÓRMULAS CLAVE

### 11.1 Normas de vectores

```
||x||_1 = |x1| + |x2| + ... + |xn|

||x||_2 = sqrt(x1² + x2² + ... + xn²)

||x||_inf = max(|x1|, |x2|, ..., |xn|)
```

### 11.2 Determinante 2×2

```
det([a b]) = ad - bc
    [c d]
```

### 11.3 Determinante 3×3 (Regla de Sarrus)

```
det(A) = a11·a22·a33 + a12·a23·a31 + a13·a21·a32
       - a13·a22·a31 - a11·a23·a32 - a12·a21·a33
```

### 11.4 Matriz Inversa 2×2

```
[a b]^(-1) =    1    [ d  -b]
[c d]        ad-bc   [-c   a]
```

---

## 12. COMANDOS ÚTILES MATLAB/OCTAVE

### 12.1 Operaciones básicas

```matlab
% Tamaño de matriz
[m, n] = size(A);

% Transpuesta
A_T = A';

% Inversa
A_inv = inv(A);

% Determinante
d = det(A);

% Autovalores
lambda = eig(A);

% Norma
n = norm(A, 2);
```

### 12.2 Funciones del curso

```matlab
% Métodos directos
x = Gauss(A, b);
x = Cramer(A, b);
x = DescompLU(A, b);
[x, R] = Cholesky(A, b);

% Factorización
[L, U, P] = lu(A);
R = chol(A);
R = DescompCholesky(A);

% Sustitución
x = Regresiva(U, b);  % U triangular superior
y = Progresiva(L, b); % L triangular inferior

% Norma de vector
np = normap(x, p);
```

### 12.3 Verificaciones

```matlab
% Verificar simetría
isequal(A, A')

% Verificar definida positiva
all(eig(A) > 0)

% Solución exacta
x_exacto = A \ b;
% equivalente a: mldivide(A, b)
```

---

## 13. ESTRATEGIA DE EXAMEN

### 13.1 Lectura del problema

1. **Leer TODO el ejercicio** antes de empezar
2. **Identificar** qué método pide cada inciso
3. **Ver** qué funciones ya tenés disponibles
4. **Planificar** cuántos scripts necesitás

### 13.2 Orden recomendado

1. **Incisos sencillos primero** (ej: resolver con Gauss)
2. **Luego verificaciones** (residual, normas)
3. **Después comparaciones** (tiempos, errores)
4. **Al final, modificaciones** de funciones si pide

### 13.3 Gestión del tiempo

- **Sistema simple (3×3)**: ~5-10 minutos
- **Factorización LU**: ~10-15 minutos
- **Cholesky completo**: ~10-15 minutos
- **Comparación de métodos**: ~15-20 minutos

### 13.4 Si te trabás

1. **No pierdas tiempo** en un inciso difícil
2. **Pasá al siguiente** y volvé después
3. **Dejá comentarios** explicando qué querías hacer
4. **Mostrá conocimiento** aunque no funcione el código

---

## 14. ERRORES TÍPICOS Y SOLUCIONES

| Error | Causa | Solución |
|-------|-------|----------|
| `Matrix dimensions must agree` | Multiplicación incorrecta | Verificar dimensiones con `size()` |
| `for x^y, only square matrix...` | Usar `^` en lugar de `.^` | Usar `normap` solo con vectores |
| `A must be square` | Matriz no cuadrada | Verificar que n_filas = n_columnas |
| `Matrix is singular` | det(A) = 0 | Matriz no invertible, verificar datos |
| `Not positive definite` | Cholesky falla | A no es def. positiva, usar Gauss |

---

## 15. RESUMEN ULTRA-RÁPIDO

### ¿Qué método usar?

```
┌─────────────────────────────────────────────────┐
│ ¿Matriz simétrica def. positiva?                │
│   SÍ  → CHOLESKY (más rápido)                   │
│   NO  → siguiente pregunta                       │
├─────────────────────────────────────────────────┤
│ ¿Múltiples vectores b con misma A?              │
│   SÍ  → LU (factorizar una vez, resolver varias)│
│   NO  → siguiente pregunta                       │
├─────────────────────────────────────────────────┤
│ ¿Sistema pequeño (2×2, 3×3) y te piden Cramer?  │
│   SÍ  → CRAMER (solo si lo piden)               │
│   NO  → GAUSS (método general)                   │
└─────────────────────────────────────────────────┘
```

### Plantilla básica

```matlab
% Actividad 5 - Ejercicio X
% [Descripción breve]
% Alumno: Agustin Formenti

clear, clc

%% Definir sistema
A = [...];
b = [...];

%% Resolver
x = Metodo(A, b);

disp('Solucion:')
disp(x)

%% Verificar
r = b - A*x;
fprintf('||r||_2 = %.10e\n', normap(r, 2));

disp('========== FIN EJERCICIO X ==========')
```

---

## 16. CONTACTO Y RECURSOS

**Dudas:** Revisar ejercicios resueltos de la Actividad 5

**Funciones disponibles:**
- `Gauss.m`
- `Cramer.m`
- `DescompLU.m`
- `Cholesky.m`
- `DescompCholesky.m`
- `Progresiva.m`
- `Regresiva.m`
- `normap.m`
- `diagdom.m`

**Referencias:**
- Lectura 7: Métodos Directos
- Actividad 5: Ejercicios 1-10
- Ejemplos de parcial

---

## ✅ ÚLTIMA REVISIÓN ANTES DEL EXAMEN

- [ ] Repasé conceptos fundamentales
- [ ] Entiendo cuándo usar cada método
- [ ] Sé calcular residual y normas
- [ ] Sé verificar factorizaciones
- [ ] Conozco errores comunes
- [ ] Tengo funciones disponibles
- [ ] Practiqué con ejercicios resueltos

---

**¡ÉXITOS EN EL EXAMEN! 🚀**

*Última actualización: 2025*
