W = 2;
L=3;
dx = .1;
dy = .1;
dt = .001;
c = 1;
freq = 1;
maxTime = 30;

[x,y] = meshgrid(0:dx:L, 0:dy:W);
n = W/dy+1;
m = L/dx + 1;
rx = c*dt/dx;
ry = c*dt/dy;

current = sin(pi/L*x).*sin(2*pi/W*y);
past = current;

for t=0:dt:maxTime
    for i =2:n-1
        for j = 2:m-1
            future(i,j) = rx^2*(current(i-1,j)-2*current(i,j)+current(i+1,j)) + ry^2*(current(i,j-1)-2*current(i,j)+current(i,j+1)) + 2*current(i,j) - past(i,j);
        end
    end
    
    %set boundary of trampoline to 0
    for i = 1:n
        future(i,1) = 0;
        future(i,m) = 0;
    end
    
    for j = 1:m
        future(1,j) = 0;
        future(n,j) = 0;
    end
    
    past = current;
    current = future;
    
    if mod(t/dt,100) == 0
        figure(1)
        surf(x,y,current)
        shading('interp')
        axis([0 L 0 W -2 2])
        pause(.01)
    end
end