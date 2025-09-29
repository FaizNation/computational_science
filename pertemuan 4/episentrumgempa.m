hold on; 

xq = randi([-4, 4], 200, 1);
yq = randi([-4, 4], 200, 1);
zq = -10 - 2 * rand(200, 1);
scatter3(xq, yq, zq, 20, 'r', 'filled');
