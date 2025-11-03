prediksi_cuaca = [30, 32, 29, 31];
aktual_cuaca = [31, 30, 29, 34];

errors_cuaca = abs(prediksi_cuaca - aktual_cuaca);

mae_cuaca = mean(errors_cuaca);

disp('Prediksi:');
disp(prediksi_cuaca);
disp('Aktual:');
disp(aktual_cuaca);
disp('Errors harian:');
disp(errors_cuaca);
fprintf('Mean Absolute Error (MAE): (1+2+0+3) / 4 = %.2f\n', mae_cuaca);
fprintf('Jadi, MAE dari model cuaca adalah %.2f C.\n\n', mae_cuaca);
