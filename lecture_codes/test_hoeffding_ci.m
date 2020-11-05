function test_hoeffding_ci

Ns = [10 100 1000];
alphas = [0.25 0.05];
fraction = zeros(length(alphas), length(Ns));
eps = zeros(length(alphas), length(Ns));

for i=1:length(alphas)
    alpha = alphas(i);
    for j=1:length(Ns)    
        N = Ns(j);
        [fraction(i, j), eps(i, j)] = get_frac_hoeffding_ci(N, alpha);       
        fprintf('alpha: %1.3f\t N: %5d\t epsilon: %1.3f\t fraction: %1.3f\n', ...
            alpha, N, eps(i, j), fraction(i, j));                            
    end
    fprintf('\n');
end
