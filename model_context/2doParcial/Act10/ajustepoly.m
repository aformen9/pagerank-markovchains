function c = ajustepoly(x,y,grado)
% ajustepoly: realiza un ajuste de curvas por polinomios 1,x,x^2,x^3,...
%
% ENTRADA: 
%     - x: vector de abscisas
%     - y: vector de ordenadas
%     - grado: del polinomio de ajuste
%
% SALIDA:
%     - c: es el vector de coeficientes del polinomio de ajuste
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modificacion: Luciano Ponzellini Marinelli (2025)

for k=1:grado+1
    F(:,k) = x'.^(k-1);
end

A = F'*F;
b = F'*y';

% Resolucion del SEL
c = Gauss(A,b);

% Reordena el vector c (necesario para utilizar polyval)
c = c(grado+1:-1:1);
