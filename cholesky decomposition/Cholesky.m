N = input('Entrez le nombre de lignes  N (N <= 100) : ');
M = input('Entrez le nombre de colonnes M (M <= 100) : ');


A = zeros(N, M);
for i = 1:N
    for j = 1:M
        A(i,j) = input(sprintf('Entrez la valeur de A(%d,%d) : ', i, j));
    end
end

L = zeros(N, M); % Initialisation de la matrice L



for i = 1:N
    for j = 1:M
        Somme = 0;
        if i == j
            for k = 1:(i-1)
                Somme = Somme + L(i,k)^2;

            end
            L(i,i) = sqrt(A(i,i) - Somme);
        elseif i > j
            for k = 1:(j-1)
                Somme = Somme + L(i,k) * L(j,k);
            end

            L(i,j) = (A(i,j) - Somme) / L(j,j);
        end
    end
end


disp('Matrice L :');
disp(L);   % Affichage de la matrice L

