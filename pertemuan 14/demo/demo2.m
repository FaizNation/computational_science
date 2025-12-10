%% DEMO 2: VERIFIKASI HITUNGAN MANUAL HAAR
%  Tujuan: Membuktikan hitungan papan tulis valid di MATLAB
clc; clear;

disp('================================================');
disp('   STUDI KASUS: HITUNGAN MANUAL HAAR WAVELET    ');
disp('================================================');

% 1. DATA INPUT
S = [10, 14, 10, 12];
fprintf('Data Sinyal Asli: [%d, %d, %d, %d]\n\n', S);

% --- BAGIAN A: LOGIKA MANUSIA (Rata-rata & Selisih) ---
% Aproksimasi = (Ganjil + Genap) / 2
cA_manual = (S(1:2:end) + S(2:2:end)) / 2;
% Detail = (Ganjil - Genap) / 2
cD_manual = (S(1:2:end) - S(2:2:end)) / 2;

disp('--- 1. HASIL HITUNGAN TANGAN (Logika Rata-rata) ---');
fprintf('Aproksimasi (cA): [%d, %d]  <-- (10+14)/2 dan (10+12)/2\n', cA_manual);
fprintf('Detail (cD)     : [%d, %d]  <-- (10-14)/2 dan (10-12)/2\n\n', cD_manual);

% --- BAGIAN B: HASIL KOMPUTER (MATLAB dwt) ---
% MATLAB menggunakan faktor normalisasi akar(2) agar energi sinyal kekal
[cA_matlab, cD_matlab] = dwt(S, 'haar');

disp('--- 2. HASIL MATLAB (Fungsi dwt) ---');
fprintf('Aproksimasi (cA): [%.4f, %.4f]\n', cA_matlab);
fprintf('Detail (cD)     : [%.4f, %.4f]\n', cD_matlab);
disp('(Angkanya beda karena MATLAB mengalikan dengan akar 2)');
disp(' ');

% --- BAGIAN C: PEMBUKTIAN ---
disp('--- 3. PEMBUKTIAN HUBUNGAN ---');
faktor_skala = sqrt(2);
disp(['Faktor Normalisasi (akar 2): ', num2str(faktor_skala)]);

cA_bukti = cA_matlab / faktor_skala;
cD_bukti = cD_matlab / faktor_skala;

fprintf('Hasil MATLAB dibagi akar(2) -> cA: [%.0f, %.0f]\n', cA_bukti);
fprintf('Hasil MATLAB dibagi akar(2) -> cD: [%.0f, %.0f]\n', cD_bukti);
disp('KESIMPULAN: Hitungan manual kita BENAR secara logika bentuk!');
disp('================================================');
