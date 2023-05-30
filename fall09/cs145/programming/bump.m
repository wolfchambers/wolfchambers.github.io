function [height] = bump(x)
  w = .3;
  h = .1;
  c = 1;
  x = x - c;
  if x < - w/2
    height = 0;
  elseif x > w/2
    height = 0;
  else
    height = h/2*cos(x*pi/w)+h/2;
  end