function hoeffding_ci_test
Ns = [10 100 1000];
alphas = [.25 .05];
for alpha = alphas
    for N = Ns
        hits = 0;
        ep = sqrt(1/(2*N)*log(2/alpha));
        for nums = 1:10000
            X = sample_bernoulli(N, 0.5);
            Xbar = mean(X);
            if abs(Xbar-.5) <= ep
                hits = hits + 1;
            end
        end
        fprintf('alpha:  %1.3f N: %5d ep:  %1.3f frac missed:  %1.3f\n',alpha, N, ep, 1-hits/10000);
    end
end