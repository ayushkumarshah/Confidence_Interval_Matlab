function test_ci_bernoulli(func, Ns, alphas, nrepeats, theta)

A = zeros(nrepeats, 1);
B = zeros(nrepeats, 1);

fprintf('Using bernoulli distribution with theta = %1.1f as input\n', theta);
fprintf('-----------------------------------------------------\n\n');

for alpha = alphas
    for N = Ns
        for repeat = 1:nrepeats
            X = sample_bernoulli(N, theta);
            [A(repeat), B(repeat)] = ci(X, func);
        end
        fraction = sum((A <= theta) & (theta <= B)) / nrepeats;
        fprintf('alpha: %1.2f\t N: %5d\t fraction missed: %1.3f\n', ...
                alpha, N, 1 - fraction);         
    end
    fprintf('\n');
end
fprintf('-----------------------------------------------------\n\n');
