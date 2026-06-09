function [Pk,iter,err] = NewtonRaphsonSENL3D(Fnom,Jnom,P0,tol,itmax)
% NEWTONRAPHSONSENL3D - Metodo de Newton-Raphson para SENL tridimensional
%
% TEORIA: Resuelve sistemas de 3 ecuaciones no lineales con 3 incognitas
% mediante el metodo de Newton-Raphson. La iteracion es:
%   X_{k+1} = X_k + dX_k
% donde dX_k se obtiene resolviendo el sistema lineal:
%   J(X_k) * dX_k = -F(X_k)
%
% Entrada:
%   - Fnom: nombre de la funcion vectorial F(X) = [f1; f2; f3]
%   - Jnom: nombre de la funcion que calcula la Jacobiana J(X) (3x3)
%   - P0: estimacion inicial, vector columna de 3x1
%   - tol: tolerancia para el criterio de parada
%   - itmax: numero maximo de iteraciones
%
% Salida:
%   - Pk: solucion aproximada (vector 3x1)
%   - iter: numero de iteraciones realizadas
%   - err: estimacion del error ||dP||
%
% Usa:
%   - Gauss.m para resolver el sistema lineal J*dP = -F
%
% Basado en: NewtonRaphsonSENL.m de Luciano Ponzellini Marinelli (2022)
% Adaptado para 3D por: Agustin Formenti (2025)

disp(' Metodo de Newton-Raphson tridimensional')
disp(' Iter    Pk           Qk           Rk')

iter = 0;
fprintf('%3.0f %12.6f %12.6f %12.6f\n',iter,P0)

Pk = P0;
iter = 1;

while 1
    %% Evaluar F y J en el punto actual
    FX = feval(Fnom,Pk);
    Jacob = feval(Jnom,Pk);

    %% Resolver el sistema lineal J(Pk) * dP = -F(Pk)
    dP = Gauss(Jacob,-FX);

    %% Calcular error
    err = norm(dP);
    relerr = err / (norm(Pk) + eps);

    %% Actualizar aproximacion
    Pk = Pk + dP;
    fprintf('%3.0f %12.6f %12.6f %12.6f\n',iter,Pk)

    %% Criterio de parada: tolerancia alcanzada
    if err < tol || relerr < tol
        disp(' Se satisface la tolerancia.')
        disp(' Resultado final: ')
        fprintf(' %12.6f \n',Pk)
        return
    end

    %% Incrementar contador
    iter = iter + 1;

    %% Criterio de parada: maximo de iteraciones
    if iter > itmax
        disp(' Numero de iteraciones maximo alcanzado.')
        disp(' Resultado parcial: ')
        fprintf(' %12.6f \n',Pk)
        break
    end
end

end

%% Adaptación de la versión 2D al caso 3D
%% Resuelve sistemas de 3 ecuaciones con 3 incógnitas
%% Usa Gauss.m para resolver el sistema lineal 3×3
%% Incluye teoría completa en comentarios
