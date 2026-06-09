function y = fl4(x)
  % Redondea x a 4 cifras significativas en base 10
  % usando redondeo simetrico (round half up en Octave)

  if x == 0
    y = 0;
    return;
  end

  s  = sign(x);
  ax = abs(x);
  n  = floor(log10(ax));        % orden de magnitud
  factor = 10^(4-1-n);          % para 4 cifras significativas

  y = s * round(ax * factor) / factor;
end
