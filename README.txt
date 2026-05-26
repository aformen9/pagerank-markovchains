=========================================================================
PROYECTO: Identificacion de nodos criticos en redes de infraestructura
          mediante PageRank y Cadenas de Markov
MATERIA : Metodos y Computos Numericos - UCA Rosario 2025
EQUIPO  : Agu (teoria) | Vicky (codigo) | Choco (experimentos)
SOFTWARE: GNU Octave (compatible MATLAB)
=========================================================================

DATOS DE ENTRADA:
-----------------
Los experimentos 4 y 5 usan datos REALES del estandar industrial IEEE:

  IEEE Power System Test Cases (caso 30 y caso 57 buses)
  Fuente: MATPOWER - https://github.com/MATPOWER/matpower
  Referencia: Christie, R. (1993). Power Systems Test Case Archive.
              University of Washington.
              https://www2.ee.washington.edu/research/pstca/
  Referencia original (case30):
              Alsac, O. & Stott, B. (1974). Optimal Load Flow with
              Steady State Security. IEEE Trans. PAS, 93(3), 745-751.

  Los datos se descargan automaticamente desde GitHub en runtime
  mediante cargar_ieee_case.m. Se requiere conexion a internet.

ARCHIVOS DEL PROYECTO:
-----------------------
pagerank.m               - Algoritmo principal: metodo de la potencia
                           Iteracion de punto fijo (L8/L9 Ponzellini)
                           Fuente: Moler pp.75-76

construir_red.m          - Construye la matriz sparse de adyacencia
                           Fuente: Moler p.77

generar_red_jerarquica.m - Genera redes sinteticas de infraestructura
                           Para el experimento de escalabilidad (exp3)

cargar_ieee_case.m       - Descarga y parsea datos reales IEEE desde
                           MATPOWER/GitHub. Soporta 'case30' y 'case57'.
                           Devuelve [G, tipos, info] con la red y metadatos.

simular_falla.m          - Simula la falla de nodos: elimina sus links y
                           recalcula el PageRank sobre la red reducida.

exp1_seis_nodos.m        - Verificacion contra ejemplo de Moler pp.78-79
                           Test unitario basico del proyecto

exp2_comparar_metodos.m  - Compara los 3 metodos de solucion:
                           Potencia | Directo | Inverse iteration
                           Fuente: Moler pp.75-78

exp3_escalabilidad.m     - Analisis de escalabilidad: O(k*n) vs O(n^3)
                           Rango chico [10..200] y rango grande [200..5000]
                           Estimacion empirica de exponentes con log-log

exp4_red_electrica.m     - PageRank sobre IEEE case30 (30 buses, REAL)
                           Identificacion de nodos criticos por tipo de bus
                           Simulacion real de falla: criticos vs aleatorios

exp5_red_electrica_grande.m - PageRank sobre IEEE case57 (57 buses, REAL)
                           Comparacion case30 vs case57 para validar O(k*n)
                           Demostracion que las iteraciones son ~constantes

ORDEN DE EJECUCION:
-------------------
1. exp1_seis_nodos             (verificar que el codigo reproduce Moler)
2. exp2_comparar_metodos       (comparar los 3 metodos de solucion)
3. exp3_escalabilidad          (analisis de escalabilidad sintetica)
4. exp4_red_electrica          (IEEE case30 - red electrica real, 30 buses)
5. exp5_red_electrica_grande   (IEEE case57 - red electrica real, 57 buses)

NOTA: Los experimentos 4 y 5 requieren conexion a internet para
descargar los datos IEEE desde GitHub la primera vez que se ejecutan.

CONCEPTOS CLAVE (para la defensa):
------------------------------------
- pi_i = probabilidad de impacto sistemico del nodo i
  NO predice cual nodo va a fallar.
  Responde: si el nodo i fallara, cuanto danio causaria?

- El metodo de la potencia es una ITERACION DE PUNTO FIJO
  (NO decir autovector dominante - no esta en el programa)
  Esquema: pi^(k+1) = A * pi^(k)
  Criterio de parada: norm(pi_nuevo - pi_viejo, 1) < tol

- Convergencia garantizada porque p < 1 contrae el operador
  (L9 Ponzellini: norma del jacobiano < 1)
  Tasa de convergencia: |lambda_2| <= p = 0.85

- Norma 1 es natural para distribuciones de probabilidad

- Escalabilidad: k (iteraciones) aproximadamente constante (~50)
  independientemente de n => costo O(k*n) es LINEAL en n.
  Comparar: sistema directo O(n^3) => infeasible para n grande.

- Redes electricas son NO DIRIGIDAS (corriente AC bidireccional)
  => se modelan agregando fbus->tbus y tbus->fbus para cada linea.

TRAZABILIDAD:
-------------
pagerank.m              -> Moler pp.74-81 | L8 L9 Ponzellini
construir_red.m         -> Moler pp.76-77 | L7 Ponzellini
cargar_ieee_case.m      -> MATPOWER GitHub | Christie (1993) UW
exp1                    -> Moler pp.78-79 (resultados conocidos)
exp2 metodo directo     -> Moler pp.76-77 | L7 Ponzellini
exp2 inv.iteration      -> Moler pp.77-78 | L5 Ponzellini
exp3 escalabilidad      -> Moler pp.75-76 (argumento O(k*n))
exp4 (case30)           -> Alsac & Stott (1974) | MATPOWER | Moler pp.74-81
exp5 (case57)           -> Christie (1993) UW | MATPOWER | Moler pp.74-81

USO DE IA:
----------
Claude AI (Anthropic) utilizado para redaccion de comentarios
y estructura del codigo. TODO el contenido matematico fue
verificado contra Moler 2004 y las lecturas del curso.
=========================================================================
