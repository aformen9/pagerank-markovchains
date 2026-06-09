#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Mar 13 15:57:25 2024

@author: sarottilabjp
"""
def rcuad2(x0, tol=1e-3):
    # rcuad2: Aproxima la raíz cuadrada de 2
    # x0 = aproximación inicial de la raíz de 2
    # tol = (opcional) tolerancia utilizada (valor por defecto: tol = 5e-9)
    # x1 = valor de la serie al cabo de n términos o al satisfacer la tolerancia

    if tol is None:
        tol = 5e-9  # tolerancia por defecto

    print(f' Valor inicial: {x0}\n\n  n        raiz        error')

    x1 = 0.5 * (x0 + 2 / x0)  # Punto de inicio de iteración
    err = abs(x1 - x0)  # cálculo del error entre iteraciones
    k = 1  # contador

    print(f'{k:3d}  {x1:12.15f}  {err:12.15f}')  # Imprimir el valor inicial

    while err > tol:  # Ciclo para verificar convergencia
        x0 = x1
        x1 = 0.5 * (x0 + 2 / x0)  # Actualización del valor utilizado
        err = abs(x1 - x0)
        k += 1
        print(f'{k:3d}  {x1:12.15f}  {err:12.15f}')  # Imprimir los valores calculados

    print(f'\nValor final aproximado: {x1:12.15f}')  # Resultdo de la iteración
    print(f'Valor exacto Python   : {2 ** 0.5:12.15f}')  # Exacto
    print(f'Error absoluto   : {abs(x1 - (2 ** 0.5)):12.15f}')  # Rrror final

# Ejemplo de uso:
rcuad2(1.0) # 1.0 es el primer valor usado para iniciar el programa

# End
