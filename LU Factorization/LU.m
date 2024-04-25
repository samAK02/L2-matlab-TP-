A = [2, -1, 0; -1, 2, -1; 0, 1, -2];

function [L, U] = decompositionLU(A)

    n = size(A, 1);


    L = eye(n); % Initialisation de L comme une matrice identité de taille n


    U = A; % Initialisation de U comme une copie de la matrice A

    % Décomposition LU
    for k = 1:n-1
        for i = k+1:n

            L(i, k) = U(i, k) / U(k, k); % Calcul des éléments de L


            U(i, k+1:end) = U(i, k+1:end) - L(i, k) * U(k, k+1:end); % Mise à jour de U
        end
    end
end



[L, U] = decompositionLU(A);
disp('Matrice L :');
disp(L);
disp('Matrice U :');
disp(U);




