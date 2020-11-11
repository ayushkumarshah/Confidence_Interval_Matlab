function test_ci_mean_uniform(func, Ns, alphas, nrepeats, a, b)

A = zeros(nrepeats, 1);
B = zeros(nrepeats, 1);

fprintf('Using mean uniform distribution (%d, %d) as input\n', a, b);
fprintf('----------------------------------------------\n\n');

for alpha = alphas
    for N = Ns
        for repeat = 1:nrepeats
            X = sample_mean_uniform(N, a, b);
            [A(repeat), B(repeat)] = ci(X, func);
        end
        true_mean = (a + b) / 2; 
        fraction = sum((A <= true_mean) & (true_mean <= B)) / nrepeats;
        fprintf('alpha: %1.2f\t N: %5d\t fraction missed: %1.3f\n', ...
                alpha, N, 1 - fraction);         
    end
    fprintf('\n');
end
fprintf('-----------------------------------------------------\n\n');
end