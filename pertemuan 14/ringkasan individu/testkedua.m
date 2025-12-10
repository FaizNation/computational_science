load porche
whos X map

image(X)
colormap(map)
colorbar

wv = 'bior3.7';
[cA1,cH1,cV1,cD1] = dwt2(X,wv);

sx = size(X);
A1 = idwt2(cA1,[],[],[],wv,sx);
H1 = idwt2([],cH1,[],[],wv,sx);
V1 = idwt2([],[],cV1,[],wv,sx);
D1 = idwt2([],[],[],cD1,wv,sx);

figure
tiledlayout(2,2)
nexttile
image(wcodemat(A1,192))
title('Approximation A1')
nexttile
image(wcodemat(H1,192))
title('Horizontal Detail H1')
nexttile
image(wcodemat(V1,192))
title('Vertical Detail V1')
nexttile
image(wcodemat(D1,192))
title('Diagonal Detail D1')
colormap(map)