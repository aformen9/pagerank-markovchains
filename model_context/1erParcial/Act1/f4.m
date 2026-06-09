function y = f4(x)
%% function f4: evalua f4(x) = x * ln(|x|)
% Input: x - escalar o vector de valores
% Output: y - f4(x) evaluada
% Autor: Agustin Formenti

% Uso abs() para valor absoluto y log() para logaritmo natural
y = x .* log(abs(x));

end
