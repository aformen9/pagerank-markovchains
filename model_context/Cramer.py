#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 17:28:36 2024

@author: jandrespm
"""
# Programa para la solución de sistemas lineales usando la regla de Cramer
'''
cramer: regla de Cramer
entrada:
A = matriz de coeficientes
b = vector independiente
salida:
x = vector solución
'''

import numpy as np

def cramer(A, b):
    # Cálculo del determinante de A
    d = np.linalg.det(A)
    
    if d == 0:
        return None
    else:
        n = len(A) # Inicialización
        x = np.zeros(n)
        for j in range(n):
            A_temp = np.copy(A)  # Crear una copia independiente de A (Evita sobreescribir A)
            A_temp[:, j] = b.flatten()
            x[j] = np.linalg.det(A_temp)/d
        return x

# Definir una función para utilizar Cramer
def sol_cramer(A, b):
    x = cramer(A, b)
    if x is None:
        print('La matriz no es invertible. Cramer no es aplicable')
    else:
        print("La solución es:", x)
        
# Ejemplo de aplicación
# Definir la matriz A y el vector b
A = np.random.randint(1, 1001, size=(1000, 1000))

# Generar un escalar aleatorio R
R = np.random.randint(1, 1001)
#R = 1

# Generar vector b como R multiplicado por un vector de unos
b = R*np.ones((1000, 1))

# Llamar a la función sol_cramer, puede ejecutarse sola o guardarla en una variable llamada solucion
sol_cramer(A, b)

solucion = sol_cramer(A, b) # Forma alternativa

# End
