[x,y] = meshgrid(0.5:0.5:5, 0.5:0.5:5);

z = arrayfun (@(a,b) beta(a,b),x,y);

surf(x,y,z)