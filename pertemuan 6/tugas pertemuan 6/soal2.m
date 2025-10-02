t = linspace(0,20*pi,1000);
x = cos(t);
y = sin(t);
z = -t;

figure;
plot3(x,y,z,'r','LineWidth',2)
grid on
xlabel('X'); ylabel('Y'); zlabel('Z');
