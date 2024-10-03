
f = @(x) 3*x^3 - 2*x^2 - 4; % P 2.2 
df = @(x) 9*x^2 - 4*x;  % Derivative for Newton-Raphson

% f = @(x) x^2-2; % P 2.2 
% df = @(x) 2*x;  % Derivative for Newton-Raphson

tol = 1e-9;

[root, iterations] = bisection(f, 1, 3, tol, 100);
        disp('Bisection')
        disp(iterations)
[root, iterations] = falsePosition(f, 1, 3, tol, 100);
        disp('False Position')
        disp(iterations)
[root, iterations] = secant(f, 1, 3, tol, 100);
        disp('Secant')
        disp(iterations)
[root, iterations] = steffensen(f, 1.5, tol, 100);
        disp('Steffensen')
        disp(iterations)
[root, iterations] = newtonRaphson(f, df, 1.5, tol, 100);
        disp('Newton')
        disp(iterations)
