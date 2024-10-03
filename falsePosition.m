function [root, iterations] = falsePosition(f, a, b, tol, maxIter)
% False Position Method for finding the root of f(x) = 0
% f: function handle
% a: lower bound
% b: upper bound
% tol: tolerance for stopping criteria
% maxIter: maximum number of iterations

if f(a) * f(b) >= 0
    error('f(a) and f(b) must have different signs');
end

iterations = 0;
while iterations < maxIter
    % Calculate the point of intersection
    c = b - (f(b) * (a - b)) / (f(a) - f(b));
    if abs(f(c)) < tol || (b - a) / 2 < tol
        root = c; % Found root
        % disp('FalsePosition')
        % disp(iterations)
        return;
    end

    % Update bounds based on the sign of f(c)
    if f(c) * f(a) < 0
        b = c; % Root is in [a, c]
    else
        a = c; % Root is in [c, b]
    end
    iterations = iterations + 1;
end
disp('FalsePosition')
disp(iterations)
root = c; % Approximate root
end
