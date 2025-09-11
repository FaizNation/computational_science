suhu = [30, 32, 29, 31, 33, 34, 32];
hari = 1:7;

plot(hari, suhu, '-o', 'LineWidth', 2, 'MarkerSize', 8, 'Color', 'r');

xlabel('Hari ke-');
ylabel('Suhu (°C)');

title('Data Suhu Selama 7 Hari');

grid on;
