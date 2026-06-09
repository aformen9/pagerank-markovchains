function ssum = SerieSeno(x,tol,n)
% SerieSeno.m: Evalúa la representación en serie de la función SENO
% 
% ssum = SerieSeno(x)
% ssum = SerieSeno(x,tol)
% ssum = SerieSeno(x,tol,n)
%
% ENTRADA: 
% x:     argumento de la funcion SENO
% tol:   (optional) tolerancia admitida para sumatoria (por defecto: tol = 5e-9)
% La serie termina cuando abs(T_k/S_k) < tol,  donde: 
% T_k:   k-ésimo término y S_k suma incluyendo el k-ésimo término
% n:     (optional) máximo número de términos no nulos (por defecto: n = 15)
%
% RESULTADO:
% ssum: valor de la serie al cabo de n términos o al satisfacer la tolerancia
%
% Autores: Javier Signorelli - Javier Sorribas (2010)
% Modificacion: Luciano Ponzellini Marinelli (2015)

if nargin < 2, tol = 5e-9;
end

if nargin < 3, n = 15;
end

term = x;  % Inicializa la serie 
ssum = term;
fprintf('Valor aproximado de la función seno (%f)\n\n n   término      serie\n',x)
fprintf('%3d %11.3e %12.8f\n',1,term,ssum)

for k=3:2:(2*n-1)

	term = -term .* x.*x./(k.*(k-1));   % Próximo término en la serie 
	ssum = ssum + term;
	fprintf('%3d %11.3e %12.8f\n',k,term,ssum) 
	if abs(term./ssum)<tol   % Verifica convergencia    
   	break
	end
end
fprintf('\n Error Total con %d términos es %g\n\n',(k+1)/2,abs(ssum-sin(x)))

%end (Matlab)
%endfunction (Octave)


