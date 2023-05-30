function [thrust] = thrust_c6(t)

  if t < .2
    thrust = 14/.2*t;
  elseif t < .3
    thrust = 14-9.5/.1*(t-.2);
  elseif t < 1.8
    thrust = 4.5-.5/1.5*(t-.3);
  elseif t < 1.85
    thrust = 4-4/.05*(t-1.8);
  else
    thrust = 0;
  end
