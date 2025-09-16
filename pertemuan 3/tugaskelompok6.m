% ======================================================
% Tugas Grafik 2D - Subplot
% Grafik Fungsi Matematika & Grafik Data Nyata
% ======================================================

% === Grafik 1: Fungsi Matematika (y = x dan y = 2x+3) ===
x = -10:1:10;
y1 = x;
y2 = 2*x + 3;

subplot(1,2,1);
plot(x, y1, 'r-', 'LineWidth', 2); hold on;
plot(x, y2, 'b-', 'LineWidth', 2); hold on;
grid on;
title('Grafik Fungsi Matematika');
xlabel('x');
ylabel('y');
legend('y = x', 'y = 2x+3');

% Data Nyata (Suhu Rata-rata Magetan 2024)
bulan = 1:12;
suhu_magetan = [25, 25, 25, 26, 26, 25, 25, 25, 26, 26, 26, 25];
% Sumber data: WeatherSpark (iklim rata-rata tahunan Magetan)

subplot(1,2,2);
plot(bulan, suhu_magetan, 'g-o', 'LineWidth', 2, 'MarkerSize', 6);
grid on;
title('Suhu Rata-rata Bulanan Magetan (2024)');
xlabel('Bulan');
ylabel('Suhu (°C)');
xticks(1:12);
xticklabels({'Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'});

