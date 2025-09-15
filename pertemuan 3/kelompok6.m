x = 0:0.1:2*pi;
y1 = sin(x);
y2 = cos(x);

bulan = 1:12;
suhu = [26, 27, 28, 29, 30, 30, 29, 29, 28, 27, 27, 26];

subplot(1,2,1);
plot(x, y1, 'r-', 'LineWidth', 2); hold on;
plot(x, y2, 'b--', 'LineWidth', 2);
grid on;
title('Grafik Fungsi Matematika: sin(x) dan cos(x)');
xlabel('x (radian)');
ylabel('y');
legend('sin(x)', 'cos(x)');

subplot(1,2,2);
plot(bulan, suhu, 'g-o', 'LineWidth', 2, 'MarkerSize', 6);
grid on;
title('Suhu Rata-rata Bulanan (°C)');
xlabel('Bulan');
ylabel('Suhu (°C)');
xticks(1:12);
xticklabels({'Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'});