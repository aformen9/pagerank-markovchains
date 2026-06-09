function y = fl4trunc(x)
%% fl4trunc
% Representa x con 4 cifras significativas usando redondeo por truncamiento
% Es decir, cortamos la mantisa en la 4ta cifra y NO redondeamos.
%
% Alumno: Agustin Formenti

  % Caso especial: cero
  if x == 0
    y = 0;
    return;
  end

  % Guardo el signo por separado
  s = sign(x);
  x_abs = abs(x);

  % Calculo el exponente en base 10 de la forma 0.d1d2d3d4... x 10^n
  n = floor(log10(x_abs));

  % Normalizo para que quede 1 <= m < 10 (mantisa "grande")
  m = x_abs / (10^n);

  % Queremos 4 cifras significativas por TRUNCAMIENTO:
  % m4 = trunc( m * 10^(4-1) ) / 10^(4-1)
  % (multiplico, trunco con fix y vuelvo a bajar)
  k = 4;
  escalado = m * 10^(k-1);
  escalado_trunc = fix(escalado);    % fix -> trunca hacia 0
  m4 = escalado_trunc / 10^(k-1);

  % Reconstruyo el número con el exponente original
  y = s * m4 * 10^n;

end

