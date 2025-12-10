clc; clear; close all;

load leleccum
s = leleccum(1:3920);
l_s = length(s);

[cA1,cD1] = dwt(s,"db1");

A0 = idwt(cA1,cD1,"db1",l_s);
err = max(abs(s-A0))

[C,L] = wavedec(s,3,"db1");

cA3 = appcoef(C,L,"db1",3);

extractTogether = true;
if extractTogether
    [cD1,cD2,cD3] = detcoef(C,L,[1,2,3]);
else
    cD3 = detcoef(C,L,3);
    cD2 = detcoef(C,L,2);
    cD1 = detcoef(C,L,1);
end

A3 = wrcoef("a",C,L,"db1",3);

D1 = wrcoef("d",C,L,"db1",1); 
D2 = wrcoef("d",C,L,"db1",2); 
D3 = wrcoef("d",C,L,"db1",3);

figure
tiledlayout(2,2)
nexttile
plot(A3)  
title("Approximation A3") 
nexttile
plot(D1)  
title("Detail D1") 
nexttile
plot(D2)  
title("Detail D2") 
nexttile
plot(D3) 
title("Detail D3")