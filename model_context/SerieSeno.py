#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr 15 19:38:02 2024

@author: jandrespm
"""

#  SerieSeno: Evalúa la representación en serie de la función SENO

# ssum = SerieSeno(x)
# ssum = SerieSeno(x,tol)
# ssum = SerieSeno(x,tol,n)

# Entrada: 
# x:     Argumento de la funcion SENO
# tol:   Tolerancia admitida para sumatoria (por defecto: tol = 5e-9), es opcional
# La serie termina cuando abs(T_k/S_k) < tol,  donde: 
# T_k:   k-ésimo término y S_k suma incluyendo el k-ésimo término
# n:     Máximo número de términos no nulos (por defecto: n = 15), es opcional
#
# Resultado:
# ssum: valor de la serie al cabo de n términos o al satisfacer la tolerancia

import numpy as np

def SerieSeno(x, tol=5e-9, n=15):
    # x = np.pi / 4.5e-10  # Puede definirse el valor de x dentro de la función o evaluarla externamente
    term = x  # Inicializa la serie
    ssum = term
    print('Valor aproximado de la función seno ({})\n'.format(x))
    print(' n   término      serie')
    print('{:3d} {:11.3e} {:12.8f}'.format(1, term, ssum))

    for k in range(3, 2 *n, 2):
        term = -term*x*x/(k*(k - 1))  # Próximo término en la serie
        ssum = ssum + term
        print('{:3d} {:11.3e} {:12.8f}'.format(k, term, ssum))
        if abs(term/ssum) < tol:  # Verifica convergencia
            break

    print('\n Error Total con {} términos es {}\n'.format((k + 1) // 2, abs(ssum - np.sin(x))))

# Evaluación de la función 
SerieSeno(np.pi/4.5e-10) # Aquí se debe evaluar

# End
