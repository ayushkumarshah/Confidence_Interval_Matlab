function N = sample_normal_01(N,sig,mu)

N = randn(N,1)*sig + mu;
% Restrict in the range [0,1]
N = (N - min(N)) / (max(N) - min(N));