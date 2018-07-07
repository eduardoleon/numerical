load rk/feuler.mat;     # Problem 8.1
load rk/beuler.mat;     # Problem 8.1
load rk/cranknic.mat;   # Problem 8.4
load rk/heun.mat;       # Problem 8.7
load rk/rk3.mat;        # Problem 8.12

fun = @(t,x) sin(t) + x;
sol = @(t) (exp(t) - sin(t) - cos(t)) / 2;
tab = rk3;

for k = 1:10
  t = linspace(0,1,2^k+1)';
  x = sol(t);
  u = rk(fun,tab,t,0);
  e(k) = max(abs(x - u));
end

log(e(1:9) ./ e(2:10)) / log(2)
