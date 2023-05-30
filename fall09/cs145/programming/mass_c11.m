function [mass] = mass_c11(t)

  if t <= 0
    mass = 30.4;
  elseif t >= .8
    mass = 18.9;
  else
    times = [0:.001:t];
    thrust = 8.8;
    for time = 1:round(t/.001)+1;
      thrust = thrust - .001*thrust_c11(times(time));
    end
    mass = 18.9 + (30.4-18.9)*thrust/8.8;
  end

  mass = mass/1000;