load rk/feuler.mat;     # Unacceptable
load rk/heun.mat;       # Acceptable for 3000 steps
load rk/rk3.mat;        # Acceptable for 2000 steps
load rk/rk4.mat;        # Acceptable for 800 steps

# Model parameters
w = 7.29e-5;            # Earth's angular velocity
p = pi/4;               # Latitude
g = 9.8;
l = 20;

# Problem 8.19
a = 2*w*sin(p);
b = 2*w*cos(p);
k = g/l;                # k^2, actually
A = [0 0 -k 0; 0 0 0 -k; 1 0 0 -b; 0 1 a 0];
fun = @(t,x) x*A;

# Numerical solution
t = linspace(0,300,800)';
s = [1 0 0 0];
u = rk(fun,rk4,t,s);

# Analytical solution
[P,D] = eig(A);
r = s*P;
n = length(t);
x = zeros(n, 4);
for j = 1:n
  x(j,:) = r * expm(t(j) * D) / P;
end

close all
hold on
plot(t, u(:,1))
plot(t, x(:,1), 'o')
