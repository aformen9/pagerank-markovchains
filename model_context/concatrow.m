function B = concatrow(A, r)      % <-- primera línea DEBE ser "function ..."
    if size(r,1) ~= 1
        error('r debe ser vector-fila');
    end
    if size(r,2) ~= size(A,2)
        error('Longitudes no coinciden');
    end
    B = [r; A];
end

