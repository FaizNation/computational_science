% LATIHAN SOAL 2 - Visualisasi Gunung Berapi Aktif

% 1. Permukaan Gunung
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);
z = 20 * exp(-0.1 * (x.^2 + y.^2)) + 2 * rand(size(x));

figure;
surf(x, y, z);
shading interp;
colormap('terrain');
hold on;
title('Visualisasi Gunung Berapi, Gempa Bumi, dan Aliran Lava');
xlabel('X');
ylabel('Y');
zlabel('Z');

% 2. Episentrum Gempa (200 titik di bawah permukaan)
xq = randi([-4, 4], 200, 1);
yq = randi([-4, 4], 200, 1);
zq = -10 - 2 * rand(200, 1);
scatter3(xq, yq, zq, 20, 'r', 'filled');

% 3. Jalur Aliran Lava
t = linspace(0.5, 5, 300);
xl = 5 * cos(t) ./ t;
yl = 5 * sin(t) ./ t;
zl = 20 - 5 * t;
plot3(xl, yl, zl, 'LineWidth', 2.5, 'Color', [1, 0.5, 0]); % Oranye

% Tampilan tambahan
legend({'Permukaan Gunung', 'Episentrum Gempa', 'Aliran Lava'}, 'Location', 'northeast');
grid on;
view(45, 30); % Sudut pandang 3D
