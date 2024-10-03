function [root, iterations] = bisection(f, a, b, tol, maxIter)
    % Bisection Method for finding the root of f(x) = 0
    % f: function handle
    % a: lower bound
    % b: upper bound
    % tol: tolerance for stopping criteria
    % maxIter: maximum number of iterations

    if f(a) * f(b) >= 0
        error('f(a) and f(b) must have different signs');
    end
    
    iterations = 0;
    while (b - a) / 2 > tol && iterations < maxIter
        c = (a + b) / 2; % Midpoint
        if f(c) == 0
            root = c; % Found exact root
            return;
        elseif f(c) * f(a) < 0
            b = c; % Root is in [a, c]
        else
            a = c; % Root is in [c, b]
        end
        iterations = iterations + 1;
    end
    root = (a + b) / 2; % Approximate root
end
