x = 1:10;

y1 = gammaln(x);

y2 = log(gamma(x));

figure;
plot(x, y1, '-ob', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'gammaln(x)');
hold on;
plot(x, y2, '--sr', 'LineWidth', 1.5, 'MarkerSize', 6, 'DisplayName', 'log(gamma(x))');
hold off;

title('Perbandingan gammaln(x) vs log(gamma(x))');
xlabel('x');
ylabel('Nilai Log Gamma');
legend('Location', 'northwest');
grid on;

