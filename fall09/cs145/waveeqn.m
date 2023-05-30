%wave equation model for a rope tied to the door

dt = .001;
dx = .1;

length = 2;
totalTime = 60;

numPieces = length/dx + 1;
numIterations = totalTime/dt;

h = zeros(1,numPieces);
v = zeros(1, numPieces);
t=0;

for i=1:numIterations
    dhdt = v;
    
    dvdt = .5 *secondderivative(h, dx, numPieces);
    
    %updates based on acceleration calculation
    t = t + dt;
    h = h + dhdt*dt;
    v = v + dvdt*dt;
    
    %add initial conditions - I'm shaking the rope
    if (t < 4*pi)
        h(1) = sin(t);
        v(1) = cos(t);
    else
        h(1) = 0;
        v(1) = 0;
    end
    
    %end of rope is tied to the door
    h(numPieces) = 0;
    v(numPieces) = 0;
   
    %make a pretty graph
    if (mod(i,10) ==0)
        figure(1)
        plot([0:dx:length], h)
        axis( [0 length -5 5] )
    end
end