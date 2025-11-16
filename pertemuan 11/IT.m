clear all; close all; clc;
x0 = 4;
ErrorToleransi = 1e-6;
ErrorRelatif = 1;
it = 0; Nmax=4;

while and(ErrorRelatif > ErrorToleransi, it < Nmax)
 it = it + 1;
 xnew = g(x0);
 ErrorRelatif = abs((xnew-x0)/xnew);
 x0 = xnew;
fprintf('%d %8.5f %8.8f \n ', it, x0, ErrorRelatif);  % octave
end
