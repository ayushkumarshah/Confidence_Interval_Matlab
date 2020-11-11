function X_bar = sample_mean_uniform(N,a,b)
X_bar = zeros(1, N);
for i=1:N
    X = sample_uniform(N, a, b);
    X_bar(i) = mean(X);
end
