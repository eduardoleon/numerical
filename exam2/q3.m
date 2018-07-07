load rk/heun.mat;       # Question 3

# Problem 8.19
pred = @(x) -x(1) + x(1)*x(2);
prey = @(x)  x(2) - x(1)*x(2);
fun = @(t,x) [pred(x) prey(x)];

# Numerical solution
n = 5001;
t = linspace(0,50,n)';
x = rk(fun,heun,t,[0.3 2]);

close all
graphics_toolkit("gnuplot")
hold on
plot(t,x(:,1))
plot(t,x(:,2))
legend("Sharks", "Turtles")
hold off
