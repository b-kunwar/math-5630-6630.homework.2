function [root, iterations] = steffensen(f, x0, tol, maxIter)
% Steffensen's Method for finding the root of f(x) = 0
% f: function handle
% x0: initial guess
% tol: tolerance for stopping criteria
% maxIter: maximum number of iterations

iterations = 0;
while iterations < maxIter
    fx0 = f(x0);
    g = (f(x0 + fx0) - fx0) / fx0; % g(x0)
    x1 = x0 - fx0 / g; % Update step

    if abs(f(x1)) < tol || abs(x1 - x0) < tol
        root = x1; % Found root
        % disp('steffensen')
        % disp(iterations)
        return;
    end

    x0 = x1; % Update for next iteration
    iterations = iterations + 1;
end
disp('steffensen')
disp(iterations)

root = x1; % Approximate root
end
