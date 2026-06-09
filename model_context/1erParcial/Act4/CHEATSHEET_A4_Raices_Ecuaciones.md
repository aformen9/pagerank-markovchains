# CHEATSHEET - ACTIVIDAD 4: RAÍCES DE ECUACIONES NO LINEALES

**Métodos y Cómputos Numéricos - UCA Rosario**  
**Alumno:** Agustin Formenti  
**Uso:** Preparación Primer Parcial

---

## 📌 CONCEPTOS CLAVE

### ¿Qué es una raíz?
Una **raíz** de f(x) es un valor r tal que **f(r) = 0**.

**Objetivo:** Hallar x tal que f(x) = 0 usando métodos numéricos.

### Dos métodos principales:
1. **Bisección** - Método cerrado (necesita intervalo [a,b])
2. **Newton-Raphson** - Método abierto (necesita punto inicial x₀)

---

## 🔪 MÉTODO DE BISECCIÓN

### Idea básica
"Cortar el intervalo por la mitad" repetidas veces hasta encontrar la raíz.

### Requisitos OBLIGATORIOS
1. f debe ser **continua** en [a,b]
2. **f(a) · f(b) < 0** (signos opuestos en los extremos)
3. Esto garantiza que hay AL MENOS UNA raíz en [a,b]

### Algoritmo paso a paso
```
1. Verificar: f(a) · f(b) < 0
2. Calcular punto medio: c = (a + b) / 2
3. Evaluar f(c)
4. Decidir nuevo intervalo:
   - Si f(a) · f(c) > 0  →  actualizar a = c  (raíz en [c,b])
   - Si f(a) · f(c) < 0  →  actualizar b = c  (raíz en [a,c])
   - Si f(c) = 0         →  c es la raíz exacta
5. Repetir hasta alcanzar tolerancia o itmax
```

### Convergencia
- **Orden:** LINEAL (lenta pero segura)
- **Error en cada paso:** se reduce a la mitad
- **Error estimado:** (b - a) / 2

### Cuándo usar Bisección
✅ Cuando tenés un intervalo [a,b] con cambio de signo  
✅ Cuando querés garantía de convergencia  
✅ Cuando f es complicada y no podés calcular f'(x)  
❌ Es LENTO comparado con Newton-Raphson

### Código tipo
```matlab
% Defino función
f = @(x) x.^2 - 2;

% Intervalo con cambio de signo
a = 1;
b = 2;
tol = 1e-6;
itmax = 100;

% Llamo a bisecciones
r = bisecciones(f, a, b, tol, itmax);
```

---

## 🚀 MÉTODO DE NEWTON-RAPHSON (N-R)

### Idea básica
Usar la **tangente** a la curva para aproximar la raíz iterativamente.

### Fórmula iterativa
```
x_{n+1} = x_n - f(x_n) / f'(x_n)
```

Donde:
- x_n = aproximación actual
- f(x_n) = valor de f en x_n
- f'(x_n) = derivada de f en x_n

### Interpretación geométrica
La recta tangente en (x_n, f(x_n)) corta el eje x en x_{n+1}.

### Requisitos
1. f debe ser **derivable**
2. f'(r) ≠ 0 (raíz simple)
3. x₀ debe estar **"cerca"** de la raíz

### Convergencia
- **Orden:** CUADRÁTICA (muy rápida)
- **Local, NO global:** depende de x₀
- Si x₀ está cerca de r → converge rapidísimo
- Si x₀ está lejos → puede diverger

### Cuándo usar Newton-Raphson
✅ Cuando podés calcular f'(x) fácilmente  
✅ Cuando tenés una buena aproximación inicial x₀  
✅ Cuando querés convergencia rápida  
❌ NO garantiza convergencia si x₀ está mal elegido

### Código tipo
```matlab
% Defino función y derivada
f  = @(x) x.^2 - 2;
fp = @(x) 2*x;

% Aproximación inicial
x0 = 1.5;
tol = 1e-12;
itmax = 100;

% Llamo a Newton-Raphson
r = NewtonRaphson(f, fp, x0, tol, itmax);
```

### Newton-Raphson con derivada numérica
Si NO podés calcular f'(x) analíticamente:

```matlab
% Solo defino f (sin derivada)
s = @(x) sign(x-2).*sqrt(abs(x-2));

x0 = 2.5;
tol = 1e-12;
itmax = 50;

% Llamo a NewtonRapshonDeriv (calcula f' numéricamente)
r = NewtonRapshonDeriv(s, x0, tol, itmax);
```

La función `df1dx` calcula la derivada con **diferencias centradas**:
```
f'(x) ≈ [f(x+h) - f(x-h)] / (2h)
```

---

## 🔄 COMPARACIÓN: BISECCIÓN vs NEWTON-RAPHSON

| Aspecto | Bisección | Newton-Raphson |
|---------|-----------|----------------|
| **Convergencia** | Lineal (lenta) | Cuadrática (rápida) |
| **Garantía** | SIEMPRE converge | NO garantizada |
| **Requisitos** | Intervalo [a,b] con f(a)·f(b)<0 | x₀ cerca de la raíz |
| **Derivada** | NO necesita f'(x) | SÍ necesita f'(x) |
| **Velocidad** | ~40 iteraciones para 1e-12 | ~5 iteraciones para 1e-12 |
| **Uso típico** | Raíz inicial o f complicada | Refinamiento rápido |

**ESTRATEGIA COMÚN:**
1. Usar bisección para obtener x₀ aproximado
2. Usar Newton-Raphson con ese x₀ para refinar rápidamente

---

## 🎯 RAÍCES MÚLTIPLES (Ejercicio 7)

### ¿Qué es una raíz múltiple?
Una raíz r tiene **multiplicidad α** si:
```
f(x) = (x - r)^α · g(x)
```
donde g(r) ≠ 0.

**Ejemplo:** f(x) = (x-1)² tiene raíz doble (α=2) en r=1

### Problema con Newton-Raphson estándar
Para raíces múltiples (α > 1):
- **Convergencia LINEAL** (en vez de cuadrática)
- **Factor:** |e_{n+1}| / |e_n| → (α-1)/α

**Ejemplo:** Para α=2 (raíz doble):
```
|e_{n+1}| / |e_n| → 0.5
```
Esto es MUCHO más lento que convergencia cuadrática.

### Solución: Newton-Raphson MODIFICADO
Cambiar la fórmula iterativa:
```
x_{n+1} = x_n - α · f(x_n) / f'(x_n)
```

Donde α = multiplicidad de la raíz.

Con esto se **RECUPERA** la convergencia cuadrática.

### Código tipo (Ej 7)

**7a) Newton estándar para raíz doble (muestra convergencia lineal):**
```matlab
f  = @(x) x.^3 - 3*x + 2;  % = (x-1)^2 · (x+2)
fp = @(x) 3*x.^2 - 3;

x0 = 1.2;
tol = 1e-5;
itmax = 50;

% Imprime |e_{n+1}|/|e_n| → 0.5
r = NewtonRaphsonMod(f, fp, x0, tol, itmax);
```

**7b) Newton modificado con α=2:**
```matlab
alpha = 2;  % multiplicidad de la raíz

% Usa fórmula modificada: x_{n+1} = x_n - 2·f/f'
r = NewtonMultiple(f, fp, x0, tol, itmax, alpha);
```

**7c) Verificar convergencia cuadrática:**
```matlab
alpha = 2;
poder_cociente = 2;

% Imprime |e_{n+1}|/|e_n|^2 → constante
r = NewtonRaphsonMod(f, fp, x0, tol, itmax, alpha, poder_cociente);
```

---

## 📊 ESTRATEGIA PARA RESOLVER EJERCICIOS

### PASO 1: Identificar el tipo de problema
- ¿Te dan un intervalo [a,b]? → Probablemente Bisección
- ¿Te dan un x₀? → Probablemente Newton-Raphson
- ¿Te piden "estudio gráfico"? → Plotear f(x) primero

### PASO 2: Estudio gráfico (si lo piden)
```matlab
f = @(x) exp(x) - 3*x;

x = linspace(0, 4, 400);  % 400 puntos entre 0 y 4

figure(1)
plot(x, f(x), 'b', 'linewidth', 2)
grid on
hold on
plot(x, 0*x, 'k--')  % línea y=0

xlabel('x')
ylabel('f(x)')
title('f(x) = e^x - 3x')
legend('f(x)', 'y=0', 'Location', 'best')
```

**Observar:**
- ¿Cuántas veces cruza el eje x? → número de raíces
- ¿Dónde están aproximadamente? → elegir x₀ para N-R

### PASO 3: Estudio numérico
Elegir el método apropiado y llamar a la función.

### PASO 4: Análisis de convergencia (si lo piden)
- **Convergencia LOCAL:** Solo garantizada cerca de la raíz
- **Convergencia GLOBAL:** En todo el dominio (solo Bisección)

**Para Newton-Raphson:**
- Verificar f(r) ≈ 0
- Verificar f'(r) ≠ 0
- Mencionar dependencia de x₀

---

## 🧮 EJERCICIOS TÍPICOS DE EXAMEN

### Tipo 1: Bisección básica
**Enunciado:** "Halle la raíz de h(x) = x·sin(x) - 1 en [0,2] usando bisecciones."

**Pasos:**
1. Definir h = @(x) x.*sin(x) - 1
2. Verificar cambio de signo: h(0)·h(2) < 0 ✓
3. Llamar: r = bisecciones(h, 0, 2, 1e-6, 100)
4. Verificar: h(r) ≈ 0

### Tipo 2: Newton-Raphson con múltiples raíces
**Enunciado:** "Determine las raíces de f(x) = e^x - 3x en [0,4]."

**Pasos:**
1. Graficar para ver cuántas raíces hay
2. Para cada raíz observada:
   - Elegir x₀ cercano
   - Definir f y f'
   - Llamar NewtonRaphson
3. Comparar resultados

### Tipo 3: Raíces múltiples
**Enunciado:** "f(x) = x³ - 3x + 2 tiene raíz doble en r=1. Compare convergencia."

**Pasos:**
1. N-R estándar: NewtonRaphsonMod → observar |e_{n+1}|/|e_n| → 0.5
2. N-R modificado con α=2: NewtonMultiple → más rápido
3. Conclusión: N-R modificado recupera convergencia cuadrática

### Tipo 4: Aplicaciones
**Enunciado:** "La concentración c(t) = 70e^(-1.5t) + 25e^(-0.075t). Halle t tal que c(t) = 9."

**Pasos:**
1. Plantear: f(t) = 70e^(-1.5t) + 25e^(-0.075t) - 9 = 0
2. Derivar: f'(t) = -105e^(-1.5t) - 1.875e^(-0.075t)
3. Elegir x₀ razonable (ej: t₀ = 1)
4. Llamar: t = NewtonRaphson(f, fp, 1, 1e-10, 100)
5. Interpretar resultado en contexto del problema

---

## 💡 TIPS PARA EL EXAMEN

### ✅ LO QUE SÍ DEBES HACER

1. **Siempre graficar primero** si piden estudio gráfico
2. **Verificar cambio de signo** antes de usar bisección
3. **Elegir x₀ CERCA de la raíz** para Newton-Raphson
4. **Verificar el resultado:** evaluar f(r) debe dar ≈ 0
5. **Mostrar todos los pasos:** clear, clc, comentarios, cierre

### ❌ LO QUE NO DEBES HACER

1. **Usar bisección sin verificar f(a)·f(b) < 0**
2. **Usar N-R con x₀ lejos de la raíz** (puede diverger)
3. **Olvidar definir f'(x)** para Newton-Raphson
4. **No verificar el resultado** (siempre hacer f(r))
5. **Implementar código interno** en vez de llamar a funciones

### 🎯 CHECKLIST ANTES DE ENTREGAR

- [ ] ¿Tengo `clear, clc` al inicio?
- [ ] ¿Tengo encabezado con descripción?
- [ ] ¿Llamé a las funciones externas? (NO código interno)
- [ ] ¿Definí f y f' correctamente?
- [ ] ¿Elegí parámetros razonables (x₀, tol, itmax)?
- [ ] ¿Verifiqué el resultado con f(r)?
- [ ] ¿Tengo cierre con mensaje de fin?
- [ ] ¿Tengo comentarios explicando QUÉ hago?

---

## 🔑 FUNCIONES DISPONIBLES (resumen)

### Bisección
```matlab
% Básica
r = bisecciones(f, a, b, tol, itmax)

% Con impresión de extremos (Ej 2b)
r = bisecciones(f, a, b, tol, itmax, true)

% Retorna también número de iteraciones (Ej 2c)
[r, k] = bisecciones(f, a, b, tol, itmax)

% Específica para sqrt(2)
r = rcuad2_bisec(tol, itmax)
```

### Newton-Raphson
```matlab
% Básico (necesita f y f')
r = NewtonRaphson(f, fp, x0, tol, itmax)

% Con derivada numérica (solo necesita f)
r = NewtonRapshonDeriv(f, x0, tol, itmax)

% Para raíces múltiples - imprime cocientes
r = NewtonRaphsonMod(f, fp, x0, tol, itmax)
r = NewtonRaphsonMod(f, fp, x0, tol, itmax, alpha)
r = NewtonRaphsonMod(f, fp, x0, tol, itmax, alpha, poder_cociente)

% Con multiplicidad α (sin imprimir cocientes)
r = NewtonMultiple(f, fp, x0, tol, itmax, alpha)
```

---

## 📝 EJEMPLO COMPLETO PASO A PASO

**Problema:** Hallar las raíces de f(x) = e^x - 3x en [0,4]

### Script completo (Ej3a.m)
```matlab
% Actividad 4 - Ejercicio 3a
% Estudio grafico de f(x) = e^x - 3x en [0,4]
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion
% La funcion es f(x) = e^x - 3x
f = @(x) exp(x) - 3*x;

%% Discretizo el intervalo [0,4]
% Creo 400 puntos uniformemente espaciados
x = linspace(0, 4, 400);

%% Grafico la funcion
% Ploteo f(x) en azul con grosor 2
figure(1)
plot(x, f(x), 'b', 'linewidth', 2)
grid on
hold on

% Agrego la linea y=0 para ver donde cruza (raices)
plot(x, 0*x, 'k--')

xlabel('x')
ylabel('f(x)')
title('f(x) = e^x - 3x en [0,4]')
legend('f(x)', 'y=0', 'Location', 'best')

disp(' ')
disp('Observacion: El grafico muestra DOS raices en [0,4].')

disp(' ')
disp('========== FIN EJERCICIO 3a ==========')
```

### Script numérico (Ej3b.m)
```matlab
% Actividad 4 - Ejercicio 3b
% Aproximar raices de f(x) = e^x - 3x con Newton-Raphson
% Alumno: Agustin Formenti

clear, clc

%% Defino la funcion y su derivada
f  = @(x) exp(x) - 3*x;
fp = @(x) exp(x) - 3;

%% Parametros del metodo
tol = 1e-12;
itmax = 100;

%% Aproximo la primera raiz (x0 = 1)
disp('===== PRIMERA RAIZ =====')
x0_1 = 1;
r1 = NewtonRaphson(f, fp, x0_1, tol, itmax);

disp(' ')

%% Aproximo la segunda raiz (x0 = 2)
disp('===== SEGUNDA RAIZ =====')
x0_2 = 2;
r2 = NewtonRaphson(f, fp, x0_2, tol, itmax);

%% Resumen
disp(' ')
disp('===== RESUMEN =====')
fprintf('Primera raiz:  r1 = %.15f\n', r1)
fprintf('Segunda raiz:  r2 = %.15f\n', r2)

disp(' ')
disp('========== FIN EJERCICIO 3b ==========')
```

---

## 🚨 ERRORES COMUNES Y CÓMO EVITARLOS

### Error 1: Bisección sin cambio de signo
```matlab
❌ MAL:
f = @(x) x.^2;  % siempre positiva
r = bisecciones(f, -1, 1, 1e-6, 100);  % ERROR!

✅ BIEN:
% Verificar primero
if f(a) * f(b) >= 0
    error('No hay cambio de signo en [a,b]')
end
```

### Error 2: Newton-Raphson con x₀ lejos
```matlab
❌ MAL:
f = @(x) exp(x) - 3*x;  % raíces en ~0.6 y ~1.5
x0 = 10;  % MUY lejos
r = NewtonRaphson(f, fp, x0, 1e-12, 100);  % puede diverger

✅ BIEN:
% Elegir x₀ cerca después de graficar
x0 = 1;  % cerca de la primera raíz
r = NewtonRaphson(f, fp, x0, 1e-12, 100);
```

### Error 3: Olvidar operador punto
```matlab
❌ MAL:
f = @(x) x^2 - 2;  % NO funciona con vectores

✅ BIEN:
f = @(x) x.^2 - 2;  % SÍ funciona con vectores
```

### Error 4: No verificar resultado
```matlab
❌ MAL:
r = NewtonRaphson(f, fp, x0, tol, itmax);
% No verifico nada

✅ BIEN:
r = NewtonRaphson(f, fp, x0, tol, itmax);
fprintf('Verificacion: f(r) = %.15e\n', f(r));  % debe ser ≈ 0
```

---

## 🎓 CONCEPTOS TEÓRICOS IMPORTANTES

### ¿Por qué Newton-Raphson puede fallar?
1. **x₀ lejos de la raíz:** puede divergir o ir a otra raíz
2. **f'(x₀) = 0:** división por cero
3. **f'(x) pequeña:** divisiones grandes, inestabilidad
4. **Raíces múltiples:** convergencia lineal (lenta)

### ¿Cuándo usar cada método?
**Bisección:**
- Necesito GARANTÍA de convergencia
- No sé dónde está la raíz, pero tengo un intervalo
- f es muy complicada para derivar

**Newton-Raphson:**
- Necesito convergencia RÁPIDA
- Tengo buena aproximación inicial
- Puedo calcular f'(x) fácilmente

### Orden de convergencia
**Lineal:** |e_{n+1}| ≈ C·|e_n|  
- Error se reduce proporcionalmente
- Bisección, N-R con raíces múltiples

**Cuadrática:** |e_{n+1}| ≈ C·|e_n|²  
- Error se reduce al cuadrado
- N-R con raíces simples
- MUCHO más rápido

**Ejemplo:**
```
Lineal:     0.1 → 0.05 → 0.025 → 0.0125 → ...
Cuadrática: 0.1 → 0.01 → 0.0001 → 0.00000001 → ...
```

---

## 📚 RESUMEN EJECUTIVO

### Para Bisección
1. Verificar f(a)·f(b) < 0
2. Llamar bisecciones(f, a, b, tol, itmax)
3. Convergencia garantizada pero lenta

### Para Newton-Raphson
1. Definir f y f'
2. Elegir x₀ cerca de la raíz (graficar primero)
3. Llamar NewtonRaphson(f, fp, x0, tol, itmax)
4. Convergencia rápida pero NO garantizada

### Para Raíces Múltiples
1. Detectar: |e_{n+1}|/|e_n| → constante ≠ 0
2. Usar N-R modificado con α = multiplicidad
3. Recupera convergencia cuadrática

### Estructura de script típico
```matlab
% Actividad X - Ejercicio Ya
% Descripción
% Alumno: Agustin Formenti

clear, clc

%% Defino función (y derivada si es N-R)
f = @(x) ...
fp = @(x) ...  % solo para N-R

%% Parámetros
a, b / x0
tol = 1e-12
itmax = 100

%% Llamo al método
r = metodo(...)

%% Verifico
fprintf('f(r) = %.15e\n', f(r))

disp(' ')
disp('========== FIN EJERCICIO ==========')
```

---

## 🚀 ÚLTIMO CONSEJO

**En el examen:**
1. Lee TODO el enunciado
2. Identifica: ¿Bisección o Newton-Raphson?
3. Si hay estudio gráfico, HAZLO PRIMERO
4. Llama a funciones externas, NO implementes código
5. VERIFICA el resultado siempre
6. Comentarios simples explicando QUÉ haces
7. Estructura profesional pero no excesiva

**¡Éxitos, Agu! Vos podés 💪**

---

**Fin del Cheatsheet - Actividad 4**
