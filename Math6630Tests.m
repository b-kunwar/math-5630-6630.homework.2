
% f = @(x) 3*x^3 - 2*x^2 - 4; % P 2.2 
% df = @(x) 9*x^2 - 4*x;  % Derivative for Newton-Raphson

f = @(x) x^2-2; % P 2.2 
df = @(x) 2*x;  % Derivative for Newton-Raphson


% [root, iter] = bisection(f, 1, 2, 1e-6, 100);
% [root, iter] = falsePosition(f, 1, 2, 1e-6, 100);
% [root, iter] = secant(f, 1, 2, 1e-6, 100);
% [root, iter] = steffensen(f, 1.5, 1e-6, 100);
% [root, iter] = newtonRaphson(f, df, 1.5, 1e-6, 100);


% [root, iter] = illinoisMethod(f, 1, 2, 1e-6);

[root, iter] = pegasusMethod(f, 1, 2, 1e-6);