%% PROYEK 1D: ANALISIS SINYAL & TIME SERIES (WAVELET)
%  Topik: Denoising Sinyal & Isolasi Tren pada Solar Power Plant
%  Metode: Perbandingan DWT (Discrete) dan CWT (Continuous)
%  Dataset: Plant 1 Generation Data (Single Inverter)

clc; clear; close all;

%% 1. DATA PREPARATION (LANGKAH KERJA)
disp('1. Memuat Data...');

% --- Load Data dengan Opsi yang Benar ---
% Deteksi opsi impor otomatis
opts = detectImportOptions('Plant_1_Generation_Data.csv');

% PERBAIKAN: Gunakan setvartype untuk mengubah tipe kolom DATE_TIME menjadi char/text
% Ini mencegah error saat membaca format tanggal yang tidak standar
opts = setvartype(opts, 'DATE_TIME', 'char'); 

% Baca tabel dengan opsi yang sudah diperbaiki
raw_data = readtable('Plant_1_Generation_Data.csv', opts);

% --- Preprocessing ---
% Ambil 1 Inverter Saja (Agar menjadi Sinyal 1D yang valid untuk analisis)
inv_list = unique(raw_data.SOURCE_KEY);
target_inv = inv_list{1}; 
data_inv = raw_data(strcmp(raw_data.SOURCE_KEY, target_inv), :);

% Konversi Tanggal (Format dd-mm-yyyy HH:MM)
% Kita coba konversi, jika format di CSV dd-MM-yyyy HH:mm
try
    data_inv.DATE_TIME = datetime(data_inv.DATE_TIME, 'InputFormat', 'dd-MM-yyyy HH:mm');
catch
    % Backup: biarkan MATLAB menebak formatnya jika error
    disp('Format tanggal spesifik gagal, mencoba format otomatis...');
    data_inv.DATE_TIME = datetime(data_inv.DATE_TIME); 
end

% Sortir data berdasarkan waktu (Penting untuk time series)
data_inv = sortrows(data_inv, 'DATE_TIME');

% Ambil Sinyal DC_POWER (Sinyal utama yang akan dianalisis)
signal = data_inv.DC_POWER;
t = data_inv.DATE_TIME;

% Info Laju Sampling (Untuk Laporan Poin 1)
% Data diambil tiap 15 menit = 900 detik

Fs = 1 / (15 * 60); 
disp(['   Laju Sampling (Fs): ', num2str(Fs), ' Hz (1 sampel/15 menit)']);
disp(['   Inverter ID: ', target_inv]);

%% 2. IMPLEMENTASI WAVELET (DWT vs CWT)
disp('2. Implementasi Wavelet...');

% --- SKENARIO A: DWT (Discrete Wavelet Transform) ---
% Tujuan: Denoising & Isolasi Tren (Membuang noise frekuensi tinggi)
wname = 'sym4';  % Mother Wavelet: Symlet 4
level = 3;       % Level Dekomposisi

% Melakukan Denoising (Soft Thresholding)
% wden melakukan: Decompose -> Thresholding -> Reconstruct
[signal_denoised, ~] = wden(signal, 'heursure', 's', 'mln', level, wname);

% --- SKENARIO B: CWT (Continuous Wavelet Transform) ---
% Tujuan: Analisis Visual (Deteksi di mana anomali terjadi)
[cfs, f_cwt] = cwt(signal, 'bump', Fs); 

%% 3. KUANTIFIKASI & METRIK (TEMUAN LAPORAN)
disp('3. Menghitung Metrik Error...');

% Hitung RMSE (Root Mean Square Error)
rmse_val = sqrt(mean((signal - signal_denoised).^2));

% Hitung PSNR (Peak Signal-to-Noise Ratio)
peak_val = max(signal);
mse_val = mean((signal - signal_denoised).^2);
if mse_val == 0
    psnr_val = Inf;
else
    psnr_val = 10 * log10(peak_val^2 / mse_val);
end

% Tampilkan di Command Window untuk dicatat di Laporan
disp('-------------------------------------------------');
disp('   HASIL ANALISIS KUANTITATIF (Catat ini):');
disp(['   RMSE (Root Mean Square Error) : ', num2str(rmse_val)]);
disp(['   PSNR (Peak Signal-to-Noise)   : ', num2str(psnr_val), ' dB']);
disp('-------------------------------------------------');

%% 4. VISUALISASI (UNTUK LAMPIRAN LAPORAN)

% --- Plot 1: DWT Results (Sinyal Asli vs Tren) ---
figure('Name', 'Analisis DWT - Denoising & Tren', 'Color', 'w');
subplot(2,1,1);
plot(t, signal, 'b', 'LineWidth', 0.5);
title(['Sinyal Asli (DC Power) - Inverter: ', target_inv], 'Interpreter', 'none');
ylabel('Power (kW)'); grid on;
legend('Original Signal (Noisy)');
xlim([t(1) t(end)]);

subplot(2,1,2);
plot(t, signal, 'Color', [0.8 0.8 0.8]); hold on; % Sinyal asli abu-abu tipis
plot(t, signal_denoised, 'r', 'LineWidth', 1.5); % Hasil DWT tebal merah
title(['Hasil Denoising (DWT Level 3 - sym4) | RMSE: ', num2str(rmse_val, 4)]);
ylabel('Power (kW)'); xlabel('Waktu'); grid on;
legend('Original', 'Denoised Signal (Trend)');
xlim([t(1) t(end)]);

% --- Plot 2: CWT Scalogram (Visualisasi Time-Frequency) ---
figure('Name', 'Analisis CWT - Deteksi Anomali', 'Color', 'w');
% Menggunakan surface plot
h = pcolor(datenum(t), f_cwt, abs(cfs));
set(h, 'EdgeColor', 'none'); 
shading interp;
colormap('jet'); 
colorbar;

% Format Axis
datetick('x', 'dd-mm', 'keeplimits');
set(gca, 'YScale', 'log'); % Skala logaritmik untuk frekuensi
title('Scalogram CWT (Analisis Time-Frequency)');
ylabel('Frekuensi (Hz)');
xlabel('Waktu (Tanggal)');

disp('Selesai. Silakan cek grafik yang muncul.');