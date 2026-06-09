#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 10 16:17:54 2024

@author: jandrespm
"""

# Script: ZoomPoli
# Grafica (x-1)^6 alrededor de x=1 con escala creciente
# pero evaluado via x^6 - 6x^5 + 15x^4 - 20x^3 + 15x^2 - 6x +1

# Importamos las librerías necesarias
import matplotlib.pyplot as plt
import numpy as np

# Definimos los parámetros
k = 0
n = 100
deltas = [0.1, 0.01, 0.008, 0.007, 0.005, 0.003]

# Recorremos los diferentes valores de delta
for delta in deltas:
    # Creamos el vector de puntos x
    x = np.linspace(1 - delta, 1 + delta, n)

    # Calculamos y1 = (x-1)^6
    y1 = (x - 1)**6

    # Calculamos y = x^6 - 6x^5 + 15x^4 - 20x^3 + 15x^2 - 6x + 1
    y = x**6 - 6*x**5 + 15*x**4 - 20*x**3 + 15*x**2 - 6*x + 1

    # Incrementamos el contador
    k += 1

    # Creamos la subparcela
    plt.subplot(2, 3, k)

    # Graficamos las funciones
    plt.plot(x, y, label="Evaluación directa")
    plt.plot(x, y1, label="(x-1)^6")
    plt.plot(x, np.zeros(n), color="black", linewidth=0.5)

    # Agregamos leyenda
    plt.legend()

    # Ajustamos los límites del eje
    plt.axis([1 - delta, 1 + delta, -np.max(np.abs(y)), np.max(np.abs(y))])

    # Añadimos rejilla
    plt.grid(True)

# Mostramos la gráfica
plt.show()

# End

