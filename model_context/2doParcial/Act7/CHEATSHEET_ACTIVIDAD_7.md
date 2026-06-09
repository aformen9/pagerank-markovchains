# 📘 CHEATSHEET - ACTIVIDAD 7: SISTEMAS DE ECUACIONES NO LINEALES (SENL) - PUNTO FIJO

**Agustín Formenti - Métodos y Cómputos Numéricos - UCA Rosario**

---

## 🎯 CONCEPTOS CLAVE

### ¿Qué es un SENL?
Un sistema de ecuaciones no lineales con **n** variables:
```
f₁(x₁, x₂, ..., xₙ) = 0
f₂(x₁, x₂, ..., xₙ) = 0
...
fₙ(x₁, x₂, ..., xₙ) = 0
```

### Raíz de un SENL
Un punto (x₁*, x₂*, ..., xₙ*) donde **todas** las funciones valen cero simultáneamente.

### Punto Fijo
Un punto P* tal que al aplicar las generatrices, obtenemos el mismo punto:
```
P* = G(P*)
```

**IMPORTANTE:** Las raíces del SENL son puntos fijos de las generatrices adecuadas.

---

## 📐 MATRIZ JACOBIANA

### Definición (2D):
```
J(x,y) = [ ∂f₁/∂x   ∂f₁/∂y ]
         [ ∂f₂/∂x   ∂f₂/∂y ]
```

### Definición (3D):
```
J(x,y,z) = [ ∂f₁/∂x   ∂f₁/∂y   ∂f₁/∂z ]
           [ ∂f₂/∂x   ∂f₂/∂y   ∂f₂/∂z ]
           [ ∂f₃/∂x   ∂f₃/∂y   ∂f₃/∂z ]
```

### ¿Para qué sirve?
- En Newton-Raphson: calcular la corrección en cada iteración
- Analizar estabilidad de la solución
- Verificar condiciones de convergencia

### Cómo calcular el Jacobiano:

**PASO 1:** Calcular derivadas parciales (trabajo simbólico)
```
∂f₁/∂x = derivada de f₁ respecto a x
∂f₁/∂y = derivada de f₁ respecto a y
...
```

**PASO 2:** Sustituir valores numéricos del punto
```
J(x*, y*) = matriz con números
```

**PASO 3:** (Opcional) Calcular determinante para análisis

---

## 🔄 MÉTODO DE PUNTO FIJO

### Esquema iterativo (2D):
```
P_{k+1} = G(P_k)

O sea:
x_{k+1} = g₁(x_k, y_k)
y_{k+1} = g₂(x_k, y_k)
```

### ¿Cómo obtener las generatrices G?

**REGLA DE ORO:** Despejar cada variable en función de las demás.

#### Ejemplo:
Sistema:
```
f₁: x² - y = 0.2
f₂: y² - x = 0.3
```

Despeje:
```
De f₁: y = x² - 0.2  →  g₂(x,y) = x² - 0.2
De f₂: x = y² - 0.3  →  g₁(x,y) = y² - 0.3
```

**¡CUIDADO!** No todas las formas de despejar convergen. Ver condiciones de convergencia.

---

## ✅ CONDICIONES DE CONVERGENCIA

### Para sistema 2D:
```
|∂g₁/∂x| + |∂g₁/∂y| < 1
|∂g₂/∂x| + |∂g₂/∂y| < 1
```

### Para sistema 3D:
```
|∂g₁/∂x| + |∂g₁/∂y| + |∂g₁/∂z| < 1
|∂g₂/∂x| + |∂g₂/∂y| + |∂g₂/∂z| < 1
|∂g₃/∂x| + |∂g₃/∂y| + |∂g₃/∂z| < 1
```

### ¿Qué significan?
- **Se cumplen** → El método **DEBERÍA** converger (no garantizado 100%)
- **NO se cumplen** → El método **PODRÍA NO** converger (pero a veces converge igual)

**IMPORTANTE:** Son condiciones **SUFICIENTES** pero NO **NECESARIAS**.

---

## 💻 IMPLEMENTACIÓN EN MATLAB

### Estructura de archivos necesarios:

1. **G_nombre.m** - Función de generatrices
2. **PuntoFijo.m** - Función iterativa (ya está hecha)
3. **ej_nombre.m** - Script principal

---

### 📁 Plantilla de G_nombre.m (2D):

```matlab
function Y = G_nombre(X)
% Descripcion del sistema
% ENTRADA: X = [x, y] vector fila
% SALIDA: Y = [g1(x,y), g2(x,y)] vector fila

x = X(1);
y = X(2);

% Generatrices (CAMBIAR SEGÚN EL PROBLEMA)
Y(1) = ...;  % g1(x,y)
Y(2) = ...;  % g2(x,y)

end
```

---

### 📁 Plantilla de G_nombre.m (3D):

```matlab
function Y = G_nombre(X)
% Descripcion del sistema
% ENTRADA: X = [x, y, z] vector fila
% SALIDA: Y = [g1(x,y,z), g2(x,y,z), g3(x,y,z)] vector fila

x = X(1);
y = X(2);
z = X(3);

% Generatrices (CAMBIAR SEGÚN EL PROBLEMA)
Y(1) = ...;  % g1(x,y,z)
Y(2) = ...;  % g2(x,y,z)
Y(3) = ...;  % g3(x,y,z)

end
```

---

### 📁 Plantilla de script principal:

```matlab
% Ejercicio X - Actividad 7
% Agustin Formenti

clear, clc

%% Parametros
P0 = [...];      % punto inicial
tol = 1e-9;      % tolerancia
itmax = 50;      % iteraciones maximas

%% Aplico Punto Fijo
[Pk, iter] = PuntoFijo('G_nombre', P0, tol, itmax);

%% Muestro resultado
fprintf('Punto fijo: ');
fprintf('%.6f ', Pk);
fprintf('\n');
fprintf('Iteraciones: %d\n', iter);

%% Verifico (evaluar generatrices en el punto)
Pk_verif = feval('G_nombre', Pk);
fprintf('Error: %.2e\n', norm(Pk - Pk_verif));
```

---

## 🎨 GRÁFICAS DE CURVAS

### Para graficar curvas implícitas:

```matlab
% Crear malla
x = linspace(xmin, xmax, 400);
y = linspace(ymin, ymax, 400);
[X, Y] = meshgrid(x, y);

% Evaluar funciones
F1 = ... ;  % ecuación 1 igualada a 0
F2 = ... ;  % ecuación 2 igualada a 0

% Graficar con contour
figure(1)
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2), hold on
contour(X, Y, F2, [0 0], 'r', 'LineWidth', 2)
grid on
xlabel('x'), ylabel('y')
legend('Curva 1', 'Curva 2')
axis equal
hold off
```

**TIP:** Las raíces están donde se **intersectan** las curvas.

---

## 🔧 TRUCOS Y TIPS PARA EL PARCIAL

### 1️⃣ Si el ejercicio pide "encontrar raíces manualmente":
- Resolver el sistema algebraicamente (despeje, sustitución, etc.)
- Calcular derivadas parciales a mano
- Evaluar el Jacobiano en las raíces encontradas

### 2️⃣ Si el ejercicio pide "encontrar puntos fijos manualmente":
- Plantear x = g₁(x,y) e y = g₂(x,y)
- Resolver el sistema
- **NO es lo mismo que encontrar raíces** (pero están relacionados)

### 3️⃣ Si el ejercicio pide "dos iteraciones a mano":
- **HACELO EN CÓDIGO** mostrando cada cálculo paso a paso
- Usar `fprintf` para mostrar componentes intermedios
- Ejemplo:
```matlab
comp1 = 8*x;
comp2 = 4*x^2;
numerador = comp1 - comp2 + ...;
resultado = numerador/8;
fprintf('x = (%.2f - %.2f + ...)/8 = %.6f\n', comp1, comp2, resultado);
```

### 4️⃣ Si pide "analizar condiciones de convergencia":
```matlab
% Definir derivadas
dg1_dx = @(x,y) ...;
dg1_dy = @(x,y) ...;
...

% Evaluar en punto
vals = [dg1_dx(x0,y0), dg1_dy(x0,y0), ...];

% Calcular condiciones
cond1 = abs(vals(1)) + abs(vals(2));
if cond1 < 1
    fprintf('SE CUMPLE\n');
else
    fprintf('NO SE CUMPLE\n');
end
```

### 5️⃣ Si pide "región de convergencia":
- Resolver las inecuaciones de las condiciones
- Graficar la región en el plano xy
- Probar con puntos dentro y fuera de la región

### 6️⃣ Si el método DIVERGE:
**¡NO TE ASUSTES!** Es válido reportar:
```
"El método de Punto Fijo diverge para este sistema.
Las generatrices no cumplen las condiciones de convergencia.
Sería necesario:
  - Probar con otras generatrices alternativas
  - Usar otro método (Newton-Raphson)
  - Probar con otro punto inicial"
```

### 7️⃣ Sistemas 3D:
- Usar **PuntoFijo3D.m** (igual que PuntoFijo.m pero con 3 variables)
- Las generatrices tienen 3 componentes
- Las condiciones de convergencia tienen 3 términos

### 8️⃣ Cambio de variable:
Si el ejercicio sugiere α = ln(x), β = ln(y):
- Transformar todo el sistema
- Las nuevas generatrices trabajan con α, β
- Al final: x = exp(α), y = exp(β)
- **Objetivo:** Mejorar estabilidad numérica

---

## 📋 CHECKLIST PARA EL PARCIAL

### Antes de empezar:
- [ ] Identificar qué tipo de ejercicio es (raíces, puntos fijos, gráficas, convergencia)
- [ ] Leer BIEN el enunciado (¿manual o con código?)
- [ ] Tener clara la diferencia entre raíz y punto fijo

### Durante la resolución:
- [ ] Si hay que crear función G: verificar formato (vector fila → vector fila)
- [ ] Si hay que graficar: usar `contour` con [0 0]
- [ ] Si hay que analizar convergencia: calcular derivadas y evaluar condiciones
- [ ] Si hay que iterar "a mano": hacerlo en código con fprintf mostrando cálculos

### Al terminar:
- [ ] Verificar resultado (evaluar generatrices en el punto encontrado)
- [ ] Si diverge: explicar por qué (condiciones no se cumplen)
- [ ] Comentar código apropiadamente
- [ ] Verificar que todos los archivos estén creados (.m de generatrices, script principal)

---

## 🚨 ERRORES COMUNES A EVITAR

### ❌ NO HAGAS ESTO:
1. Confundir raíz con punto fijo
2. Olvidar que las generatrices reciben/devuelven **vectores fila**
3. Usar `.` cuando no es necesario (dentro de funciones)
4. Hardcodear resultados en los `fprintf` (todo debe calcularse)
5. Crear generatrices que no cumplen la ecuación original
6. Olvidar verificar el resultado final
7. No manejar el caso de divergencia

### ✅ HAZ ESTO:
1. Verificar SIEMPRE que G(P*) ≈ P*
2. Usar formato de vector: X(1), X(2), etc.
3. Calcular todo dinámicamente
4. Probar con varios puntos iniciales si el primero diverge
5. Comentar el código
6. Mostrar cálculos intermedios en las iteraciones "a mano"

---

## 📚 RESUMEN DE FUNCIONES MATLAB

```matlab
% Norma de un vector
norm([x, y])

% Valor absoluto
abs(x)

% Exponencial
exp(x)

% Logaritmo natural
log(x)

% Evaluar función por nombre
feval('nombre_funcion', argumentos)

% Crear malla para gráficas
[X, Y] = meshgrid(x, y)

% Graficar curvas de nivel
contour(X, Y, F, [0 0])
```

---

## 🎓 EJEMPLO COMPLETO PASO A PASO

### Sistema:
```
x² + y² - z = 0
x² + y² + z² - 1 = 0
x + y = 0
```

### PASO 1: Identificar qué pide
- "Encontrar raíces" → Resolver algebraicamente
- "Usar Punto Fijo" → Crear generatrices

### PASO 2: Despejar generatrices
```
De ec. 3: y = -x
Sustituir en ec. 1: z = x² + y² = 2x²
Sustituir en ec. 2: resolver para x
```

### PASO 3: Crear G_ejemplo.m
```matlab
function Y = G_ejemplo(X)
x = X(1);
y = X(2);
z = X(3);

Y(1) = ...;
Y(2) = -X(1);  % y = -x
Y(3) = 2*X(1)^2;  % z = 2x²
end
```

### PASO 4: Script principal
```matlab
P0 = [1, -1, 2];
[Pk, iter] = PuntoFijo3D('G_ejemplo', P0, 1e-9, 50);
```

### PASO 5: Verificar
```matlab
Pk_verif = feval('G_ejemplo', Pk);
error = norm(Pk - Pk_verif);
fprintf('Error: %.2e\n', error);
```

---

## 🎯 ESTRATEGIA GENERAL PARA EL PARCIAL

### 1. Lee el enunciado completo
### 2. Identifica el tipo de ejercicio
### 3. Si es manual → papel y lápiz
### 4. Si es con código → estructura de archivos
### 5. Verifica SIEMPRE tus resultados
### 6. Si diverge → explica por qué
### 7. Comenta tu código

---

## 💡 RECORDATORIOS FINALES

- **Punto Fijo NO siempre converge** → Es normal que algunos ejercicios divergan
- **Las condiciones son suficientes, no necesarias** → Puede converger aunque no se cumplan
- **Diferentes puntos iniciales dan diferentes resultados** → Probar varios
- **El cambio de variable puede ayudar** → Logaritmos, exponenciales, etc.
- **Graficar ayuda a visualizar** → Intersecciones = raíces
- **Verificar siempre el resultado final** → G(P*) ≈ P*

---

## 📞 CONTACTO DE EMERGENCIA PRE-PARCIAL

Si tenés dudas:
1. Revisar este cheatsheet
2. Revisar ejercicios resueltos de la actividad
3. Revisar teoría (slides L9)
4. Consultar ejemplos en archivos .m

---

**¡ÉXITOS EN EL PARCIAL AGU! 🚀**

*Recordá: la práctica hace al maestro. Resolvé los ejercicios varias veces hasta que te salgan naturalmente.*
