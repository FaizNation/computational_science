%% DEMO 1: MENGAPA FOURIER GAGAL? (Sinyal Chirp)
%  Tujuan: Menunjukkan kelemahan FFT pada sinyal non-stasioner
clc; clear; close all;

% --- 1. MEMBUAT SINYAL BUATAN (CHIRP) ---
fs = 1000;              % Frekuensi sampling (1000 data per detik)
t = 0:1/fs:2;           % Durasi 2 detik
% Sinyal 'Chirp': Suara yang nadanya naik terus (seperti burung)
% Dari 0 Hz (awal) menjadi 150 Hz (akhir)
x = chirp(t, 0, 2, 150, 'quadratic');

figure('Name', 'Perbandingan Fourier vs Wavelet', 'Color', 'w', 'Position', [100, 100, 800, 800]);

% --- 2. PLOT DOMAIN WAKTU ---
subplot(3,1,1);
plot(t, x);
title('1. Domain Waktu: Sinyal Chirp (Frekuensi berubah)');
xlabel('Waktu (detik)'); axis tight; grid on;

% --- 3. PLOT DOMAIN FREKUENSI (FFT BIASA) ---
L = length(x);
Y = fft(x);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
f = fs*(0:(L/2))/L;

subplot(3,1,2);
plot(f, P1, 'r');
title('2. Domain Frekuensi (FFT): Kita tahu ada frekuensi 0-150Hz, TAPI KAPAN TERJADINYA?');
subtitle('Informasi waktu HILANG total. Kita tidak tahu nada tinggi ada di detik ke berapa.');
xlabel('Frekuensi (Hz)'); grid on; xlim([0 200]);

% --- 4. PLOT TIME-FREQUENCY (WAVELET/STFT) ---
% Menggunakan Spectrogram atau CWT untuk melihat waktu & frekuensi
subplot(3,1,3);
% Catatan: pspectrum butuh Signal Processing Toolbox.
% Jika tidak ada, ganti dengan 'spectrogram(x,256,250,256,fs,'yaxis')'
spectrogram(x, 256, 250, 256, fs, 'yaxis');
title('3. Time-Frequency (Metode Wavelet/STFT): Solusinya!');
subtitle('Lihat garis diagonal kuning: Kita tahu frekuensi NAIK seiring WAKTU.');
colormap jet;
