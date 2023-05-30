function [d] = secondderivative(y, dx, n)
% function to compute second derivative estimate of y
% y is input vector of f(x) values
% dx is timestep
% n is length of y
% output d is the vector of second derivative estimates

d = zeros(1,n);
d(2:n-1) = (y(3:n) - 2*y(2:n-1) + y(1:n-2))/dx^2;
d(1) = d(2);
d(n) = d(n-1);