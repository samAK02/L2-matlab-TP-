Mat = zeros(100, 100);
N = input("Entrez le nombre de lignes de la matrice: ");
M = input("Entrez le nombre de colonnes de la matrice: ");


for i = 1:N
    for j = 1:M
        fprintf("Entrez la valeur de Mat(%d, %d): ", i, j);
        Mat(i, j) = input("");
    end
end

i = 1;
j = 1;
while i <= N && j <= M

    [max_val, max_row] = max(abs(Mat(i:N, j)));
    max_row = max_row + i - 1;


    if max_val > eps

        temp = Mat(i, :);
        Mat(i, :) = Mat(max_row, :);
        Mat(max_row, :) = temp;

        Mat(i, :) = Mat(i, :) / Mat(i, j);

        for k = 1:N
            if k ~= i
                Mat(k, :) = Mat(k, :) - Mat(k, j) * Mat(i, :);
            end
        end

        i = i + 1;
    end
    j = j + 1;
end

fprintf("La matrice échelonnée réduite: \n");

for i = 1:N
    for j = 1:M
        fprintf("%d ", Mat(i, j));
    end
    fprintf("\n");
end

