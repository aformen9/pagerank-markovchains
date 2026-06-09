#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 16 20:41:47 2024

@author: jandrespm
"""
# Programa para la solución del sistema lineal Ax=b mediante descomposición LU
'''
DescompLU: descomposicion LU
entrada:
A = matriz de coeficientes
b = vector independiente
salida:
x = vector solución
'''

import numpy as np
import scipy as sc

# Función de la descomposición LU
def DescompLU(A, b):
    # Inicialización
    n, _ = A.shape
    A = A.astype(float)
    b = b.astype(float)

    for q in range(n - 1):
        # Pivoteo parcial con escalonamiento
        S = np.max(np.abs(A[q:n, q:n]), axis=1)
        j = np.argmax(np.abs(A[q:n, q])/S) + q

        # Intercambio de la fila q-esima con la fila k-esima
        A[[q, j]] = A[[j, q]]  # Corrección para el código del EVA 2024
        b[[q, j]] = b[[j, q]] # # Corrección para el código del EVA 2024
        
        # Verificación
        if A[q, q] == 0:
            print('A no es inversible. No hay solución o no es única')
            return None

        # Proceso de eliminación en la columna q-esima
        for k in range(q + 1, n):
            m = A[k, q] / A[q, q]
            A[k, q] = m
            A[k, q + 1:n] -= m * A[q, q + 1:n]

    # Resolución para determinar "y" con sustitución progresiva (hacia adelante)
    y = np.zeros(n)
    y[0] = b[0]
    for k in range(1, n):
        y[k] = b[k] - np.dot(A[k, :k], y[:k])

    # Resolución para determinar "x" con sustitución regresiva (hacia atrás)
    x = np.zeros(n)
    x[n - 1] = y[n - 1] / A[n - 1, n - 1]
    for k in range(n - 2, -1, -1):
        x[k] = (y[k] - np.dot(A[k, k + 1:n], x[k + 1:n])) / A[k, k]

    return x

# Ejemplo de aplicación
# Definición de una matriz A y un vector b, de un sistema tipo Ax = b
A = np.array([[3, -0.1, -0.2],
              [0.1, 7, -0.3],
              [0.3, -0.2, 10]])

b = np.array([7.85, -19.3, 71.4])

x = DescompLU(A, b)
print("La solución del sistema es:", x)

# Nota: en Python hay un módulo para cargar la descomposición LU (librería scipy)
# Uso de scipy

P, L, U = sc.linalg.lu(A)

# Imprimir los resultados
print('Matrix L = \n',L)
print('Matrix U = \n',U)
print('Matrix P = \n',P)

# Generación de la solución Ux = d
d = np.linalg.solve(L, b)
xlu = np.linalg.solve(U, d)

print('La solución del sistema es: ', xlu)

# End
