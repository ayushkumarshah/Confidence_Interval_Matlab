function test_ci_bernoulli(functions, Ns, alphas, nrepeats, mean)

A = zeros(nrepeats, 1);
B = zeros(nrepeats, 1);

fprintf('Using bernoulli distribution with mean %1.1f as input\n', mean);
fprintf('-----------------------------------------------------\n\n');

for func=functions
    fprintf('Function %d:\n\n', func);
    for alpha = alphas
        for N = Ns
            for repeat = 1:nrepeats
                X = sample_bernoulli(N, mean);
                [A(repeat), B(repeat)] = ci(X, func);
            end
            fraction = sum((A <= mean) & (mean <= B)) / nrepeats;
            fprintf('alpha: %1.2f\t N: %5d\t fraction missed: %1.3f\n', ...
                    alpha, N, 1 - fraction);         
        end
        fprintf('\n');
    end
    fprintf('-----------------------------------------------------\n\n');
end