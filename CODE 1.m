function f = objective_function(x)
    a = x(1);
    b = x(2);
    f = (a^2 + b^2)^2 + 3*b^2;
end


lb = [-1, -0.5];
ub = [1, 0.5];


x0 = [0, 0];


options = optimoptions(@fmincon, 'Display', 'iter');
[x_optimal, min_value] = fmincon(@objective_function, x0, [], [], [], [], lb, ub, [], options);


a_optimal = x_optimal(1);
b_optimal = x_optimal(2);

disp('Optimal values:')
disp(['a = ', num2str(a_optimal)])
disp(['b = ', num2str(b_optimal)])
disp(['Minimum value of the function: ', num2str(min_value)])


a_values = linspace(-1, 1, 100);
b_values = linspace(-0.5, 0.5, 100);
[A, B] = meshgrid(a_values, b_values);
F = (A.^2 + B.^2).^2 + 3*B.^2;

figure;
surf(A, B, F);
xlabel('a');
ylabel('b');
zlabel('F');
title('Objective Function');
