function Y = G_ej7_b(X)
% Generatrices del ejercicio 7b (modelo Wilson) - Actividad 7
% Sistema transformado con α = ln(Λ₁) y β = ln(Λ₂)
% ENTRADA: X = [α, β] vector fila
% SALIDA: Y = [g1(α,β), g2(α,β)] vector fila
%
% Agustin Formenti

alpha = X(1);  % alpha = ln(Lambda1)
beta = X(2);   % beta = ln(Lambda2)

% Datos del problema
gamma1 = 7.20;
gamma2 = 2.74;

% Sistema transformado:
% ln(γ₁) = 1 - α - exp(β)
% ln(γ₂) = 1 - β - exp(α)

% Despejo para Punto Fijo:
% α = 1 - ln(γ₁) - exp(β)
% β = 1 - ln(γ₂) - exp(α)

Y(1) = 1 - log(gamma1) - exp(beta);
Y(2) = 1 - log(gamma2) - exp(alpha);

end
