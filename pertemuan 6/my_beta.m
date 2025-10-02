[x, y] = meshgrid(0.1:0.2:8);

z = beta(x, y);

figure;
surf(x, y, z);

xlabel('Nilai x');
ylabel('Nilai y');
zlabel('B(x,y)');
