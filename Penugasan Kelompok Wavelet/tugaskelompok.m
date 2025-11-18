clear; clc; close all;

fs = 1000;              
T = 1;                  
t = linspace(0, T, fs*T); 
sinyal_asli = sin(2*pi*5*t) + 0.5*sin(2*pi*50*t);

rng(42); 
level_noise = 0.5;
noise = level_noise * randn(size(t));
sinyal_berisik = sinyal_asli + noise;


wname = 'sym8';  
level = 5;        


sinyal_hasil = wden(sinyal_berisik, 'rigrsure', 's', 'sln', level, wname);

error = sinyal_asli - sinyal_hasil;
rmse_val = sqrt(mean(error.^2));


snr_input = snr(sinyal_asli, sinyal_berisik - sinyal_asli);
snr_output = snr(sinyal_asli, sinyal_hasil - sinyal_asli);


fprintf('----------------------------------------\n');
fprintf('Hasil Evaluasi Denoising:\n');
fprintf('----------------------------------------\n');
fprintf('RMSE (Error)     : %.4f\n', rmse_val);
fprintf('SNR Input (dB)   : %.2f dB\n', snr_input);
fprintf('SNR Output (dB)  : %.2f dB\n', snr_output);
fprintf('Peningkatan SNR  : %.2f dB\n', snr_output - snr_input);
fprintf('----------------------------------------\n');


figure('Name', 'Denoising Sinyal 1D dengan DWT', 'Color', 'w');

subplot(3,1,1);
plot(t, sinyal_asli, 'b', 'LineWidth', 1.5);
title('1. Sinyal Asli (Clean Signal)');
grid on; ylabel('Amplitudo'); xlim([0 T]);

subplot(3,1,2);
plot(t, sinyal_berisik, 'color', [0.5 0.5 0.5]); 
title(['2. Sinyal Berisik (Noisy Signal) - SNR: ' num2str(snr_input, '%.2f') ' dB']);
grid on; ylabel('Amplitudo'); xlim([0 T]);

subplot(3,1,3);
plot(t, sinyal_hasil, 'r', 'LineWidth', 1.5);
title(['3. Hasil Denoising (Denoised Signal) - SNR: ' num2str(snr_output, '%.2f') ' dB']);
grid on; ylabel('Amplitudo'); xlabel('Waktu (detik)'); xlim([0 T]);

 figure;
 plot(t, sinyal_asli, 'b', t, sinyal_hasil, 'r--');
 title('Perbandingan Langsung: Asli vs Hasil');
 legend('Asli', 'Hasil Denoising'); xlim([0.4 0.6]); grid on;