% Déclaration des variables
N = 0;
L = 0;
U = zeros(1, 100);
P = zeros(1, 100);
R = zeros(1, 100);
totalUtilite = 0;
totalPrix = 0;

% Entrée des données
fprintf('Entrez le nombre d''éléments à prendre: \n');
N = input('');

fprintf('Entrez votre limite budgétaire: \n');
L = input('');

fprintf('Entrez l''utilité et le prix de vos objets, séparés par un espace:\n');
for i = 1:N
    data = input('', 's');
    values = str2num(data);

    if numel(values) == 2
        U(i) = values(1);
        P(i) = values(2);
    else
        fprintf('Veuillez entrer deux valeurs.\n');
        i = i - 1;
    end
end

% Calcul des ratios utilité/prix
R(1:N) = U(1:N) ./ P(1:N);

% Tri des objets en fonction du ratio utilité/prix
[sortedRatios, sortedIndices] = sort(R, 'descend');

% Sélection des objets
fprintf('Objets choisis:\n');
for i = 1:N
    index = sortedIndices(i);
    if (totalPrix + P(index) <= L)
        totalUtilite = totalUtilite + U(index);
        totalPrix = totalPrix + P(index);
        fprintf('Objet %d : Utilité = %d, Prix = %d\n', index, U(index), P(index));
    else
        break; % Sortir de la boucle dès que la limite est atteinte
    end
end

fprintf('Utilité totale: %d\n', totalUtilite);
fprintf('Prix total: %d\n', totalPrix);

if (totalPrix <= L)
    fprintf('Limite budgétaire non atteinte. Tous les objets ont été pris.\n');
else
    fprintf('Limite budgétaire atteinte.\n');
end

