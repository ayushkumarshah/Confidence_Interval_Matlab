function test_ci_beta(functions, Ns, alphas, nrepeats, a, b)

A = zeros(nrepeats, 1);
B = zeros(nrepeats, 1);

fprintf('Using beta distribution with a = %d, b = %d as input\n', a, b);
fprintf('----------------------------------------------\n\n');

for func=functions
    fprintf('Function %d:\n\n', func);
    for alpha = alphas
        for N = Ns
            for repeat = 1:nrepeats
                X = sample_beta(N, a, b);
                [A(repeat), B(repeat)] = ci(X, func);
            end
            true_mean = a / (a + b); 
            fraction = sum((A <= true_mean) & (true_mean <= B)) / nrepeats;
            fprintf('alpha: %1.2f\t N: %5d\t fraction missed: %1.3f\n', ...
                    alpha, N, 1 - fraction);         
        end
        fprintf('\n');
    end
    fprintf('-----------------------------------------------------\n\n');
end