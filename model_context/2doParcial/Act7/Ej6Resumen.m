% Ejercicio 6 - Resumen
% Agustin Formenti

clear, clc

fprintf('=== RESUMEN EJERCICIO 6 ===\n\n')

fprintf('a) Se implemento PuntoFijo3D.m exitosamente.\n\n')

fprintf('b) Se probaron ambos sistemas:\n\n')

fprintf('Sistema i):\n')
fprintf('  x^2 - x + y^2 + z^2 = 5\n')
fprintf('  x^2 + y^2 - y + z^2 = 4\n')
fprintf('  x^2 + y^2 + z^2 + z = 6\n')
fprintf('  RESULTADO: DIVERGE\n\n')

fprintf('Sistema ii):\n')
fprintf('  x^2 - x + 2y^2 + yz = 10\n')
fprintf('  5x - 6y + z = 0\n')
fprintf('  z - x^2 - y^2 = 0\n')
fprintf('  RESULTADO: DIVERGE\n\n')

fprintf('CONCLUSION:\n')
fprintf('El metodo de Punto Fijo NO es adecuado para estos sistemas.\n')
fprintf('Las generatrices obtenidas del despeje natural no cumplen\n')
fprintf('las condiciones de convergencia.\n')
fprintf('Seria necesario usar Newton-Raphson u otro metodo.\n')
