#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Apr 18 23:04:19 2024

@author: jandrespm
"""
# Programa para la solución del sistema lineal Ax=b mediante la factorización de Cholesky A=U.TU
'''
Factorización de la matriz positiva definida A usando Cholesky.
Si la matriz no es definida positiva, el algoritmo falla.
Cálculo solución del sistema lineal Ax=b mediante R.TRx=b

A = matriz de coeficientes
b = vector independiente
salida:
x = solución nx1 del sistema Ax=b por Cholesky
U = matriz nxn triangular superior
'''

import numpy as np
import scipy as sc

# Definición de una función llamada my_cholesky que genera la matriz triaugular superior (U)
def my_cholesky(A):
    n = len(A)
    U = np.zeros((n, n))

    for i in range(n):
        aux = A[i, i] - np.sum(U[0:i, i]**2)
        if aux <= 0:
            print('The matrix is not positive definite. Cholesky cannot be applied.')
            return None
        for j in range(i, n):
            if i == j:
                U[i][i] = np.sqrt(A[i][i] - np.sum(U[:i, i]**2))
            else:
                U[i][j] = (A[i][j] - np.sum(U[:i, i]*U[:i, j]))/U[i][i]
    return U

# Función para obtener "y" por sustitución hacía adelante (sustitución progresiva)
def forward_substitution(U, b):
    n = len(U)
    y = np.zeros(n)

    for i in range(n):
        y[i] = (b[i] - np.dot(U[:i, i], y[:i]))/U[i][i]
    return y

# Función para obtener "x" por sustitución hacía atrás (sustitución regresiva)
def backward_substitution(U, b):
    n = len(U)
    x = np.zeros(n)

    for i in range(n-1, -1, -1):
        x[i] = (b[i] - np.dot(U[i, i+1:], x[i+1:]))/U[i][i]
    return x

# Función que llama a las variables U; x; y; para obtener la solución de Ax = b y la matriz triangular superior (U)
def solve_cholesky(A, b):
    U = my_cholesky(A)
    if U is None:
        return None, None
    y = forward_substitution(U, b)
    x = backward_substitution(U, y)
    return x, U

# Ejemplo de aplicación
# Definición de una matriz A y un vector b, de un sistema tipo Ax = b
A = np.array([[6, 15, 55], 
              [15, 55, 225], 
              [55, 225, 979]])
b = np.array([76, 295, 1259])

solution, U = solve_cholesky(A, b)
print("Solución del sistema:", solution)
print("Matriz triangular superior U:")
print(U)

# Nota: en Python hay un módulo para realizar la factorización de Cholesky (Librería scipy)
# Uso de scipy
Uc = sc.linalg.cholesky(A)
Ut = Uc.transpose()

# Generación de la solución Ux = d
d = np.linalg.solve(Ut, b)
xchky = np.linalg.solve(Uc, d)

print('La solución del sistema es: ', xchky)

# Bonus track
# Ejemplo donde la factorización de Cholesky no funciona 
A1 = np.array([[1, 2, 3],
              [2, 5, 7],
              [3, 7, 10]])
b1 = np.array([1, 2, 3])

solution1, U1 = solve_cholesky(A1, b1)
print("Solución del sistema:", solution1)
print("Matriz triangular superior U:")
print(U1)

# End
