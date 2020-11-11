function test_ci(functions)
% Calculates fraction missed for a given function
% Eg call: test_ci(1:10) - Test for all 10 functions
% Arguments:
% functions: list of functions (any integer from 0 to 10) to be tested

Ns = [10 100 1000 10000];
alphas = [0.25 0.1 0.05 0.01];

nrepeats = 10000;

% Bernoulli distribution as input
mean = 0.5;
test_ci_bernoulli(functions, Ns, alphas, nrepeats, mean);

% Uniform distribution as input
a = 0;
b = 1;
test_ci_uniform(functions, Ns, alphas, nrepeats, a, b);

% Normal distribution as input
% mean_normal = 0;
% sigma_normal = 1;
% test_ci_normal_01(functions, Ns, alphas, nrepeats, mean_normal, sigma_normal);