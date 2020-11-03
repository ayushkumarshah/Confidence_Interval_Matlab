function [mu, V, H] = averaging_variables(N, a, b)
% [mu, V, H] = averaging_variables(10, -sqrt(3), sqrt(3))

nreps = 100000;
Y = zeros(nreps, 1);
% N = 10000;
for i=1:nreps
    X = sample_uniform(N, a, b);
    Y(i) = 1 / sqrt(N) * sum(X);
end

mu = mean(Y);
V = var(Y);
H = estimate_entropy(Y);

fprintf('\ntrue mean = %0.0f\t', (a+b) /2);
fprintf('true variance = %0.0f\n', (b-a)^2 /12);
fprintf('estimated mean = %f\t', mu);
fprintf('estimated variance = %f\t', V);
fprintf('estimated entropy= %f\n', H);