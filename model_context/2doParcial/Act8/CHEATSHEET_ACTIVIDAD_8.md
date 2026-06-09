# 📘 CHEATSHEET - ACTIVIDAD 8: NEWTON-RAPHSON PARA SENL
## Métodos y Cómputos Numéricos - UCA Rosario
**Agustín Formenti - Preparación Segundo Parcial**

---

## 🎯 ¿QUÉ ES NEWTON-RAPHSON PARA SENL?

**Método iterativo** para resolver **Sistemas de Ecuaciones No Lineales** (SENL).

### Diferencia con Punto Fijo:
- **Punto Fijo:** X = G(X) → requiere despejar generatrices
- **Newton-Raphson:** F(X) = 0 → usa la Jacobiana directamente

### Ventajas de Newton-Raphson:
✅ **Convergencia cuadrática** (muy rápida)  
✅ **No necesitas despejar** las variables  
✅ **Pocas iteraciones** para alta precisión  
✅ **Más robusto** que Punto Fijo en muchos casos

### Desventajas:
❌ Requiere calcular la **Jacobiana** (derivadas parciales)  
❌ Necesita **buen punto inicial**  
❌ Puede diverger si empezás lejos de la raíz

---

## 📐 FÓRMULA ITERATIVA - NEWTON-RAPHSON

### Para 2D:
```
Sistema: F(x,y) = 0  donde F = [f1(x,y); f2(x,y)]

Iteración: X_{k+1} = X_k + ΔX_k

donde ΔX_k se obtiene resolviendo:
    J(X_k) * ΔX_k = -F(X_k)

Jacobiana J(x,y) = | ∂f1/∂x  ∂f1/∂y |
                   | ∂f2/∂x  ∂f2/∂y |
```

### Para 3D:
```
Sistema: F(x,y,z) = 0  donde F = [f1; f2; f3]

Jacobiana J(x,y,z) = | ∂f1/∂x  ∂f1/∂y  ∂f1/∂z |
                     | ∂f2/∂x  ∂f2/∂y  ∂f2/∂z |
                     | ∂f3/∂x  ∂f3/∂y  ∂f3/∂z |
```

### ⚠️ IMPORTANTE:
**NO calcules la inversa J⁻¹** → Resuelve el sistema lineal con Gauss.m

---

## 🔧 PASO A PASO: CÓMO RESOLVER UN EJERCICIO

### PASO 1: Identificar el tipo de ejercicio

#### Tipo A: "Calcule 2 iteraciones manualmente"
→ Hacer iteraciones paso a paso con código  
→ Ejemplo: Ejercicio 1

#### Tipo B: "Grafique y resuelva"
→ Graficar curvas de nivel + usar NewtonRaphsonSENL  
→ Ejemplo: Ejercicios 2, 3

#### Tipo C: "Verificar soluciones"
→ Evaluar F en los puntos dados  
→ Ejemplo: Ejercicio 4

#### Tipo D: "Demostración teórica"
→ Desarrollar algebra + explicar conceptos  
→ Ejemplo: Ejercicio 5

#### Tipo E: "Implementar versión 3D"
→ Adaptar código 2D a 3D  
→ Ejemplo: Ejercicio 6

#### Tipo F: "Aplicación práctica"
→ Modelar problema real + resolver  
→ Ejemplo: Ejercicio 7 (Wilson)

---

### PASO 2: Pasar el sistema a forma estándar F(X) = 0

**Dado:**
```
x² + y² = 2
xy = 1
```

**Forma estándar:**
```
f1(x,y) = x² + y² - 2 = 0
f2(x,y) = xy - 1 = 0
```

**💡 TRUCO:** Si el sistema viene como "x = ...", restá para llevar todo a un lado.

---

### PASO 3: Calcular la Jacobiana (DERIVADAS PARCIALES)

#### Reglas básicas:
```
∂(x^n)/∂x = n*x^(n-1)
∂(xy)/∂x = y
∂(e^x)/∂x = e^x
∂(ln(x))/∂x = 1/x
∂(sin(x))/∂x = cos(x)
∂(cos(x))/∂x = -sin(x)
```

#### Ejemplo:
```
f1(x,y) = x² + y² - 2
f2(x,y) = xy - 1

Jacobiana:
J(x,y) = | 2x   2y |
         |  y    x |
```

**💡 TRUCO:** Si una función NO depende de una variable, su derivada parcial es 0.

Ejemplo: f(x,y) = x² + 3  →  ∂f/∂y = 0

---

### PASO 4: Crear las funciones F.m y JF.m

#### Plantilla F.m (2D):
```matlab
function Y = F_nombre(X)
% X(1) = x, X(2) = y
Y(1) = f1(X(1), X(2));
Y(2) = f2(X(1), X(2));
Y = Y';
end
```

#### Plantilla JF.m (2D):
```matlab
function J = JF_nombre(X)
J(1,1) = df1/dx evaluado en X;
J(1,2) = df1/dy evaluado en X;
J(2,1) = df2/dx evaluado en X;
J(2,2) = df2/dy evaluado en X;
end
```

#### Plantilla F.m (3D):
```matlab
function Y = F_nombre(X)
% X(1) = x, X(2) = y, X(3) = z
Y(1) = f1(X(1), X(2), X(3));
Y(2) = f2(X(1), X(2), X(3));
Y(3) = f3(X(1), X(2), X(3));
Y = Y';
end
```

**⚠️ NO OLVIDES EL `Y = Y'` AL FINAL!**

---

### PASO 5: Elegir punto inicial P0

#### ¿Cómo elegir P0?

**Opción 1: Del gráfico**
- Graficá las curvas y estimá visualmente dónde se cruzan
- Usá esos valores como P0

**Opción 2: Análisis del sistema**
- Si hay una ecuación lineal, despejá una variable
- Sustituí en la otra para estimar valores

**Opción 3: Valores "razonables"**
- Para sistemas físicos: valores positivos y pequeños (0.1, 0.5, 1, 2)
- Para sistemas matemáticos: probar (0,0), (1,1), (0.5, 0.5)

**💡 TRUCO:** Si el método diverge, **probá con otro punto inicial más cerca de la solución**.

#### ⚠️ CASOS ESPECIALES:

**Si hay logaritmos: ln(Λ)**
- Λ debe ser > 0
- NO uses P0 = [0; 0] → da ln(0) = -∞
- Probá P0 = [0.2; 0.2] o [0.5; 0.5]

**Si hay divisiones: 1/x**
- x no puede ser 0
- Evitá P0 cerca de cero

**Si la Jacobiana es singular en un punto:**
- NO uses ese punto como P0
- Ejemplo: Si α = β hace det(J) = 0, elegí α ≠ β

---

### PASO 6: Ejecutar Newton-Raphson

#### Para usar NewtonRaphsonSENL.m:
```matlab
tol = 1e-9;
itmax = 50;
P0 = [valor_x; valor_y];

[Pk, iter, err] = NewtonRaphsonSENL('F_nombre', 'JF_nombre', P0, tol, itmax);
```

#### Para usar NewtonRaphsonSENL3D.m:
```matlab
P0 = [valor_x; valor_y; valor_z];

[Pk, iter, err] = NewtonRaphsonSENL3D('F_nombre', 'JF_nombre', P0, tol, itmax);
```

---

### PASO 7: Verificar la solución

#### Siempre verificá:
```matlab
% 1. Evaluar F en la solución
F_test = F_nombre(Pk);
fprintf('F(Pk) = [%.3e; %.3e]\n', F_test(1), F_test(2));
fprintf('||F(Pk)||_2 = %.3e\n', norm(F_test));

% 2. El error debe ser muy pequeño (< 1e-6)
% Si ||F(Pk)|| > 1e-3 → La solución NO es correcta

% 3. Verificar manualmente en las ecuaciones originales
% Sustituir Pk en f1 y f2, deben dar ≈ 0
```

**✅ Solución CORRECTA:** ||F(Pk)|| < 1e-6  
**❌ Solución INCORRECTA:** ||F(Pk)|| > 1e-3 → Cambiar P0 o revisar funciones

---

## 🎨 CÓMO GRAFICAR CURVAS DE NIVEL

### Para 2D:
```matlab
% Crear malla
[X, Y] = meshgrid(-2:0.05:2, -2:0.05:2);

% Evaluar funciones
F1 = X.^2 + Y.^2 - 2;  % Ejemplo
F2 = X.*Y - 1;

% Graficar donde f1 = 0 y f2 = 0
figure(1)
contour(X, Y, F1, [0 0], 'b', 'LineWidth', 2)
hold on
contour(X, Y, F2, [0 0], 'r', 'LineWidth', 2)
grid on
xlabel('x')
ylabel('y')
legend('f_1(x,y) = 0', 'f_2(x,y) = 0')
hold off
```

**💡 TRUCO:** Las intersecciones de las curvas son las raíces del sistema.

---

## 🧮 ITERACIONES MANUALES (con código)

### Estructura del script:
```matlab
%% Iteración 0 → 1
P0 = [x0; y0];

% Evaluar F y J
F0 = F_nombre(P0);
J0 = JF_nombre(P0);

% Resolver sistema lineal
dP0 = Gauss(J0, -F0);

% Actualizar
P1 = P0 + dP0;

%% Iteración 1 → 2
F1 = F_nombre(P1);
J1 = JF_nombre(P1);
dP1 = Gauss(J1, -F1);
P2 = P1 + dP1;

%% Resultado
fprintf('Después de 2 iteraciones: (%.6f, %.6f)\n', P2(1), P2(2));
```

**💡 TRUCO:** Mostrá cada paso con `fprintf` para que se vea el proceso.

---

## 🔥 TRUCOS Y TIPS IMPORTANTES

### 1. **Cuando hay LOGARITMOS (como en Wilson)**

**Problema:** ln(Λ) requiere Λ > 0  
**Solución:** Hacer sustitución de variables

```
Original: ln(γ1) = 1 - ln(Λ1) - Λ2

Sustitución: α = ln(Λ1), β = ln(Λ2)
            Λ1 = e^α, Λ2 = e^β

Transformado: ln(γ1) = 1 - α - e^β
```

**Ventajas:**
- α, β pueden ser cualquier número real
- Λ = e^α siempre es > 0
- Más estable numéricamente

---

### 2. **Jacobiana singular (det(J) = 0)**

Si det(J) = 0, el sistema J·ΔP = -F no tiene solución única.

**¿Cómo evitarlo?**
- NO usar puntos donde α = β si eso hace det(J) = 0
- Cambiar el punto inicial
- Perturbar ligeramente: en vez de (0,0) usar (0.01, 0.02)

---

### 3. **Convergencia vs Divergencia**

**Señales de CONVERGENCIA:**
- ||F(Pk)|| disminuye en cada iteración
- Los valores de Pk se estabilizan
- Alcanza la tolerancia en pocas iteraciones (< 15)

**Señales de DIVERGENCIA:**
- ||F(Pk)|| aumenta
- Valores de Pk → Inf o NaN
- Oscilaciones sin estabilizarse
- Llega a itmax sin converger

**Solución:** Cambiar P0 más cerca de la raíz

---

### 4. **Diferencias entre 2D y 3D**

Lo **único** que cambia:
- Tamaño de vectores: 2×1 → 3×1
- Tamaño de Jacobiana: 2×2 → 3×3
- Número de ecuaciones: 2 → 3

El **algoritmo es IDÉNTICO**.

---

### 5. **Newton-Raphson vs Punto Fijo**

| Aspecto | Newton-Raphson | Punto Fijo |
|---------|---------------|------------|
| Forma | F(X) = 0 | X = G(X) |
| Requiere | Jacobiana | Generatrices |
| Convergencia | Cuadrática (muy rápida) | Lineal (lenta) |
| Iteraciones | Pocas (5-10) | Muchas (20-50) |
| Complejidad | Calcular derivadas | Despejar variables |
| Robusto | Sí (con buen P0) | Depende de G |

**💡 CUANDO USAR CADA UNO:**
- **Newton-Raphson:** Cuando podés calcular fácilmente las derivadas
- **Punto Fijo:** Cuando el sistema ya viene en forma X = G(X)

---

## 📝 CHECKLIST PARA EL EXAMEN

Antes de entregar, verificá:

### ✅ Código:
- [ ] Funciones F.m y JF.m creadas correctamente
- [ ] Y = Y' al final de F.m
- [ ] Jacobiana calculada bien (derivadas correctas)
- [ ] Punto inicial P0 razonable
- [ ] Script ejecuta sin errores
- [ ] Comentarios (%%) explicando cada paso

### ✅ Resultados:
- [ ] ||F(Pk)|| < 1e-6
- [ ] Solución verificada manualmente
- [ ] Gráfico generado (si corresponde)
- [ ] Iteraciones < 20 (convergencia razonable)
- [ ] Solución tiene sentido físico/matemático

### ✅ Teoría:
- [ ] Explicar qué es Newton-Raphson
- [ ] Mostrar la Jacobiana
- [ ] Justificar elección de P0
- [ ] Interpretar resultados

---

## 🎓 ERRORES COMUNES Y CÓMO EVITARLOS

### ❌ ERROR 1: Olvidar `Y = Y'` en F.m
**Consecuencia:** Dimensiones incorrectas, error en NewtonRaphsonSENL  
**Solución:** SIEMPRE poner `Y = Y'` al final

### ❌ ERROR 2: Derivadas parciales mal calculadas
**Consecuencia:** Método diverge o converge a punto equivocado  
**Solución:** Revisar cada derivada, usar reglas básicas

### ❌ ERROR 3: Jacobiana con signos cambiados
**Consecuencia:** Convergencia lenta o divergencia  
**Solución:** Verificar el signo de cada término

### ❌ ERROR 4: P0 muy lejos de la solución
**Consecuencia:** Divergencia  
**Solución:** Graficar primero, estimar visualmente

### ❌ ERROR 5: No verificar la solución
**Consecuencia:** Entregar resultado incorrecto  
**Solución:** Calcular ||F(Pk)|| y verificar < 1e-6

### ❌ ERROR 6: Usar logaritmos sin validar dominio
**Consecuencia:** ln(negativo) = NaN  
**Solución:** Hacer sustituciones o verificar P0 > 0

### ❌ ERROR 7: Confundir F(X) con G(X)
**Consecuencia:** Mezclar Newton-Raphson con Punto Fijo  
**Solución:** Newton-Raphson usa F(X) = 0, NO X = G(X)

---

## 🧪 PLANTILLA DE SCRIPT PARA EL EXAMEN

```matlab
% Actividad 8 - Ejercicio X
% Newton-Raphson para SENL
%
% Sistema: f1(x,y) = ... = 0
%          f2(x,y) = ... = 0
%
% TEORIA: [Explicar brevemente el método]
%
% Agustin Formenti

clc, clear, close all

fprintf('========================================\n')
fprintf('EJERCICIO X - ACTIVIDAD 8\n')
fprintf('========================================\n\n')

%% PARTE 1: Plantear el sistema
fprintf('Sistema:\n')
fprintf('  f1(x,y) = ... = 0\n')
fprintf('  f2(x,y) = ... = 0\n\n')

%% PARTE 2: Calcular Jacobiana (explicar)
fprintf('Jacobiana:\n')
fprintf('  J(x,y) = | df1/dx  df1/dy |\n')
fprintf('           | df2/dx  df2/dy |\n\n')

%% PARTE 3: Resolver con Newton-Raphson
tol = 1e-9;
itmax = 50;
P0 = [estimacion_x; estimacion_y];

fprintf('Punto inicial: (%.2f, %.2f)\n\n', P0(1), P0(2))

[Pk, iter, err] = NewtonRaphsonSENL('F_nombre', 'JF_nombre', P0, tol, itmax);

%% PARTE 4: Verificar solución
F_test = F_nombre(Pk);
fprintf('Verificación:\n')
fprintf('  ||F(Pk)|| = %.3e\n\n', norm(F_test));

%% PARTE 5: Interpretar resultados
fprintf('Solución: (%.6f, %.6f)\n', Pk(1), Pk(2));
fprintf('Iteraciones: %d\n', iter);
```

---

## 🎯 ESTRATEGIA GENERAL PARA EL EXAMEN

### Si tenés 40 minutos:

**Minutos 1-5:** Leer el problema, identificar tipo de ejercicio  
**Minutos 6-15:** Crear F.m y JF.m, verificar derivadas  
**Minutos 16-25:** Escribir script principal, elegir P0  
**Minutos 26-35:** Ejecutar, verificar, ajustar si falla  
**Minutos 36-40:** Agregar comentarios, verificar checklist

### Orden de prioridad:
1. **Funciones correctas** (F.m, JF.m) → 40% de la nota
2. **Script que ejecuta** y da resultado → 40% de la nota
3. **Verificación y teoría** → 20% de la nota

**💡 TIP:** Si te trabás en un item, **pasá al siguiente**. Es mejor tener 3 items parciales que 1 completo.

---

## 📚 CONCEPTOS CLAVE PARA EXPLICAR

### 1. ¿Qué es Newton-Raphson?
"Método iterativo que usa la linealización del sistema mediante la Jacobiana para encontrar raíces de sistemas no lineales con convergencia cuadrática."

### 2. ¿Qué es la Jacobiana?
"Matriz de derivadas parciales que representa cómo cambia cada función respecto a cada variable. Es la generalización de la derivada a múltiples dimensiones."

### 3. ¿Por qué no calcular J⁻¹?
"Calcular la inversa es costoso computacionalmente y numéricamente inestable. Es mejor resolver el sistema lineal J·ΔP = -F con Gauss."

### 4. ¿Qué significa convergencia cuadrática?
"El error se reduce al cuadrado en cada iteración: si e_k es el error en iteración k, entonces e_{k+1} ≈ C·e_k². Por eso converge muy rápido."

---

## 🔍 CASOS ESPECIALES

### Caso 1: Sistema con funciones trigonométricas
```
Ejemplo: x = 0.7·sin(x) - 0.2·cos(y)

Derivadas:
∂/∂x[sin(x)] = cos(x)
∂/∂x[cos(y)] = 0  (no depende de x)
∂/∂y[cos(y)] = -sin(y)
```

### Caso 2: Sistema con exponenciales
```
Ejemplo: f(x,y) = e^x + e^y - 5

Derivadas:
∂/∂x[e^x] = e^x
∂/∂y[e^y] = e^y
```

### Caso 3: Sistema con productos
```
Ejemplo: f(x,y) = x·y - 1

Derivadas:
∂/∂x[x·y] = y
∂/∂y[x·y] = x
```

### Caso 4: Sistema con divisiones
```
Ejemplo: f(x,y) = x/y - 2

Derivadas:
∂/∂x[x/y] = 1/y
∂/∂y[x/y] = -x/y²

⚠️ Cuidado: y ≠ 0
```

---

## 💪 ÚLTIMOS CONSEJOS

1. **Practicá los ejercicios resueltos** hasta que te salgan de memoria
2. **Llevá este cheatsheet impreso** al examen (si está permitido)
3. **Verificá SIEMPRE** la solución con ||F(Pk)||
4. **Si diverge**, cambiá P0, NO te quedes trabado
5. **Agregá teoría** en los comentarios del código
6. **Usá fprintf** para mostrar todos los pasos
7. **NO te olvides** del Y = Y' en las funciones F
8. **Derivadas con cuidado**, son la clave del método

---

## 🚀 ¡ÉXITOS EN EL PARCIAL AGU!

Recordá:
- Newton-Raphson es **más fácil** que Punto Fijo (no hay que despejar)
- La convergencia es **muy rápida** (5-10 iteraciones)
- La clave está en **calcular bien la Jacobiana**
- Un **buen P0** es fundamental

**¡Vos podés! 💪🔥**

---

*Última actualización: Noviembre 2025*  
*Preparado para: Segundo Parcial - Métodos y Cómputos Numéricos*
