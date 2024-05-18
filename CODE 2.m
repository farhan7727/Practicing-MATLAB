% Example usage
A = [6, 2, 3, 4 ; 11, 12, 9 , 7 ; 13, 10, 8, 14; 8, 15, 16, 17];
inverse_A = gauss_jordan_inverse(A);
disp('Original Matrix:');
disp(A);
disp('Inverse Matrix:');
disp(inverse_A);

function inverse_matrix = gauss_jordan_inverse(matrix)
    % Check for square matrix
    [rows, cols] = size(matrix);
    if rows ~= cols
        error('Input matrix must be square for inversion.');
    end
    
    % Augment the matrix with the identity matrix
    augmented_matrix = [matrix, eye(rows)];
    
    % Perform Gauss-Jordan elimination
    for k = 1:rows
        % Make the diagonal element 1
        pivot = augmented_matrix(k, k);
        augmented_matrix(k, :) = augmented_matrix(k, :) / pivot;
        
        % Eliminate other elements in the column
        for i = 1:rows
            if i ~= k
                factor = augmented_matrix(i, k);
                augmented_matrix(i, :) = augmented_matrix(i, :) - factor * augmented_matrix(k, :);
            end
        end
    end
    
    % Extract the inverted matrix from the augmented matrix
    inverse_matrix = augmented_matrix(:, cols+1:end);
end

