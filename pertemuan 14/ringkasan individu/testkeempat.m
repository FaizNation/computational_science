load porche
whos X map

image(X)
colormap(map)
colorbar

[thr,sorh,keepapp] = ddencmp('cmp','wv',X);
[Xcomp,CXC,LXC,PERF0,PERFL2] = ... 
wdencmp('gbl',c,s,wv,2,thr,sorh,keepapp);

fprintf('Percentage of wavelet coefficients set to zero: %.4f\n',PERF0);
fprintf('Percentage of energy preserved: %.4f\n',PERFL2);

figure
tiledlayout(1,2)
nexttile
image(X)
title('Original Image') 
axis square
nexttile
image(Xcomp)
title('Compressed Image') 
axis square
colormap(map)