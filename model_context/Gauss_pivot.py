#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 16 19:23:14 2024

@author: jandrespm
"""

# Programa para la solución del sistema lineal Ax=b mediante eliminación Gaussiana
'''
gausspivot: Eliminación de Gauss con pivoteo parcial
entrada:
A = matriz de coeficientes
b = vector independiente
salida:
x = vector solución
'''

import numpy as np

def gausspivot(A, b):
    (n, m) = A.shape
    if n != m:
        return 'La matriz de coeficientes A debe ser cuadrada'
    nb = n + 1
    # Construcción de la matriz aumentada
    Aug = np.hstack((A, b))
    
    # Verificación de la inversibilidad de la matriz
    if np.linalg.matrix_rank(A) < n:
        return 'La matriz A no es invertible. No hay solución o no es única'
    
    # Eliminación hacia adelante
    for k in range(n - 1):
        # Pivoteo parcial
        imax = maxrow(Aug[k:n, k]) + k
        if imax != k:  # No intercambiar filas si el pivote es máximo
            Aug[[k, imax]] = Aug[[imax, k]]  # Intercambiar filas k sí imax
        for i in range(k + 1, n):
            factor = Aug[i, k] / Aug[k, k]
            Aug[i, k:nb] -= factor * Aug[k, k:nb]
            
    # Sustitución hacia atrás
    x = np.zeros((n, 1))  # Crear arreglo x, vacío
    x = np.matrix(x)  # Convertir a tipo matriz
    x[n - 1] = Aug[n - 1, nb - 1] / Aug[n - 1, n - 1]
    for i in range(n - 2, -1, -1):
        x[i] = (Aug[i, nb - 1] - Aug[i, i + 1:n] * x[i + 1:n, 0]) / Aug[i, i]
    return x

def maxrow(avec):
    # función para determinar el índice de fila del valor máximo en un vector
    maxrowind = 0
    n = len(avec)
    amax = abs(avec[0])
    for i in range(1, n):
        if abs(avec[i]) > amax:
            amax = abs(avec[i])
            maxrowind = i
    return maxrowind


# Ejemplo de aplicación
''' Un ingeniero está involucrado en un proyecto de construcción requiere 4800, 5800 y 5700 m3 de arena, grava fina y
grava gruesa, respectivamente. Hay tres pozos de los cuales Estos materiales se pueden obtener. La composición del 
material en estos pozos está: 
pozo 1: arena 55 %, grava fina 30 % y grava gruesa 15 %
pozo 2: arena 25 %, grava fina 45 % y grava gruesa 20 %
pozo 3: arena 25 %, grava fina 20 % y grava gruesa 55 % 
¿Cuántos metros cúbicos se deben sacar de cada pozo para satisfacer las necesidades del ingeniero?
'''

A = np.matrix('0.55,0.25,0.25; 0.30,0.45,0.20; 0.15,0.30,0.55')
b = np.matrix('4800; 5800; 5700')
V = gausspivot(A,b)

print('Volumen del Pozo 1:',V[0])
print('Volumen del Pozo 2:',V[1])
print('Volumen del Pozo 3:',V[2])

# End

