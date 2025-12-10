load porche
whos X map

image(X)
colormap(map)
colorbar

Xrec = idwt2(cA1,cH1,cV1,cD1,wv);
max(abs(X(:)-Xrec(:)))

[c,s] = wavedec2(X,2,wv);

cA2 = appcoef2(c,s,wv,2);
[cH2,cV2,cD2] = detcoef2('all',c,s,2);
[cH1,cV1,cD1] = detcoef2('all',c,s,1);

A2 = wrcoef2('a',c,s,wv,2);
H1 = wrcoef2('h',c,s,wv,1);
V1 = wrcoef2('v',c,s,wv,1);
D1 = wrcoef2('d',c,s,wv,1);
H2 = wrcoef2('h',c,s,wv,2);
V2 = wrcoef2('v',c,s,wv,2);
D2 = wrcoef2('d',c,s,wv,2);

figure
tiledlayout(2,4)
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
nexttile
image(wcodemat(A2,192))
title('Approximation A2')
nexttile
image(wcodemat(H2,192))
title('Horizontal Detail H2')
nexttile
image(wcodemat(V2,192))
title('Vertical Detail V2')
nexttile
image(wcodemat(D2,192))
title('Diagonal Detail D2')
colormap(map)