clear all; close all; clc;

x0 = 4;
ErrorToleransi = 1e-6;
ErrorRelatif = 1;
it = 0;
Nmax = 4;

iterasi_simpan = [];
x_simpan = [];
error_simpan = [];

iterasi_simpan = [iterasi_simpan, 0];
x_simpan = [x_simpan, x0];
error_simpan = [error_simpan, NaN];

fprintf('Iterasi |      x0      |  Error Relatif\n');
fprintf('---------------------------------------\n');

while and(ErrorRelatif > ErrorToleransi, it < Nmax)
    it = it + 1;
    xnew = g(x0);

    if xnew ~= 0
        ErrorRelatif = abs((xnew - x0) / xnew);
    else
        ErrorRelatif = abs(xnew - x0);
    end

    x0 = xnew;

    iterasi_simpan = [iterasi_simpan, it];
    x_simpan = [x_simpan, x0];
    error_simpan = [error_simpan, ErrorRelatif];

    fprintf('   %3d  |  %8.5f  |  %8.8f \n', it, x0, ErrorRelatif);
end

if it >= Nmax
    fprintf('\nPeringatan: Iterasi maksimum tercapai tanpa konvergensi penuh.\n');
else
    fprintf('\nKonvergensi tercapai pada iterasi ke-%d.\n', it);
end


figure(1);
plot(iterasi_simpan, x_simpan, '-bo', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
xlabel('Iterasi');
ylabel('Nilai x');
title('Plot 1: Konvergensi Nilai x per Iterasi');
grid on;

figure(2);
hold on;

range_min = min(x_simpan) - 1;
range_max = max(x_simpan) + 1;
x_plot = linspace(range_min, range_max, 100);
y_g_plot = arrayfun(@g, x_plot);

plot(x_plot, x_plot, 'k--', 'LineWidth', 1);
plot(x_plot, y_g_plot, 'b-', 'LineWidth', 1.5);

for k = 1:length(x_simpan)-1
    plot(x_simpan(k), x_simpan(k+1), 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'y');
end

xlabel('x (lama)');
ylabel('g(x) (x baru)');
title('Plot 2: Geometri Iterasi (y=x dan y=g(x))');
legend('y = x', 'y = g(x)', 'Jejak Iterasi');
grid on;
axis square;
hold off;
