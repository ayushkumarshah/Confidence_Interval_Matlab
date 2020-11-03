function test_entropy

NS = 1:1:10;

mu = zeros(1, length(NS));
V = zeros(1, length(NS));
H = zeros(1, length(NS));

for i=1:length(NS)
    N = NS(i);
    [mu(i), V(i), H(i)] = averaging_variables(N, -sqrt(3), sqrt(3));
end

% Figure size
set(gcf,'Position',[100 100 1500 500]);
sgtitle('Estimates using averaging variable');

subplot(1, 3, 1);
plot(NS, mu, 'LineWidth', 4);
title('Mean');
xlim([1 10]);
ylim([-1 1]);

subplot(1, 3, 2);
plot(NS, V, 'LineWidth', 4);
title('Variance');
xlim([1 10]);
ylim([0 2]);

subplot(1, 3, 3);
plot(NS, H, 'LineWidth', 4);
xlim([1 10]);
title('Entropy');
