function [root, iter ]= illinoisMethod(f, a, b, epsilon)
    % Input:
    % f      - function handle of f(x)
    % a, b   - initial guesses for the interval [a, b]
    % epsilon- tolerance level for convergence (stopping criterion)

    % Initialize variables
    x0 = a;
    x1 = b;
    f0 = f(x0);
    f1 = f(x1);
    iter = 0; % to keep track of iterations
    
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
        
        % Adjust until the sign changes
        while f1 * f2 > 0
            % Perform Illinois method adjustment
            lambda = 0.5;  % Scaling factor for Illinois Method
            f0 = lambda * f0;  % Adjust f0
            x0 = x0;           % Keep x0 as is
            % Update the new values
            x1 = x2;
            f1 = f2;
            x2 = x0 - f0 * (x1 - x0) / (f1 - f0);  % Recompute x2
            f2 = f(x2);
            iter = iter + 1;

            % Check stopping criteria again
            if abs(f2) < epsilon
                root = x2;  % Return the root if within tolerance
                fprintf('Root found: %f\n', root);
                fprintf('Iterations: %d\n', iter);
                return;
            end
        end
        
        % Prepare to perform a false position step next
        if f1 * f2 < 0
            % Update x0 and x1 for the next iteration
            x0 = x1;
            f0 = f1;
            x1 = x2;
            f1 = f2;
        end
    end
end
