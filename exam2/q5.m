load rk/cranknic.mat;   # Question 5

# Problem 8.18
A = [0 -6; 1 -5];
fun = @(t,x) x*A;

# Solution
for k = 1:5
  t = linspace(0,5,10*2^k+1)';
  x = 3*exp(-2*t) - 2*exp(-3*t);
  v = 6*exp(-3*t) - 6*exp(-2*t);
  u = rk(fun,cranknic,t,[1 0]);
  e(k) = max(abs(x - u(:,1)));
end

log(e(1:4) ./ e(2:5)) / log(2)
