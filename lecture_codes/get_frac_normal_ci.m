function [fraction, mean_eps] = get_frac_normal_ci(N, alpha)

nreps = 10000;
A = zeros(nreps, 1);
B = zeros(nreps, 1);

if alpha==.05
    ep0 = 1.95996;
elseif alpha==.25
    ep0 = 1.15034;
else
    error('no value for this alpha');
end

mean_eps = 0;
% eps = sqrt((1 / (2 * N)) * log(2 / alpha));
for i=1:nreps
    X = sample_bernoulli(N, 0.5);
    X_bar = mean(X);
    sig = std(X);
%     sig = 1 / (N-1) * (norm(X - X_bar))^2;
    eps = sig * ep0 / sqrt(N);
    mean_eps = mean_eps / 10000;
    A(i) = X_bar - eps;
    B(i) = X_bar + eps;
end

fraction = sum((A <= 0.5) & (0.5 <= B)) / nreps;
