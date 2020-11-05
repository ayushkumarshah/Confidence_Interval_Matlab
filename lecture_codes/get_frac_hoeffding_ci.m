function [fraction, eps] = get_frac_hoeffding_ci(N, alpha)

nreps = 10000;
A = zeros(nreps, 1);
B = zeros(nreps, 1);
eps = sqrt((1 / (2 * N)) * log(2 / alpha));
for i=1:nreps
    X = sample_bernoulli(N, 0.5);
    X_bar = mean(X);
    A(i) = X_bar - eps;
    B(i) = X_bar + eps;    
end

fraction = sum((A <= 0.5) & (0.5 <= B)) / nreps;
