function [root, iterations] = secant(f, x0, x1, tol, maxIter)
% Secant Method for finding the root of f(x) = 0
% f: function handle
% x0: first initial guess
% x1: second initial guess
% tol: tolerance for stopping criteria
% maxIter: maximum number of iterations

iterations = 0;
while iterations < maxIter
    % Calculate the next approximation
    if abs(f(x1) - f(x0)) < eps
        error('Division by zero in the secant method');
    end
    x2 = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));

    if abs(f(x2)) < tol || abs(x2 - x1) < tol
        root = x2; % Found root
        % disp('secant')
        % disp(iterations)
        return;
    end

    % Update points for next iteration
    x0 = x1;
    x1 = x2;
    iterations = iterations + 1;
end
disp('secant')
disp(iterations)
root = x2; % Approximate root
end
