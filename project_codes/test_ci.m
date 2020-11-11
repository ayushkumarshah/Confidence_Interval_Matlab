function test_ci(functions)
% Calculates fraction missed for a given function
% Eg call: test_ci(1:10) - Test for all 10 functions
% Arguments:
% functions: list of functions (any integer from 0 to 10) to be tested

Ns = [1 10 100 1000 10000];
alphas = [0.5 0.25 0.05];

nrepeats = 10000;
A = zeros(nrepeats, 1);
B = zeros(nrepeats, 1);

for func=functions
    fprintf('Function %d:\n\n', func);
    for alpha = alphas
        for N = Ns
            for repeat = 1:nrepeats
                X = sample_bernoulli(N, 0.5);
                [A(repeat), B(repeat)] = ci(X, func);
            end
            fraction = sum((A <= 0.5) & (0.5 <= B)) / nrepeats;
            fprintf('alpha: %1.2f\t N: %5d\t fraction missed: %1.3f\n', ...
                    alpha, N, 1 - fraction);         
        end
        fprintf('\n');
    end
    fprintf('----------------------------\n');
end