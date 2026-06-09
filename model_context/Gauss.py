#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 16 16:22:02 2024

@author: jandrespm
"""
# Programa para la solución del sistema lineal Ax=b mediante eliminación Gaussiana
'''
gauss: Eliminación de Gauss con pivoteo parcial
entrada:
A = matriz de coeficientes
b = vector independiente
salida:
x = vector solución
'''

import numpy as np

def gauss(A, b):
    # Inicialización
    n = A.shape[0]

    # Cálculo matriz ampliada
    Aum = np.concatenate((A, b), axis=1)

    for q in range(n - 1):
        # Pivoteo parcial con escalonamiento
        S = np.max(np.abs(Aum[q:n, q:n]), axis=1)
        j = np.argmax(np.abs(Aum[q:n, q]) / S)
        j += q  # Ajuste para la selección dentro del subconjunto
        # Intercambio fila q-ésima con fila j-ésima
        Aum[[q, j]] = Aum[[j, q]]

        # Verificación
        if Aum[q, q] == 0:
            print('A no es inversible. No hay solución o no es única')
            return None

        # Proceso de eliminación en columna q-ésima
        for k in range(q + 1, n):
            m = Aum[k, q] / Aum[q, q]
            Aum[k, q:n+1] -= m * Aum[q, q:n+1]

    # Sustitución regresiva (hacia atrás)
    x = np.zeros(n)
    x[n-1] = Aum[n-1, n] / Aum[n-1, n-1]
    for k in range(n - 2, -1, -1):
        x[k] = (Aum[k, n] - np.dot(Aum[k, k+1:n], x[k+1:])) / Aum[k, k]

    return x

# Definir A, b y evaluar la función gauss

# End