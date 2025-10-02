[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);
z = 20 * exp(-0.1 * (x.^2 + y.^2)) + 2 * rand(size(x));
surf(x, y, z);
shading interp;
title('Permukaan Gunung Berapi');
xlabel('X');
ylabel('Y');
zlabel('Z');
colormap('terrain');
