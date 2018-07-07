% Square root of 2
d = 1;
x = 10;
while abs(d) > 1e-10
  d = (x^2 - 2) / (2*x);
  x = x - d;
end
x

% Cubic root of 4
d = 1;
y = 10;
while abs(d) > 1e-10
  d = (y^3 - 4) / (3*y^2);
  y = y - d;
end
y
