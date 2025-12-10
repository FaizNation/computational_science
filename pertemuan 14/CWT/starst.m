img = imread("batik_magetan.png");
imagesc(img)

cwtScales = 4;
targetAngles = [0, pi/2];

cwtMarr = cwtft2(img, 'wavelet', 'marr', 'scales', cwtScales);
cwtCauchy = cwtft2(img, 'wavelet', 'cauchy', 'scales', cwtScales, 'angles', targetAngles);

tiledlayout(1,3);

nexttile
imagesc(abs(cwtMarr.cfs(:,:,1))) 
title("Marr (Bentuk Fisik Utuh)")
axis image off; colormap gray;

nexttile
imagesc(abs(cwtCauchy.cfs(:,:,1,1,1))) 
title("Cauchy 0 rad (Benang Tegak)")
axis image off; 

nexttile
imagesc(abs(cwtCauchy.cfs(:,:,1,1,2))) 
title("Cauchy \pi/2 rad (Benang Mendatar)")
axis image off;