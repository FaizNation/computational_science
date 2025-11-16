clc; clear; close all;

% Data
y = [50, 40, 5, 60, 55];
y_hat = [48, 42, 2, 65, 50];

% Hitung error dasar
e = y_hat - y;
ae = abs(e);
se = e.^2;

% 1. Mean Error (ME)
ME = mean(e);

% 2. Mean Absolute Error (MAE)
MAE = mean(ae);

% 3. Mean Squared Error (MSE)
MSE = mean(se);

% 4. Root Mean Squared Error (RMSE)
RMSE = sqrt(MSE);

% 5. Mean Absolute Percentage Error (MAPE)
MAPE = mean(ae ./ y) * 100;

% 6. R-squared (R²)
SS_res = sum((y - y_hat).^2);
SS_tot = sum((y - mean(y)).^2);
R2 = 1 - (SS_res / SS_tot);

% 7. Korelasi (r)
r = corr(y', y_hat');

% Tampilkan hasil
fprintf('=== METRIK PREDIKSI ===\n');
fprintf('1. ME   = %.2f\n', ME);
fprintf('2. MAE  = %.2f\n', MAE);
fprintf('3. MSE  = %.2f\n', MSE);
fprintf('4. RMSE = %.2f\n', RMSE);
fprintf('5. MAPE = %.2f%%\n', MAPE);
fprintf('6. R²   = %.4f\n', R2);
fprintf('7. r    = %.4f\n', r);

% ====== Plot 1: Scatter y vs y_hat ======
figure(1);
scatter(y, y_hat, 70, 'filled'); hold on;
plot([min(y), max(y)], [min(y), max(y)], 'r--', 'LineWidth', 1.5); % garis y=x
xlabel('Aktual (y)');
ylabel('Prediksi (ŷ)');
title('Scatter Plot Aktual vs Prediksi');
legend('Data', 'y = x');
grid on;

% ====== Plot 2: Absolute Error per Minggu ======
figure(2);
bar(ae, 'facecolor', [0.2 0.6 0.8]);
xlabel('Minggu ke-');
ylabel('Absolute Error');
title('Absolute Error (AE) per Minggu');
grid on;

