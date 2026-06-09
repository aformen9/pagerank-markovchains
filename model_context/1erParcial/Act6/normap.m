function np = normap(x,p)
% Cálculo de norma p-ésima de un vector 
% Datos: - x vector nx1
%        - p norma a calcular (1<=p<=inf)
% Resultado:
%        - np norma p-ésima de x
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modificacion: Luciano Ponzellini Marinelli (2022)

if p == inf
    np = max(abs(x));
else	
    np = (sum(abs(x).^p))^(1/p);
end
end

