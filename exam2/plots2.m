load rk/heun.mat;

# Problem 8.18
A = [0 -6; 1 -5];
fun = @(t,x) x*A;

# Solution
t = linspace(0,5,50)';
x = 3*exp(-2*t) - 2*exp(-3*t);
v = 6*exp(-3*t) - 6*exp(-2*t);
u = rk(fun,heun,t,[1 0]);

close all
hold on
plot(t, u(:,1))
plot(t, x, 'o')
