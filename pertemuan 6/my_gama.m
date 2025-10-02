x = 0.1:0.1:6;

y_gamma = gamma(x);

figure;
plot(x, y_gamma, 'LineWidth', 2, 'DisplayName', 'Fungsi Gamma');

xlabel('x');
ylabel('Gamma(x)');
hold on;

faktorial_x = 1:5;
faktorial_y = factorial(faktorial_x);

plot(faktorial_x, faktorial_y, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r', 'DisplayName', 'Faktorial');

grid on;
hold off;
