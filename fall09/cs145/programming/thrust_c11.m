function [thrust] = thrust_c11(t)

  if t < .3
    thrust = 22/.3*t;
  elseif t < .4
    thrust = 22-10/.1*(t-.3);
  elseif t < .7
    thrust = 12-2/.3*(t-.4);
  elseif t < .8
    thrust = 10-10/.1*(t-.7);
  else
    thrust = 0;
  end
