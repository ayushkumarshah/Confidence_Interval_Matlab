function test_hoeffding_ci

Ns = [10 100 1000 10000];
alphas = [0.25 0.05];
fraction = zeros(length(alphas), length(Ns));
eps = zeros(length(alphas), length(Ns));

for i=1:length(alphas)
    alpha = alphas(i);
    for j=1:length(Ns)    
        N = Ns(j);
        [fraction(i, j), eps(i, j)] = get_frac_hoeffding_ci(N, alpha);       
        fprintf('alpha: %1.2f\t N: %5d\t epsilon: %1.3f\t fraction missed: %1.3f\n', ...
            alpha, N, eps(i, j), 1 - fraction(i, j));                            
    end
    fprintf('\n');
end
