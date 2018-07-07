load rk/feuler.mat;     # Example 8.1
load rk/beuler.mat;     # Example 8.1
load rk/cranknic.mat;   # Example 8.2
load rk/heun.mat;       # Problem 8.17

fun = @(t,x) cos(2*x);
sol = @(t) asin(1 - 2 ./ (1 + exp(4*t))) / 2;
tab = heun;

for k = 1:10
  t = linspace(0,1,2^k + 1)';
  x = sol(t);
  u = rk(fun,tab,t,0);
  e(k) = max(abs(x - u));
end

log(e(1:9) ./ e(2:10)) / log(2)
