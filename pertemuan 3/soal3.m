x = linspace(-2, 6, 500);

y = x.^2 - 4*x + 3;

plot(x, y, 'b-', 'LineWidth', 2);

title('Grafik Fungsi y = x^2 - 4x + 3');
xlabel('x');
ylabel('y');

grid on;
