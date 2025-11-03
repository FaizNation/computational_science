suhu_ideal = 180;
suhu_prediksi = 175;

absolute_error = abs(suhu_prediksi - suhu_ideal);

fprintf('Suhu Ideal (Aktual): %d C\n', suhu_ideal);
fprintf('Suhu Prediksi (Budi): %d C\n', suhu_prediksi);
fprintf('Absolute Error: |%d - %d| = %d\n', suhu_prediksi, suhu_ideal, absolute_error);
fprintf('Jadi, Absolute Error dari prediksi Budi adalah %d C.\n\n', absolute_error);
