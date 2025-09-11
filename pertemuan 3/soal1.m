x = linspace(0, 2*pi, 1000);

y_sin = sin(x);
y_cos = cos(x);

figure;

plot(x, y_sin, 'r--', 'LineWidth', 2);
hold on;

plot(x, y_cos, 'b-', 'LineWidth', 2);

title('Perbandingan Grafik y = sin(x) dan y = cos(x)');

xlabel('x');
ylabel('y');

legend('y = sin(x)', 'y = cos(x)');

grid on;

xlim([0, 2*pi]);
ylim([-1.2, 1.2]);
