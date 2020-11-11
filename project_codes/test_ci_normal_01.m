function test_ci_normal_01(functions, Ns, alphas, nrepeats, mean)

A = zeros(nrepeats, 1);
B = zeros(nrepeats, 1);

fprintf('Using normal distribution with mean %f as input\n', mean);
fprintf('----------------------------\n\n');

for func=functions
    fprintf('Function %d:\n\n', func);
    for alpha = alphas
        for N = Ns
            for repeat = 1:nrepeats
                X = sample_bernoulli(N, 0.5);
                [A(repeat), B(repeat)] = ci(X, func);
            end
            fraction = sum((A <= mean) & (mean <= B)) / nrepeats;
            fprintf('alpha: %1.2f\t N: %5d\t fraction missed: %1.3f\n', ...
                    alpha, N, 1 - fraction);         
        end
        fprintf('\n');
    end
    fprintf('----------------------------\n');
end