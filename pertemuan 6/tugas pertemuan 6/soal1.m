[x,y] = meshgrid(-5:0.25:5, -5:0.25:5);
z = x.^2 - y.^2;

figure;
surf(x,y,z)
xlabel('X'); ylabel('Y'); zlabel('Z');
