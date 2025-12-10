clc; clear; close all;

load leleccum
s = leleccum(1:3920);
l_s = length(s);

[cA1,cD1] = dwt(s,"db1");

useIDWT = true;
if useIDWT
    A1 = idwt(cA1,[],"db1",l_s);
    D1 = idwt([],cD1,"db1",l_s);
else
    A1 = upcoef("a",cA1,"db1",1,l_s);
    D1 = upcoef("d",cD1,"db1",1,l_s);
end

tiledlayout(1,2)
nexttile
plot(A1)
title("Approximation A1")
nexttile
plot(D1)
title("Detail D1")

