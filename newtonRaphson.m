function [root, iterations] = newtonRaphson(f, df, x0, tol, maxIter)
% Newton-Raphson Method for finding the root of f(x) = 0
% f: function handle
% df: derivative of f
% x0: initial guess
% tol: tolerance for stopping criteria
% maxIter: maximum number of iterations

iterations = 0;
while iterations < maxIter
    if df(x0) == 0
        error('Derivative is zero; no solution found.');
    end
    x1 = x0 - f(x0) / df(x0); % Update step

    if abs(f(x1)) < tol || abs(x1 - x0) < tol
        % disp('Newton')
        % disp(iterations)
        root = x1; % Found root
        return;
    end

    x0 = x1; % Update for next iteration
    iterations = iterations + 1;
end
disp('Newton')
disp(iterations)
root = x1; % Approximate root
end
