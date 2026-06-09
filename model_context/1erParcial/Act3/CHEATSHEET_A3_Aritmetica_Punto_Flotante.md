# CHEATSHEET - ACTIVIDAD 3: ARITMÉTICA DE PUNTO FLOTANTE

**Métodos y Cómputos Numéricos - UCA Rosario**  
**Alumno:** Agustin Formenti  
**Uso:** Preparación Primer Parcial

---

## 📌 CONCEPTOS CLAVE

### ¿Qué es Punto Flotante?
Es la forma en que la computadora representa números reales usando una cantidad **FINITA** de bits.

**Representación en base β (binaria β=2):**
```
x = ±q × 2ⁿ
```
- **q** = mantisa (fracción normalizada: 1/2 ≤ |q| < 1)
- **n** = exponente (entero)
- **±** = signo

**IMPORTANTE:** La computadora NO puede representar todos los números reales exactamente → hay errores de redondeo.

---

## 🖥️ IEEE 754 DOBLE PRECISIÓN (MATLAB/Octave)

### Estructura (64 bits = 8 bytes)
```
| Signo (s) | Exponente (e) | Mantisa (q) |
|  1 bit    |   11 bits     |   52 bits   |
```

**Fórmula:**
```
x = (-1)ˢ × (1.q)₂ × 2^(e-1023)
```

### Valores Importantes
```matlab
eps      = 2^(-52) ≈ 2.22e-16      % epsilon máquina
realmin  = 2^(-1022) ≈ 2.23e-308   % número positivo más chico
realmax  = (2-eps)*2^(1023) ≈ 1.80e+308  % número positivo más grande
```

**¿Qué es eps (epsilon máquina)?**  
Es la distancia desde el 1 al siguiente número representable más grande.  
En otras palabras: es el número más chico tal que `1 + eps > 1`.

---

## 🎯 MÁQUINA VIRTUAL DE 4 BITS (EJERCICIO 4 DE A3)

### Parámetros de la Máquina Virtual
- **Mantisa:** 4 bits binarios → `0.d₁d₂d₃d₄` donde d₁ = 1, dᵢ ∈ {0,1}
- **Exponentes:** n ∈ {-3, -2, -1, 0, 1, 2, 3, 4} (8 posibles)
- **Redondeo:** Simétrico (ver regla abajo)

### Tabla de Números Representables (MEMORIZAR ESTRUCTURA)
```
Mantisa      | n=-3  | n=-2  | n=-1 | n=0  | n=1  | n=2  | n=3  | n=4
-------------|-------|-------|------|------|------|------|------|------
0.1000₍₂₎    | 0.0625| 0.125 | 0.25 | 0.5  | 1    | 2    | 4    | 8
0.1001₍₂₎    | 0.0703| 0.1406| 0.281| 0.562| 1.125| 2.25 | 4.5  | 9
0.1010₍₂₎    | 0.0781| 0.1562| 0.312| 0.625| 1.25 | 2.5  | 5    | 10
0.1011₍₂₎    | 0.0859| 0.1719| 0.344| 0.687| 1.375| 2.75 | 5.5  | 11
0.1100₍₂₎    | 0.0937| 0.1875| 0.375| 0.75 | 1.5  | 3    | 6    | 12
0.1101₍₂₎    | 0.1016| 0.2031| 0.406| 0.812| 1.625| 3.25 | 6.5  | 13
0.1110₍₂₎    | 0.1094| 0.2188| 0.437| 0.875| 1.75 | 3.5  | 7    | 14
0.1111₍₂₎    | 0.1172| 0.2344| 0.469| 0.937| 1.875| 3.75 | 7.5  | 15
```

**Nota:** Estos son los ÚNICOS números que esta máquina puede representar exactamente.

### Calcular eps de la Máquina Virtual
El eps es el valor más chico tal que `1 + eps > 1`.

**En la tabla:** El número después de 1 es 1.125
```
eps = 1.125 - 1 = 0.125 = 1/8 = 2^(-3)
```

**En general:** Para mantisa de t bits → `eps = 2^(-t)`  
Con t=4 → `eps = 2^(-4) = 0.0625`

PERO mirando la tabla, el salto desde 1 (columna n=1, mantisa 0.1000) al siguiente es:
```
1.125 - 1 = 0.125
```

Por lo tanto, **eps = 0.125** para esta máquina.

---

## 🔄 REGLA DE REDONDEO SIMÉTRICO

**Concepto:** Si quiero representar un número x que NO está en la tabla, debo redondearlo al número más cercano.

**Regla:**  
Dados x₁ y x₂ (números consecutivos en la tabla más cercanos a x):
```
Si x < (x₁ + x₂)/2  →  redondeo a x₁
Si x ≥ (x₁ + x₂)/2  →  redondeo a x₂
```

**Ejemplo del ejercicio:**
```
(5 + 3*eps) - 4*eps
= (5 + 3*0.125) - 4*0.125
= (5 + 0.375) - 0.5
= 5.375 - 0.5
```

Ahora, 5.375 NO está en la tabla. Los números más cercanos son:
- x₁ = 5 (mantisa 0.1010, n=3)
- x₂ = 5.5 (mantisa 0.1011, n=3)

Punto medio: (5 + 5.5)/2 = 5.25

Como 5.375 > 5.25 → **redondeo a 5.5**

Entonces:
```
5.375 →(redondeo)→ 5.5
5.5 - 0.5 = 5
```

**Resultado final: 5**

---

## 📊 ESTRATEGIA PARA EJERCICIOS CON MÁQUINA VIRTUAL

### Paso 1: Identificar los parámetros
- Mantisa: ¿cuántos bits? → determina valores de q
- Exponentes: ¿qué rango? → determina valores de n
- Redondeo: simétrico (punto medio decide)

### Paso 2: Calcular epsilon
```
eps = distancia entre 1 y el siguiente número representable
```

### Paso 3: Evaluar la expresión paso a paso
1. Calcular valores intermedios en DECIMAL
2. Para cada resultado intermedio:
   - ¿Está en la tabla? → OK
   - ¿NO está? → redondear al más cercano
3. Seguir con la siguiente operación

### Paso 4: Justificar redondeos
Siempre mostrar:
```
x = valor exacto
x₁ = número menor en tabla
x₂ = número mayor en tabla
punto_medio = (x₁ + x₂)/2
```

Comparar y decidir.

---

## 🐛 ERRORES COMUNES DE PUNTO FLOTANTE

### Error 1: Números decimales no exactos
**EJEMPLO 1 (Ejercicio 1):**
```matlab
a = 4/3           % = 1.333333... (periódico en binario)
b = a - 1         % = 0.333333...
c = 3*b           % debería ser 1, pero...
e = 1 - c         % e = 2.22e-16 ≠ 0
```

**Por qué:** 4/3 no se puede representar exactamente en binario → error de redondeo acumulado.

### Error 2: Suma de fracciones periódicas
**EJEMPLO 2 (Ejercicio 2):**
```matlab
a = 0;
for i = 1:10
    a = a + 0.1;  % 0.1 es periódico en binario
end
a == 1            % ans = 0 (FALSE)
```

**Por qué:** 0.1 en decimal = 0.00011001100110011... en binario (periódico).  
Cada suma acumula un pequeño error → después de 10 sumas: a ≠ 1 exactamente.

### Error 3: Orden de las operaciones importa
**EJEMPLO 3 (Ejercicio 3):**
```matlab
b = 1e-16 + 1 - 1e-16     % = 1 (se pierde 1e-16)
c = 1e-16 - 1e-16 + 1     % = 1
b == c                     % ans = 0 (FALSE)
```

**Por qué:**
- Primera expresión: `1e-16 + 1` → al sumar un número muy chico a 1, se redondea a 1 (se pierde 1e-16). Luego 1 - 1e-16 da algo distinto de 1.
- Segunda expresión: `1e-16 - 1e-16 = 0` primero, luego `0 + 1 = 1`.

**Lección:** El orden de las operaciones afecta el resultado por errores de redondeo.

### Error 4: Comparación directa con ==
**NUNCA hacer:**
```matlab
if (x == y)  % MAL para números flotantes
```

**MEJOR hacer:**
```matlab
tol = 1e-10;
if abs(x - y) < tol  % BIEN
```

---

## 🧮 CÁLCULOS CON LA MÁQUINA VIRTUAL

### Ejemplo Completo (Ejercicio 4e)

**Evaluar:** `(8 + 3*eps) + 3*eps` con eps = 0.125

**Paso 1:** Calcular `3*eps`
```
3 * 0.125 = 0.375
```
0.375 está en la tabla (mantisa 0.1100, n=-1) ✓

**Paso 2:** Calcular `8 + 3*eps`
```
8 + 0.375 = 8.375
```
8.375 NO está en la tabla. Números cercanos:
- x₁ = 8 (mantisa 0.1000, n=4)
- x₂ = 9 (mantisa 0.1001, n=4)

Punto medio: (8 + 9)/2 = 8.5

Como 8.375 < 8.5 → **redondeo a 8**

**Paso 3:** Calcular `8 + 3*eps`
```
8 + 0.375 = 8.375 →(redondeo)→ 8
```

**Paso 4:** Calcular `resultado + 3*eps`
```
8 + 0.375 = 8.375 →(redondeo)→ 8
```

**Resultado final: 8**

---

## 📝 EJERCICIOS TÍPICOS DE EXAMEN

### Tipo 1: Reproducir ejemplos de la lectura
```matlab
>> format long
>> a = 4/3
>> b = a - 1
>> c = 3*b
>> e = 1 - c
```
**Qué observar:** e no es exactamente 0 → explicar por qué.

### Tipo 2: Evaluar expresiones en máquina virtual
**Dado:** Máquina de 4 bits, 8 exponentes, redondeo simétrico.  
**Evaluar:** `1.1`, `eps`, `20`, `8 + 5*eps`, etc.

**Estrategia:**
1. Buscar en la tabla si el número está representable
2. Si no → buscar los dos más cercanos y aplicar redondeo simétrico
3. Mostrar claramente el proceso de redondeo

### Tipo 3: Anticipar resultados en MATLAB
**Ejemplo:** `1 + eps/3 + eps/3 + eps/3`

**Razonamiento:**
- `eps/3 < eps/2` → en redondeo simétrico, `1 + eps/3` redondea a 1
- Entonces: `1 + eps/3 = 1`
- Segunda suma: `1 + eps/3 = 1`
- Tercera suma: `1 + eps/3 = 1`
- **Resultado: 1**

Pero si agrupo:
```matlab
1 + (eps/3 + eps/3 + eps/3) = 1 + eps = 1 + eps (este sí se ve)
```

**Lección:** Orden importa, agrupamiento importa.

### Tipo 4: Calcular eps, realmin, realmax de una máquina
**Datos:** Mantisa de 4 cifras decimales, exponentes de -3 a 4.

**eps:**
```
El salto entre 1 y el siguiente número representable
eps = 1 × 10^(-4) = 0.0001 (para 4 cifras decimales)
```

**realmax:**
```
Mantisa máxima = 0.9999
Exponente máximo = 4
realmax = 0.9999 × 10^4 = 9999
```

**realmin:**
```
Mantisa mínima normalizada = 0.1000
Exponente mínimo = -3
realmin = 0.1000 × 10^(-3) = 0.0001
```

---

## 💡 TIPS PARA EL EXAMEN

### ✅ LO QUE SÍ DEBES HACER
1. **Usar `format long`** si te piden ver más decimales
2. **Explicar redondeos:** siempre justificar con punto medio
3. **Mostrar paso a paso:** no saltear cálculos intermedios
4. **Verificar si está en la tabla:** antes de redondear
5. **Orden de operaciones:** prestar atención al orden

### ❌ LO QUE NO DEBES HACER
1. **Asumir que 0.1 es exacto** → es periódico en binario
2. **Comparar flotantes con ==** → usar tolerancia
3. **Pensar que suma es conmutativa exactamente** → el orden importa
4. **Olvidar que eps depende de la máquina** → siempre calcular primero

### 🎯 CHECKLIST ANTES DE RESPONDER
- [ ] ¿Identifiqué los parámetros de la máquina? (mantisa, exponentes)
- [ ] ¿Calculé eps correctamente?
- [ ] ¿Busqué cada número en la tabla?
- [ ] ¿Apliqué redondeo simétrico correctamente?
- [ ] ¿Mostré todos los pasos intermedios?
- [ ] ¿Expliqué por qué hay error (si lo hay)?

---

## 🔑 FÓRMULAS CLAVE (MEMORIZAR)

### IEEE 754 Doble Precisión
```
x = (-1)ˢ × (1.q)₂ × 2^(e-1023)

eps = 2^(-52) ≈ 2.22e-16
realmin = 2^(-1022) ≈ 2.23e-308
realmax = (2-eps)*2^(1023) ≈ 1.80e+308
```

### Máquina Virtual de t bits
```
x = ±q × 2ⁿ
q = 0.d₁d₂...dₜ donde d₁ = 1, dᵢ ∈ {0,1}
eps = distancia entre 1 y siguiente número
```

### Redondeo Simétrico
```
Si x < (x₁ + x₂)/2  →  x ≈ x₁
Si x ≥ (x₁ + x₂)/2  →  x ≈ x₂
```

---

## 📚 RESUMEN DE EJERCICIOS DE A3

### Ejercicio 1: Reproducir EJEMPLO 1 (4/3)
- Objetivo: ver que 4/3 no es exacto
- Resultado esperado: `e = 2.22e-16 ≠ 0`

### Ejercicio 2: Reproducir EJEMPLO 2 (0.1)
- Objetivo: ver que 0.1 es periódico en binario
- Resultado esperado: `a == 1` da FALSE

### Ejercicio 3: Reproducir EJEMPLO 3 (orden)
- Objetivo: el orden importa
- Resultado esperado: `b == c` da FALSE

### Ejercicio 4: Máquina virtual de 4 bits
- Calcular: 1.1, eps, 20, 8+5*eps, (8+3*eps)+3*eps
- Usar tabla y redondeo simétrico
- **Clave:** eps = 0.125 para esta máquina

### Ejercicio 5: Anticipar resultados en MATLAB
- Usar lógica de redondeo simétrico de MATLAB
- Recordar: `1 + eps/2` redondea a 1
- Recordar: `1 + eps` NO redondea (es mayor que 1)

### Ejercicio 6: Calcular eps, realmax, realmin
- Para máquina de 4 cifras decimales
- Aplicar fórmulas de punto flotante

### Ejercicio 7: floatgui.m (exploración visual)
- Entender distribución de números
- Ver que hay más números cerca de 0 que lejos
- Observar efecto de cambiar parámetros

---

## 🎓 CONCEPTOS TEÓRICOS IMPORTANTES

### ¿Por qué hay errores de punto flotante?
1. **Cantidad finita de bits:** no se pueden representar infinitos números
2. **Redondeo:** números intermedios se aproximan
3. **Acumulación:** errores pequeños se suman en operaciones sucesivas

### ¿Cuándo preocuparse por punto flotante?
- Sumas/restas de números muy diferentes en magnitud
- Comparaciones de igualdad exacta
- Operaciones repetidas (loops) que acumulan error
- Cálculo de diferencias pequeñas entre números grandes

### ¿Cómo minimizar errores?
1. Reordenar operaciones (sumar primero números pequeños)
2. Evitar cancelación (restar números casi iguales)
3. Usar algoritmos numéricamente estables
4. Comparar con tolerancia, no con ==

---

## 🚀 ÚLTIMO CONSEJO

**En el examen:**
1. Lee TODA la consigna
2. Identifica qué máquina estás usando (bits, exponentes)
3. Calcula eps PRIMERO
4. Trabaja paso a paso, sin saltear
5. Justifica TODOS los redondeos
6. Reflexiona sobre por qué hay error

**¡Éxitos, Agu! Vos podés 💪**

---

**Fin del Cheatsheet - Actividad 3**
