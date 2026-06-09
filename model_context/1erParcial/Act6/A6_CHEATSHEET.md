# 📚 CHEATSHEET - ACTIVIDAD 6: MÉTODOS ITERATIVOS
## Métodos y Cómputos Numéricos - UCA Rosario
**Alumno:** Agustín Formenti  
**Uso:** Primer Parcial - Referencia rápida

---

## 🎯 ÍNDICE RÁPIDO
1. [Conceptos Clave](#conceptos-clave)
2. [Métodos Iterativos](#métodos-iterativos)
3. [Vector Residual y Error](#vector-residual-y-error)
4. [Número de Condición](#número-de-condición)
5. [Criterios de Parada](#criterios-de-parada)
6. [Método SOR](#método-sor)
7. [Resolución de Problemas Típicos](#resolución-de-problemas-típicos)
8. [Errores Comunes](#errores-comunes)

---

## 📌 CONCEPTOS CLAVE

### ¿Qué es un Sistema de Ecuaciones Lineales (SEL)?
```
Ax = b

donde:
- A: matriz de coeficientes (n×n)
- x: vector de incógnitas (n×1) ← LO QUE BUSCAMOS
- b: vector lado derecho (n×1)
```

### Tipos de Métodos
- **Métodos Directos**: Gauss, LU, Cholesky → Solución "exacta" en finitos pasos
- **Métodos Iterativos**: Jacobi, Gauss-Seidel, SOR → Solución aproximada por iteraciones

---

## 🔄 MÉTODOS ITERATIVOS

### 1️⃣ MÉTODO DE JACOBI

**Idea:** En cada iteración uso SOLO valores de la iteración anterior

**Fórmula:**
```
x_i^(k) = (1/a_ii) * [b_i - Σ(a_ij * x_j^(k-1))]
                              j≠i
```

**En MATLAB/Octave:**
```matlab
x = Jacobi(A, b, x0, tol, itmax)
```

**Cuándo usar:**
- Cuando A es diagonalmente dominante
- Para sistemas grandes y dispersos
- Paralelizable

**Convergencia garantizada si:**
- A es **estrictamente diagonalmente dominante**
- Es decir: `|a_ii| > Σ|a_ij|` para todo i
                      j≠i

**Verificación con código:**
```matlab
if diagdom(A)
    disp('Convergencia garantizada')
end
```

---

### 2️⃣ MÉTODO DE GAUSS-SEIDEL

**Idea:** En cada iteración uso valores YA calculados en la iteración actual

**Fórmula:**
```
x_i^(k) = (1/a_ii) * [b_i - Σ(a_ij * x_j^(k)) - Σ(a_ij * x_j^(k-1))]
                            j<i              j>i
```

**En MATLAB/Octave:**
```matlab
x = GaussSeidel(A, b, x0, tol, itmax)
```

**Cuándo usar:**
- Cuando A es diagonalmente dominante
- Generalmente **MÁS RÁPIDO** que Jacobi
- No paralelizable (cálculo secuencial)

**Convergencia:** Mismas condiciones que Jacobi

---

### 3️⃣ MÉTODO SOR (Successive Over-Relaxation)

**Idea:** Gauss-Seidel + factor de relajación ω para acelerar convergencia

**Fórmula:**
```
x_i^(k) = ω * x_i^(GS) + (1-ω) * x_i^(k-1)

donde x_i^(GS) es el valor calculado por Gauss-Seidel
```

**En MATLAB/Octave:**
```matlab
[x, iter, resrel] = SOR(A, b, x0, omega, tol, itmax)
```

**Valores de ω:**
- **ω = 1**: SOR = Gauss-Seidel (idénticos)
- **ω > 1**: Sobrerelajación (over-relaxation) → acelera convergencia
- **ω < 1**: Subrelajación (under-relaxation) → frena convergencia
- **Rango válido**: 0 < ω < 2

**Convergencia garantizada si:**
- A es **simétrica y positiva definida**
- 0 < ω < 2
- Entonces SOR converge para cualquier x₀

**Cómo encontrar ω óptimo:**
```matlab
% Probar varios omegas
omega_vals = 0.1:0.1:1.9;
for i = 1:length(omega_vals)
    [x, iter, resrel] = SOR(A, b, x0, omega_vals(i), tol, itmax);
    % Guardar el que tenga menos iteraciones
end
```

---

## 📊 VECTOR RESIDUAL Y ERROR

### Definiciones

**Vector Error:**
```
e = x_exacto - x_aproximado
```
- Mide qué tan lejos está la solución aproximada de la exacta
- **PROBLEMA:** Necesito conocer x_exacto (casi nunca lo tengo)

**Vector Residual:**
```
r = b - A*x_aproximado
```
- Mide qué tan bien la solución aproximada satisface el sistema original
- **VENTAJA:** No necesito conocer x_exacto

**Normas del Residual:**
```matlab
norma_1   = normap(r, 1)    % Norma 1
norma_2   = normap(r, 2)    % Norma 2 (euclidiana)
norma_inf = normap(r, inf)  % Norma infinito
```

### ⚠️ IMPORTANTE: Residual pequeño ≠ Error pequeño

**Relación:**
```
||e|| / ||x|| ≤ κ(A) * ||r|| / ||b||

donde κ(A) es el número de condición
```

**Esto significa:**
- Si κ(A) es **grande** (matriz mal condicionada):
  - Un residual pequeño puede tener un error GRANDE
  - No puedo confiar solo en el residual
  
- Si κ(A) es **pequeño** (matriz bien condicionada):
  - Residual pequeño → Error pequeño ✓

---

## 🔢 NÚMERO DE CONDICIÓN

### Definición
```
κ(A) = ||A|| * ||A⁻¹||
```

### Cálculo en MATLAB/Octave

**Opción 1: Manual**
```matlab
kappa_1   = norm(A, 1)   * norm(inv(A), 1)
kappa_2   = norm(A, 2)   * norm(inv(A), 2)
kappa_inf = norm(A, inf) * norm(inv(A), inf)
```

**Opción 2: Comando directo**
```matlab
kappa_1   = cond(A, 1)
kappa_2   = cond(A, 2)
kappa_inf = cond(A, inf)
```

### Interpretación

| κ(A) | Condicionamiento | Interpretación |
|------|------------------|----------------|
| ≈ 1  | Excelente | Sistema muy estable |
| < 100 | Bueno | Sistema bien condicionado |
| 100-1000 | Regular | Cuidado con errores |
| > 1000 | Malo | Sistema mal condicionado |
| >> 10⁶ | Muy malo | Puede ser casi singular |

**Matriz de Hilbert:** SIEMPRE mal condicionada (κ crece exponencialmente)

---

## ⏹️ CRITERIOS DE PARADA

### 1. Diferencia entre iteraciones (Original Jacobi/GS)
```
||x^(k) - x^(k-1)|| < tol
```
**Ventaja:** Rápido de calcular (O(n))  
**Desventaja:** No mide directamente la calidad de la solución

### 2. Norma del residual
```
||b - A*x^(k)|| < tol
```
**Ventaja:** Mide qué tan bien se satisface el sistema  
**Desventaja:** Costo O(n²) por el producto A*x

### 3. Residuo relativo (usado en SOR)
```
||b - A*x^(k)||₂ / ||b|| < tol
```
**Ventaja:** Normalizado, independiente de la escala de b  
**Desventaja:** También costo O(n²)

### ¿Cuál usar?

| Criterio | Cuándo usar |
|----------|-------------|
| Diferencia | Jacobi/GS estándar, sistemas grandes |
| Residual | Cuando necesito precisión garantizada |
| Residuo relativo | SOR, comparaciones entre sistemas |

---

## 🎨 MÉTODO SOR - GUÍA COMPLETA

### Cuándo usar SOR
✅ Cuando A es simétrica y positiva definida  
✅ Cuando quiero acelerar Gauss-Seidel  
✅ Cuando puedo experimentar con ω  

### Cómo elegir ω

**Estrategia en examen:**

1. **Si dan un ω específico:** úsalo directamente
   ```matlab
   omega = 1.1;  % valor dado
   [x, iter, resrel] = SOR(A, b, x0, omega, tol, itmax);
   ```

2. **Si piden encontrar ω óptimo:**
   ```matlab
   % Probar rango de omegas
   omega_vals = 0.1:0.1:1.9;
   min_iter = inf;
   omega_opt = 1.0;
   
   for omega = omega_vals
       [x, iter, resrel] = SOR(A, b, x0, omega, tol, itmax);
       if iter < min_iter && iter > 0
           min_iter = iter;
           omega_opt = omega;
       end
   end
   ```

3. **Si piden graficar ω vs métrica:**
   ```matlab
   for i = 1:length(omega_vals)
       [x, iter, resrel] = SOR(A, b, x0, omega_vals(i), tol, itmax);
       iteraciones(i) = iter;
       residuos(i) = resrel;
   end
   
   plot(omega_vals, iteraciones)
   % Encontrar el mínimo visualmente
   ```

### Observaciones típicas de ω

- **ω < 1**: Convergencia MUY lenta (muchas iteraciones)
- **ω ≈ 1**: Similar a Gauss-Seidel
- **ω ∈ [1.0, 1.5]**: Suele estar el óptimo para matrices bien condicionadas
- **ω > 1.8**: Puede diverger o converger muy lento

---

## 🛠️ RESOLUCIÓN DE PROBLEMAS TÍPICOS

### TIPO 1: Resolver SEL y calcular residual

**Enunciado típico:**
> "Resuelva el sistema Ax=b usando [método] y calcule el vector residual"

**Pasos:**
```matlab
% 1. Definir sistema
A = [...];
b = [...];

% 2. Parámetros
x0 = zeros(n, 1);  % o el que den
tol = 1e-9;        % o la que den
itmax = 1000;

% 3. Resolver
x = Jacobi(A, b, x0, tol, itmax);  % o GaussSeidel, o SOR

% 4. Calcular residual
r = b - A*x;

% 5. Normas del residual
norma_r_1   = normap(r, 1);
norma_r_2   = normap(r, 2);
norma_r_inf = normap(r, inf);
```

---

### TIPO 2: Generar b tal que x = ones

**Enunciado típico:**
> "Genere un vector b tal que la solución sea el vector de unos"

**Solución:**
```matlab
% Si x = [1; 1; ...; 1] es la solución
% Entonces: A*x = b
% Por lo tanto: b = A*ones(n,1)

x_exacto = ones(n, 1);
b = A * x_exacto;

% Ahora resuelvo y verifico
x_aprox = Jacobi(A, b, x0, tol, itmax);
error = x_exacto - x_aprox;  % debería ser pequeño
```

---

### TIPO 3: Calcular número de condición

**Enunciado típico:**
> "Calcule κ(A) y determine si está bien condicionada"

**Solución:**
```matlab
% Opción 1: Manual
kappa_2 = norm(A, 2) * norm(inv(A), 2);

% Opción 2: Directa
kappa_2 = cond(A, 2);

% Interpretación
if kappa_2 < 100
    disp('Matriz bien condicionada');
elseif kappa_2 < 1000
    disp('Matriz regularmente condicionada');
else
    disp('Matriz mal condicionada');
end

fprintf('Numero de condicion: %.6e\n', kappa_2);
```

---

### TIPO 4: Comparar métodos

**Enunciado típico:**
> "Compare Jacobi, Gauss-Seidel y SOR. ¿Cuál converge más rápido?"

**Solución:**
```matlab
% Jacobi
x_jac = Jacobi(A, b, x0, tol, itmax);
resrel_jac = normap(b - A*x_jac, 2) / normap(b, 2);

% Gauss-Seidel
x_gs = GaussSeidel(A, b, x0, tol, itmax);
resrel_gs = normap(b - A*x_gs, 2) / normap(b, 2);

% SOR
omega = 1.1;
[x_sor, iter_sor, resrel_sor] = SOR(A, b, x0, omega, tol, itmax);

% Tabla comparativa
fprintf('%-15s | %-15s\n', 'Metodo', 'Residuo Relativo');
fprintf('Jacobi          | %.6e\n', resrel_jac);
fprintf('Gauss-Seidel    | %.6e\n', resrel_gs);
fprintf('SOR (w=%.1f)     | %.6e\n', omega, resrel_sor);
```

---

### TIPO 5: Encontrar ω óptimo y graficar

**Enunciado típico:**
> "Para ω ∈ (0,2), grafique ω vs residuo relativo y encuentre el ω óptimo"

**Solución:**
```matlab
% Rango de omegas
omega_vals = 0.1:0.05:1.95;
n_omega = length(omega_vals);

% Vectores para resultados
residuos = zeros(n_omega, 1);
iteraciones = zeros(n_omega, 1);

% Loop
for i = 1:n_omega
    [x, iter, resrel] = SOR(A, b, x0, omega_vals(i), tol, itmax);
    iteraciones(i) = iter;
    residuos(i) = resrel;
end

% Encontrar óptimo
[min_iter, idx] = min(iteraciones(iteraciones > 0));
omega_opt = omega_vals(idx);

% Graficar
plot(omega_vals, residuos, 'b-', 'LineWidth', 2);
hold on;
plot(omega_opt, residuos(idx), 'r*', 'MarkerSize', 15);
grid on;
xlabel('omega');
ylabel('Residuo Relativo');
title('SOR: omega vs Residuo Relativo');
legend('Residuo', sprintf('Optimo: w=%.2f', omega_opt));
```

---

### TIPO 6: Matriz especial (pentadiagonal, etc)

**Enunciado típico:**
> "Construya una matriz pentadiagonal n×n con estructura dada"

**Matriz pentadiagonal:**
```
Diagonal principal: valor d
Primera sup/inf:    valor s1
Segunda sup/inf:    valor s2
```

**Solución:**
```matlab
n = 20;
d = 6;   % diagonal principal
s1 = -2; % primera diagonal
s2 = -1; % segunda diagonal

A = d * eye(n) + ...
    s1 * diag(ones(n-1, 1), 1) + ...   % sup 1
    s1 * diag(ones(n-1, 1), -1) + ...  % inf 1
    s2 * diag(ones(n-2, 1), 2) + ...   % sup 2
    s2 * diag(ones(n-2, 1), -2);       % inf 2
```

**Matriz tridiagonal:**
```matlab
n = 10;
d = 4;   % diagonal principal
s = -1;  % diagonales sup/inf

A = d * eye(n) + ...
    s * diag(ones(n-1, 1), 1) + ...
    s * diag(ones(n-1, 1), -1);
```

---

## ⚠️ ERRORES COMUNES

### 1. Confundir error con residual
❌ **MAL:** "El residual es pequeño así que el error es pequeño"  
✅ **BIEN:** "El residual es pequeño. Para saber si el error es pequeño, necesito verificar κ(A)"

### 2. No verificar convergencia
❌ **MAL:** Asumir que el método siempre converge  
✅ **BIEN:** 
```matlab
if diagdom(A)
    disp('Convergencia garantizada');
else
    disp('No se garantiza convergencia');
end
```

### 3. Olvidar que iter = -1 significa no convergencia
❌ **MAL:** Usar el resultado cuando `iter = -1`  
✅ **BIEN:**
```matlab
if iter == -1
    disp('El metodo NO convergio');
    return;
end
```

### 4. Confundir normas
```matlab
% Son DIFERENTES:
norma_residual = normap(r, 2);              % ||r||
residuo_relativo = normap(r, 2) / normap(b, 2);  % ||r|| / ||b||
```

### 5. Matriz singular o casi singular
**Síntomas:**
- κ(A) muy grande (> 10⁶)
- Métodos no convergen
- Resultados absurdos

**Qué hacer:**
- Verificar que det(A) ≠ 0
- Revisar si el sistema tiene solución
- Considerar usar otro método

### 6. Usar ω fuera del rango válido
❌ **MAL:** `omega = 2.5;` → puede diverger  
✅ **BIEN:** `0 < omega < 2`

---

## 📝 PLANTILLA DE RESPUESTA PARA EXAMEN

### Estructura general de un script:

```matlab
% Actividad 6 - Ejercicio X
% [Descripción breve]
% Alumno: Agustin Formenti

clear, clc

%% Datos del sistema
A = [...];
b = [...];

% Si piden generar b tal que x = ones
x_exacto = ones(n, 1);
b = A * x_exacto;

%% Parametros
x0 = zeros(n, 1);  % o el que den
tol = 1e-9;        % o la que den
itmax = 1000;

%% Resolver con [método]
x_aprox = Jacobi(A, b, x0, tol, itmax);
% o GaussSeidel(A, b, x0, tol, itmax)
% o SOR(A, b, x0, omega, tol, itmax)

disp('Solucion aproximada:')
disp(x_aprox)

%% Calcular residual
r = b - A * x_aprox;
norma_r_2 = normap(r, 2);

disp('Vector residual:')
disp(r)
fprintf('||r||_2 = %.10e\n', norma_r_2)

%% Calcular error (si tengo x_exacto)
error = x_exacto - x_aprox;
norma_error = normap(error, 2);

fprintf('||error||_2 = %.10e\n', norma_error)

%% Calcular residuo relativo
resrel = norma_r_2 / normap(b, 2);
fprintf('Residuo relativo = %.10e\n', resrel)
```

---

## 🔍 CHECKLIST ANTES DE ENTREGAR

**Antes de entregar cada ejercicio, verificar:**

- [ ] `clear, clc` al inicio del script
- [ ] Todas las matrices y vectores definidos correctamente
- [ ] Parámetros (x0, tol, itmax, omega) según el enunciado
- [ ] Usar las funciones correctas (Jacobi, GaussSeidel, SOR)
- [ ] Calcular lo que pide el enunciado:
  - [ ] Vector residual: `r = b - A*x`
  - [ ] Normas: `normap(r, 1)`, `normap(r, 2)`, `normap(r, inf)`
  - [ ] Residuo relativo: `normap(r,2) / normap(b,2)`
  - [ ] Error (si tengo x_exacto): `e = x_exacto - x_aprox`
  - [ ] Número de condición: `cond(A, 2)`
- [ ] Comentarios explicativos con `%%`
- [ ] `disp(' ')` y `fprintf` para mostrar resultados
- [ ] Si hay gráficas: labels, title, legend, grid

---

## 📖 FÓRMULAS DE REFERENCIA RÁPIDA

### Normas Vectoriales
```
||x||₁   = Σ|xᵢ|              (norma 1)
||x||₂   = √(Σxᵢ²)            (norma euclidiana)
||x||∞   = max|xᵢ|            (norma infinito)
```

### Normas Matriciales
```
||A||₁   = max(suma de columnas en valor absoluto)
||A||∞   = max(suma de filas en valor absoluto)
||A||₂   = √(mayor autovalor de AᵀA)
```

### Dominancia Diagonal
```
A es diagonalmente dominante si:
|aᵢᵢ| > Σ|aᵢⱼ|  para todo i
       j≠i
```

### Residuo vs Error
```
e = x_exacto - x_aprox    (error)
r = b - A*x_aprox         (residual)

Relación: ||e|| ≤ κ(A) * ||r|| / ||A||
```

---

## 💡 TIPS PARA EL EXAMEN

1. **Lee TODO el enunciado antes de empezar**
   - Identifica qué método usar
   - Qué te piden calcular
   - Qué parámetros te dan

2. **Si no te dan x0, tol, itmax:**
   - `x0 = zeros(n,1)` (siempre seguro)
   - `tol = 1e-6` o `1e-9` (típicos)
   - `itmax = 1000` (suficiente)

3. **Si piden "algún método directo o iterativo":**
   - Preferir método iterativo (más rápido de escribir)
   - Usar Gauss-Seidel (generalmente más rápido que Jacobi)

4. **Para encontrar ω óptimo:**
   - Empezar probando ω = 1.0, 1.1, 1.2, ..., 1.9
   - Buscar el que tenga menos iteraciones
   - Graficar si lo piden

5. **Verificar convergencia:**
   - Siempre revisar si `diagdom(A) == 1`
   - Si no es diag. dominante, el método puede no converger

6. **Interpretación de resultados:**
   - Residual pequeño (< 1e-6): buena aproximación
   - κ(A) < 100: matriz bien condicionada
   - iter = -1: método no convergió

7. **Gráficas:**
   - Siempre con `grid on`
   - Labels claros: `xlabel`, `ylabel`, `title`
   - Leyenda: `legend`
   - Marcar óptimos con `*` rojo

---

## 🎓 CONCEPTOS TEÓRICOS IMPORTANTES

### ¿Por qué usar métodos iterativos?

**Ventajas:**
- Eficientes para sistemas **grandes y dispersos**
- Menos operaciones que métodos directos
- Menor uso de memoria
- Buenos para matrices con estructura especial

**Desventajas:**
- No siempre convergen
- Necesitan más conocimiento previo de la matriz
- Solución aproximada (no exacta)

### ¿Cuándo NO usar métodos iterativos?

- Matriz pequeña (< 100×100) → mejor usar método directo
- No es diagonalmente dominante y no es simétrica + def. positiva
- Necesito solución exacta (no aproximada)

### ¿Por qué el residual puede ser engañoso?

Porque:
```
||error|| / ||x|| ≤ κ(A) * ||residual|| / ||b||
```

Si κ(A) es grande:
- El lado derecho puede ser grande aunque ||residual|| sea pequeño
- Por lo tanto, ||error|| puede ser grande

**Ejemplo:**
- κ(A) = 10⁶
- ||residual|| = 10⁻⁹ (muy pequeño!)
- Pero ||error|| puede ser ≈ 10⁻³ (no tan pequeño)

---

## 📚 FUNCIONES DISPONIBLES

### Funciones propias de la actividad:
```matlab
% Métodos iterativos originales
x = Jacobi(A, b, x0, tol, itmax)
x = GaussSeidel(A, b, x0, tol, itmax)
[x, iter, resrel] = SOR(A, b, x0, omega, tol, itmax)

% Utilidades
es_dd = diagdom(A)           % verifica dominancia diagonal
norma = normap(x, p)         % calcula norma p de vector x
```

### Funciones nativas MATLAB/Octave útiles:
```matlab
inv(A)           % inversa de A
norm(A, p)       % norma p de matriz A
cond(A, p)       % número de condición
det(A)           % determinante
eye(n)           % matriz identidad n×n
ones(n, 1)       % vector de unos
zeros(n, 1)      % vector de ceros
diag(v, k)       % crea matriz diagonal
hilb(n)          % matriz de Hilbert n×n
```

---

## 🚀 ESTRATEGIA DE RESOLUCIÓN EN 5 PASOS

### PASO 1: Identificar el tipo de problema
- ¿Resolver SEL? → usar método iterativo
- ¿Calcular residual? → `r = b - A*x`
- ¿Calcular κ(A)? → `cond(A, 2)`
- ¿Encontrar ω? → loop sobre omegas
- ¿Graficar? → guardar datos y plotear

### PASO 2: Escribir el encabezado
```matlab
% Actividad 6 - Ejercicio X
% [Descripción]
% Alumno: Agustin Formenti
clear, clc
```

### PASO 3: Definir sistema y parámetros
```matlab
A = [...];
b = [...];
x0 = zeros(n, 1);
tol = 1e-9;
itmax = 1000;
```

### PASO 4: Resolver y calcular lo pedido
```matlab
x = [Método](A, b, x0, tol, itmax);
r = b - A*x;
norma_r = normap(r, 2);
% etc...
```

### PASO 5: Mostrar resultados
```matlab
disp('Solucion:')
disp(x)
fprintf('||r||_2 = %.10e\n', norma_r)
```

---

## 🎯 EJEMPLOS RÁPIDOS

### Ejemplo 1: Resolver y calcular residual
```matlab
clear, clc
A = [4 -1 1; 4 -8 1; -2 1 5];
b = [7; -21; 15];
x0 = zeros(3, 1);
tol = 1e-6;
itmax = 1000;

x = GaussSeidel(A, b, x0, tol, itmax);
r = b - A*x;

disp('Solucion:'); disp(x)
fprintf('||r||_2 = %.10e\n', normap(r, 2))
```

### Ejemplo 2: Comparar métodos
```matlab
clear, clc
A = [4 -1 1; 4 -8 1; -2 1 5];
b = [7; -21; 15];
x0 = zeros(3, 1);
tol = 1e-6;
itmax = 1000;

x_jac = Jacobi(A, b, x0, tol, itmax);
x_gs = GaussSeidel(A, b, x0, tol, itmax);
[x_sor, iter, resrel] = SOR(A, b, x0, 1.1, tol, itmax);

resrel_jac = normap(b - A*x_jac, 2) / normap(b, 2);
resrel_gs = normap(b - A*x_gs, 2) / normap(b, 2);

fprintf('Jacobi:       %.6e\n', resrel_jac)
fprintf('Gauss-Seidel: %.6e\n', resrel_gs)
fprintf('SOR:          %.6e\n', resrel)
```

### Ejemplo 3: Encontrar ω óptimo
```matlab
clear, clc
A = [4 -1 -1; -1 4 -1; -1 -1 4];
b = [2; 2; 2];
x0 = zeros(3, 1);
tol = 1e-9;
itmax = 1000;

omega_vals = 1.0:0.1:1.9;
min_iter = inf;
omega_opt = 1.0;

for omega = omega_vals
    [x, iter, resrel] = SOR(A, b, x0, omega, tol, itmax);
    if iter < min_iter && iter > 0
        min_iter = iter;
        omega_opt = omega;
    end
end

fprintf('Omega optimo: %.1f (%d iteraciones)\n', omega_opt, min_iter)
```

---

## 📌 RECORDATORIOS FINALES

1. **Siempre leer el enunciado completo**
2. **Verificar qué funciones tenés disponibles**
3. **No crear funciones si no las tenés**
4. **Usar comentarios para explicar QUÉ hacés**
5. **TODO debe calcularse con código** (nada pre-computado)
6. **Verificar dominancia diagonal antes de asumir convergencia**
7. **Residual pequeño ≠ Error pequeño** si κ(A) es grande
8. **SOR converge si A simétrica + def. positiva y 0 < ω < 2**
9. **ω óptimo suele estar entre 1.0 y 1.5**
10. **iter = -1 significa NO convergió**

---

## ✅ ÚLTIMA CHECKLIST

Antes del examen, asegurate de saber:

- [ ] Diferencia entre Jacobi y Gauss-Seidel
- [ ] Cuándo usar cada método
- [ ] Qué es el vector residual y cómo calcularlo
- [ ] Qué es el número de condición y cómo interpretarlo
- [ ] Diferencia entre residual y error
- [ ] Cómo funciona SOR y qué hace ω
- [ ] Criterios de convergencia (dominancia diagonal)
- [ ] Cómo encontrar ω óptimo
- [ ] Cómo hacer gráficas básicas
- [ ] Sintaxis de las funciones: Jacobi, GaussSeidel, SOR
- [ ] Comandos útiles: normap, diagdom, cond, norm, inv

---

**¡ÉXITO EN EL EXAMEN AGU! 🚀**

*Recordá: entendé los conceptos, no memorices código. El examen evalúa tu capacidad de análisis numérico.*
