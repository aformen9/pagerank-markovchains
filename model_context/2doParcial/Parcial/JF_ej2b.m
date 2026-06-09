function J = JF_ej2b(X)
% Matriz Jacobiana para ejercicio 2b
% Agustin Formenti

J(1,1) = 21*X(1)^2 - 10;
J(1,2) = -1;
J(2,1) = 1;
J(2,2) = 24*X(2)^2 - 11;

end
