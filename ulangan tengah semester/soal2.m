pengunjung = [120, 130, 145, 160, 180, 210, 190, 170, 160, 150];
hari = 1:length(pengunjung);

figure;
plot(hari, pengunjung, 'o-b', 'LineWidth', 1.5, 'MarkerSize', 8, 'MarkerFaceColor', 'r');
hold on;

p = polyfit(hari, pengunjung, 1);
y_tren = polyval(p, hari);

plot(hari, y_tren, '--k', 'LineWidth', 2);

title('Jumlah Pengunjung Website Selama 10 Hari');
xlabel('Hari ke-');
ylabel('Jumlah Pengunjung');
legend('Data Pengunjung', 'Garis Tren Linear', 'Location', 'northwest');
grid on;
hold off;

