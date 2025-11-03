prediksi_jual = [100, 10];
aktual_jual = [110, 20];

ape_values = abs(prediksi_jual - aktual_jual) ./ abs(aktual_jual);
mape = mean(ape_values);

disp('Prediksi:');
disp(prediksi_jual);
disp('Aktual:');
disp(aktual_jual);
disp('APE per produk:');
disp(ape_values);
fprintf('Mean Absolute Percentage Error (MAPE): (0.0909 + 0.5) / 2 = %.4f\n', mape);
fprintf('Jadi, MAPE penjualan kafe adalah %.2f%%.\n\n', mape * 100);
