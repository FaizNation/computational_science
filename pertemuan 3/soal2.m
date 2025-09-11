tahun = 2015:2020;
populasi = [120, 135, 150, 170, 200, 230]; 

plot(tahun, populasi, '-o', 'LineWidth', 2, 'MarkerSize', 8, 'Color', 'b');

title('Pertumbuhan Populasi Kota Tahun (2015–2020)');
xlabel('Tahun');
ylabel('Populasi (ribu orang)');

grid on;
