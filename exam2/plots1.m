load rk/cranknic.mat;
load rk/heun.mat;

# Model parameters
A = 6;          # m^2
e = 0.5;        # (adimensional)
s = 5.6e-8;     # J m^-2 s^-1 K^-4
m = 1;          # Kg
C = 100;        # J Kg^-1 K^-1
T0 = 180;       # K
Te = 200;       # K

Aes = A*e*s;
Te4 = Te^4;
mC = m*C;

# Problem 8.15
v = @(T) Aes*(T^4 - Te4);
fun = @(t,T) -v(T) / mC;
tab1 = cranknic;
tab2 = heun;

# Solution for h = 20
t1 = (0:20:200)';
u1 = rk(fun,tab1,t1,T0);
v1 = rk(fun,tab2,t1,T0);

# Solution for h = 10
t2 = (0:10:200)';
u2 = rk(fun,tab1,t2,T0);
v2 = rk(fun,tab2,t2,T0);

close all
hold on
plot(t1,u1)
plot(t1,v1)
legend("Crank-Nicolson", "Heun")
