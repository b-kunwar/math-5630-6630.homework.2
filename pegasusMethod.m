function [root, iter] = pegasusMethod(f, a, b, epsilon)
    % Input:
    % f      - function handle of f(x)
    % a, b   - initial guesses for the interval [a, b]
    % epsilon- tolerance level for convergence (stopping criterion)

    % Initialize variables
    x0 = a;
    x1 = b;
    f0 = f(x0);
    f1 = f(x1);
    iter = 0; % iteration counter

    if f0 * f1 > 0
        error('f(a) and f(b) must have opposite signs');
    end

    while true
        % Standard false position step
        x2 = x0 - f0 * (x1 - x0) / (f1 - f0);  % False position formula
        f2 = f(x2);                            % Evaluate f(x2)
        iter = iter + 1;
        
        % Check if the current approximation is good enough
        if abs(f2) < epsilon
            root = x2;  % Return the root if within tolerance
            fprintf('Root found: %f\n', root);
            fprintf('Iterations: %d\n', iter);
            return;
        end
        
        % Pegasus adjustment
        lambda = f1 / (f1 + f2);  % Dynamic scaling factor
        
        if f1 * f2 > 0
            % Adjust f0 and x0 using lambda factor
            f0 = lambda * f0;    % Reduce f0 by a dynamic factor
            % Update x1, f1 with the latest values from x2, f2
            x1 = x2;
            f1 = f2;
        else
            % Prepare to perform the next false position step
            x0 = x1;  % Shift x0 to the previous x1
            f0 = f1;  % Update f0 to the previous f1
            x1 = x2;  % Update x1 to x2
            f1 = f2;  % Update f1 to f2
        end
    end
end
