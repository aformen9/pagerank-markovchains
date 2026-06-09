#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr 15 18:35:45 2024

@author: jandrespm
"""

# ExpTaylor
# Grafica la funcion de la cantidad de terminos n, 
# El error relativo del Taylor de exp(x):
# T(e^x,0) = 1 + x + x^2/2! +...+ x^n/n!

import numpy as np
import matplotlib.pyplot as plt

nTerms = 50 # número de términos
xx = [1, 5, 10, -1, -5, -10] # Un vector almacenado como lista, en donde se evalúa la función

for i in range(len(xx)):
    x = xx[i] # Indexa o extrae cada elemento de la lista xx
    f = np.exp(x)*np.ones(nTerms) # Crea un array o vector de nTerms, en este caso 50
    s = 1
    term = 1
    err = np.zeros(nTerms)
    for k in range(nTerms):
        term = x*term/(k + 1) # Calcula los términos x + x^2/2! +...+ x^n/n!
        s += term # Le suma 1 a term
        err[k] = abs(f[k] - s) # Error absoluto
    relerr = err/np.exp(x) # Error relativo
    plt.subplot(2, 3, i + 1)
    plt.semilogy(range(1, nTerms + 1), relerr)
    plt.grid(True)
    plt.ylabel('Error Relativo Suma Parcial', fontsize=12)
    plt.xlabel('Orden Suma Parcial', fontsize=12)
    plt.title('x = {:.2f}'.format(x))
    plt.axis([0, 50, 1e-20, 1e10])

plt.tight_layout()
plt.show()

# End
