function [height] = road(x)
  w = .3;
  h = .1;
  height = h*cos(x*pi/w - pi) + h/2;