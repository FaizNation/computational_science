t = linspace(0.5, 5, 300);
x = 5 * cos(t) ./ t;
y = 5 * sin(t) ./ t;
z = 20 - 5 * t;
plot3(x, y, z, 'LineWidth', 2, 'Color', 'orange');
legend('Permukaan Gunung', 'Episentrum Gempa', 'Aliran Lava');
