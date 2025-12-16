clc; clear; close all;

%% Ambil Gambar 
filename = 'Electrical (1).jpg';

try
    img_ori = imread(filename);
catch
    error('File gambar tidak ditemukan. Pastikan nama file benar!');
end

if size(img_ori, 3) == 3
    img_gray = rgb2gray(img_ori);
else
    img_gray = img_ori;
end

target_dim = [512 512]; 
img_gray = imresize(img_gray, target_dim);
X = double(img_gray); 

%% VISUALISASI SUBBAND LEVEL 1 (LL, LH, HL, HH)
wname = 'haar'; 
level_vis = 1;  

[cA1, cH1, cV1, cD1] = dwt2(X, wname);

figure('Name', 'Analisis Visual: Subband Level 1');
tiledlayout(2,2, 'TileSpacing', 'compact', 'Padding', 'compact');
colormap(gray); 

nexttile; image(wcodemat(cA1, 192)); 
title(['LL Approximation Level ' num2str(level_vis)]); axis off;

nexttile; image(wcodemat(cH1, 192)); 
title('LH Horizontal Detail'); axis off;

nexttile; image(wcodemat(cV1, 192)); 
title('HL Vertical Detail'); axis off;

nexttile; image(wcodemat(cD1, 192)); 
title('HH Diagonal Detail'); axis off;

%% Compressing
[c, s] = wavedec2(X, 2, wname); 

[thr, sorh, keepapp] = ddencmp('cmp', 'wv', X);
[Xcomp, CXC, LXC, PERF0, PERFL2] = wdencmp('gbl', c, s, wname, 2, thr, sorh, keepapp);

% Hitung PSNR
mse = mean((X(:) - Xcomp(:)).^2);
max_val = 255;
psnr_val = 10 * log10(max_val^2 / mse);

% Perbandingan Citra Asli vs Hasil
figure('Name', 'Hasil Kompresi & PSNR');
tiledlayout(1,2, 'TileSpacing', 'compact');
colormap(gray);

nexttile; imagesc(uint8(X)); 
title(['Orginal Image (' num2str(target_dim(1)) 'x' num2str(target_dim(2)) ')']); 
axis square; axis off;

nexttile; imagesc(uint8(Xcomp)); 
title('Hasil Compressi'); 
axis square; axis off;

%% Laporan
fprintf('\n==============================================\n');
fprintf('      LAPORAN UAS PROYEK 2D (WAVELET)      \n');
fprintf('==============================================\n');
fprintf('1. Parameter Data\n');
fprintf('   - Dimensi Matriks : %d x %d piksel\n', target_dim(1), target_dim(2));
fprintf('   - Mother Wavelet  : %s\n', wname);
fprintf('   - Level Visualisasi: %d\n', level_vis);
fprintf('\n2. Kuantifikasi Kompresi\n');
fprintf('   - Rasio Kompresi (Zeroed Coeffs): %.2f %%\n', PERF0);
fprintf('   - Energi Dipertahankan          : %.2f %%\n', PERFL2);
fprintf('   - Kualitas Citra (PSNR)         : %.2f dB\n', psnr_val);
fprintf('==============================================\n');