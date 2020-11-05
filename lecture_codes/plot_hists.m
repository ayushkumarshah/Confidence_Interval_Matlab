function plot_hists

NS = 1:1:10;
H = zeros(1, length(NS));

for i=1:length(NS)
    N = NS(i);
    [~, ~, H(i), Y] = averaging_variables(N, -sqrt(3), sqrt(3));
    figure;
    histogram(Y);
end
