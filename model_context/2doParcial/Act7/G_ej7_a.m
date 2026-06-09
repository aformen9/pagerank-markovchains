function Y = G_ej7_a(X)
% Generatrices del ejercicio 7a (modelo Wilson) - Actividad 7
% Sistema original
% ENTRADA: X = [Λ₁, Λ₂] vector fila
% SALIDA: Y = [g1(Λ₁,Λ₂), g2(Λ₁,Λ₂)] vector fila
%
% Agustin Formenti

L1 = X(1);  % Lambda 1
L2 = X(2);  % Lambda 2

% Datos del problema
gamma1 = 7.20;
gamma2 = 2.74;

% Sistema original:
% ln(γ₁) = 1 - ln(Λ₁) - Λ₂
% ln(γ₂) = 1 - ln(Λ₂) - Λ₁

% Despejo para Punto Fijo:
% ln(Λ₁) = 1 - ln(γ₁) - Λ₂  →  Λ₁ = exp(1 - ln(γ₁) - Λ₂)
% ln(Λ₂) = 1 - ln(γ₂) - Λ₁  →  Λ₂ = exp(1 - ln(γ₂) - Λ₁)

Y(1) = exp(1 - log(gamma1) - L2);
Y(2) = exp(1 - log(gamma2) - L1);

end
