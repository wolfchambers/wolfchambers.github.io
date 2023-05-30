% Apophis (2004 MN 4) data:  270 m across, 2.7e10 kg

load apophis_daily.xyz
load earth_daily.xyz

time_daily = earth_daily(:,1);

plot(earth_daily(:,2), earth_daily(:,3), 'b', apophis_daily(:,2), apophis_daily(:,3), 'r')
title('Earth vs Apophis: xy plane')
xlabel('x coordinate (km)')
ylabel('y coordinate (km)')
legend('Earth','Apophis')

figure
plot(earth_daily(:,2), earth_daily(:,4), 'b', apophis_daily(:,2), apophis_daily(:,4), 'r')
title('Earth vs Apophis: xz plane')
xlabel('x coordinate (km)')
ylabel('z coordinate (km)')
legend('Earth','Apophis')

figure
plot(earth_daily(:,3), earth_daily(:,4), 'b', apophis_daily(:,3), apophis_daily(:,4), 'r')
title('Earth vs Apophis: yz plane')
xlabel('y coordinate (km)')
ylabel('z coordinate (km)')
legend('Earth','Apophis')

% Orbits cross how far apart are they?
dist_daily = sqrt( (earth_daily(:,2)-apophis_daily(:,2)).^2 + (earth_daily(:,3)-apophis_daily(:,3)).^2 + (earth_daily(:,4)-apophis_daily(:,4)).^2 );

figure
plot(time_daily, dist_daily)
title('Distance between Earth and Apophis')
xlabel('Years after 1900')
ylabel('Distance (km)')

% Closest when t about 129 (2029)
% Zoom in and use hourly data for 2029 and repeat

load apophis_hourly.xyz
load earth_hourly.xyz

time_hourly = earth_hourly(:,1);

figure(1)
plot(earth_hourly(:,2), earth_hourly(:,3), 'b', apophis_hourly(:,2), apophis_hourly(:,3), 'r')
title('Earth vs Apophis: xy plane')
xlabel('x coordinate (km)')
ylabel('y coordinate (km)')
legend('Earth','Apophis')

figure(2)
plot(earth_hourly(:,2), earth_hourly(:,4), 'b', apophis_hourly(:,2), apophis_hourly(:,4), 'r')
title('Earth vs Apophis: xz plane')
xlabel('x coordinate (km)')
ylabel('z coordinate (km)')
legend('Earth','Apophis')

figure(3)
plot(earth_hourly(:,3), earth_hourly(:,4), 'b', apophis_hourly(:,3), apophis_hourly(:,4), 'r')
title('Earth vs Apophis: yz plane')
xlabel('y coordinate (km)')
ylabel('z coordinate (km)')
legend('Earth','Apophis')


% Still doesn't look good.  About 102 days into year (April 13)
% Zoom in on that week.

load apophis_minutely.xyz
load earth_minutely.xyz
load moon_minutely.xyz

time_minutely = earth_minutely(:,1);

figure(1)
plot(earth_minutely(:,2), earth_minutely(:,3), 'b', apophis_minutely(:,2), apophis_minutely(:,3), 'r', moon_minutely(:,2), moon_minutely(:,3), 'k')
title('Earth vs Apophis: xy plane')
xlabel('x coordinate (km)')
ylabel('y coordinate (km)')
legend('Earth','Apophis')
legend('Earth','Apophis','Moon')

figure(2)
plot(earth_minutely(:,2), earth_minutely(:,4), 'b', apophis_minutely(:,2), apophis_minutely(:,4), 'r', moon_minutely(:,2), moon_minutely(:,4), 'k')
title('Earth vs Apophis: xz plane')
xlabel('x coordinate (km)')
ylabel('z coordinate (km)')
legend('Earth','Apophis','Moon')

figure(3)
plot(earth_minutely(:,3), earth_minutely(:,4), 'b', apophis_minutely(:,3), apophis_minutely(:,4), 'r', moon_minutely(:,3), moon_minutely(:,4), 'k')
title('Earth vs Apophis: yz plane')
xlabel('y coordinate (km)')
ylabel('z coordinate (km)')
legend('Earth','Apophis')
legend('Earth','Apophis','Moon')

% Orbits cross how far apart are they?
dist_minutely = sqrt( (earth_minutely(:,2)-apophis_minutely(:,2)).^2 + (earth_minutely(:,3)-apophis_minutely(:,3)).^2 + (earth_minutely(:,4)-apophis_minutely(:,4)).^2 );

figure(4)
plot(time_minutely, dist_minutely)
title('Distance between Earth and Apophis')
xlabel('Hours after Midnight 4/10/2029')
ylabel('Distance (km)')

% Look at various time snapshot starting at noon on April 13
% indicies 5040 to 5760 stepsize of 30 minutes
figure(1)
plot(earth_minutely(5040:30:5760,2), earth_minutely(5040:30:5760,3), 'ob', apophis_minutely(5040:30:5760,2), apophis_minutely(5040:30:5760,3), '*r', moon_minutely(5040:30:5760,2), moon_minutely(5040:30:5760,3), '+k')
title('Earth vs Apophis: xy plane')
xlabel('x coordinate (km)')
ylabel('y coordinate (km)')
legend('Earth','Apophis')
legend('Earth','Apophis','Moon')

figure(2)
plot(earth_minutely(5040:30:5760,2), earth_minutely(5040:30:5760,4), 'ob', apophis_minutely(5040:30:5760,2), apophis_minutely(5040:30:5760,4), '*r', moon_minutely(5040:30:5760,2), moon_minutely(5040:30:5760,4), '+k')
title('Earth vs Apophis: xz plane')
xlabel('x coordinate (km)')
ylabel('z coordinate (km)')
legend('Earth','Apophis','Moon')

figure(3)
plot(earth_minutely(5040:30:5760,3), earth_minutely(5040:30:5760,4), 'ob', apophis_minutely(5040:30:5760,3), apophis_minutely(5040:30:5760,4), '*r', moon_minutely(5040:30:5760,3), moon_minutely(5040:30:5760,4), '+k')
title('Earth vs Apophis: yz plane')
xlabel('y coordinate (km)')
ylabel('z coordinate (km)')
legend('Earth','Apophis')
legend('Earth','Apophis','Moon')

% Still looks pretty close in xy, but z axis cross at different time!


% How close?  Note Earth radius = 6,357 km, Geosync orbit = 48,521 km, Moon = 384,403 km
min(dist_minutely)
% Good we live, but inside geosync orbit (where Dish & DirectTV saltelites are.  Oh no!)

% If if hit how fast, look at average speed April 10-12
vel = abs((dist_minutely(2*24*60)-dist_minutely(1)) / (time_minutely(2*24*60)-time_minutely(1)))
% This is in km/hour

% Try m/sec
vel = abs((dist_minutely(2*24*60)-dist_minutely(1)) / (time_minutely(2*24*60)-time_minutely(1))) * 1000 / 60 / 60

% Energy in Joules (kg m^2/s^2)
m = 2.7e10
E = .5*m*vel^2

% How many megatons of TNT ( 1 MT = 4.184e15 J)
E / 4.184e15
% Largest nuclear explosing about 50 MT, Hiroshima bomb = about 20 kiloton

