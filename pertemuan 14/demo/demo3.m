%% DEMO 3: PRAKTIK WAVELET 1D (MULTI-LEVEL DECOMPOSITION)
%  Tujuan: Membedah sinyal listrik menjadi Tren (Aproksimasi) dan Noise (Detail)
clc; clear; close all;

% --- 1. MEMUAT DATA CONTOH MATHWORKS ---
% 'leleccum' adalah data sinyal konsumsi listrik
load leleccum;
s = leleccum(1:3000); % Ambil 3000 sampel pertama biar plot tidak terlalu padat

% --- 2. PARAMETER WAVELET ---
wname = 'db3';  % Jenis Wavelet: Daubechies 3 (Lebih halus dari Haar)
level = 3;      % Kedalaman analisis: Pecah 3 kali

% --- 3. PROSES DEKOMPOSISI (Inti Algoritma) ---
% [c, l] adalah struktur data khusus Wavelet di MATLAB
% c = semua koefisien digabung jadi satu baris
% l = info panjang masing-masing level
[c, l] = wavedec(s, level, wname);

% --- 4. EKSTRAKSI KOEFISIEN (Mengambil data dari [c, l]) ---
% Mengambil Aproksimasi Level 3 (Bentuk Global/Tren)
a3 = appcoef(c, l, wname, 3);

% Mengambil Detail Level 1, 2, 3 (Noise/Fluktuasi)
[d1, d2, d3] = detcoef(c, l, [1, 2, 3]);

% --- 5. VISUALISASI HASIL (MULTI-RESOLUTION ANALYSIS) ---
figure('Name', 'Analisis Wavelet 1D Sinyal Listrik', 'Color', 'w');

% Plot Sinyal Asli
subplot(5,1,1);
plot(s, 'k');
title(['Sinyal Asli (Konsumsi Listrik) - ', num2str(length(s)), ' Data']);
axis tight; grid on;

% Plot Aproksimasi (Level 3)
subplot(5,1,2);
plot(a3, 'r', 'LineWidth', 1.5);
title('Aproksimasi Level 3 (Tren Utama / Gambaran Kasar)');
ylabel('Amplitudo'); axis tight; grid on;

% Plot Detail (Level 3)
subplot(5,1,3);
plot(d3, 'b');
title('Detail Level 3 (Fluktuasi Menengah)');
axis tight; grid on;

% Plot Detail (Level 2)
subplot(5,1,4);
plot(d2, 'b');
title('Detail Level 2 (Fluktuasi Cepat)');
axis tight; grid on;

% Plot Detail (Level 1)
subplot(5,1,5);
plot(d1, 'g');
title('Detail Level 1 (Frekuensi Tertinggi / Noise)');
xlabel('Indeks Sampel (Perhatikan jumlah data berkurang karena Downsampling)');
axis tight; grid on;

% --- PESAN KONSEP ---
% Perhatikan sumbu X pada plot Detail Level 1, 2, 3.
% Level 1 datanya ~1500, Level 2 ~750, Level 3 ~375.
% Ini membuktikan adanya proses DOWNSAMPLING.
