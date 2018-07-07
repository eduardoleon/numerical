# Generate tableaux for various numerical methods

# Forward Euler
feuler.t = 1;
feuler.n = 1;
feuler.a = 0;
feuler.b = 1;
feuler.c = 0;
save -binary rk/feuler.mat feuler;

# Backward Euler
beuler.t = 2;
beuler.n = 1;
beuler.a = 1;
beuler.b = 1;
beuler.c = 1;
save -binary rk/beuler.mat beuler;

# Heun method
heun.t = 1;
heun.n = 2;
heun.a = [0 0; 1 0];
heun.b = [1 1] / 2;
heun.c = [0 1];
save -binary rk/heun.mat heun;

# Midpoint method
midpoint.t = 1;
midpoint.n = 2;
midpoint.a = [0 0; 1 0] / 2;
midpoint.b = [0 1];
midpoint.c = [0 1] / 2;
save -binary rk/midpoint.mat midpoint;

# Ralston method
ralston.t = 1;
ralston.n = 2;
ralston.a = [0 0; 2 0] / 3;
ralston.b = [1 3] / 4;
ralston.c = [0 2] / 3;
save -binary rk/ralston.mat ralston;

# Crank-Nicolson method
cranknic.t = 2;
cranknic.n = 2;
cranknic.a = [0 0; 1 1] / 2;
cranknic.b = [1 1] / 2;
cranknic.c = [0 1];
save -binary rk/cranknic.mat cranknic;

# RK3
rk3.t = 1;
rk3.n = 3;
rk3.a = [0 0 0; 1 0 0; -2 4 0] / 2;
rk3.b = [1 4 1] / 6;
rk3.c = [0 1 2] / 2;
save -binary rk/rk3.mat rk3;

# Classical RK4
rk4.t = 1;
rk4.n = 4;
rk4.a = [0 0 0 0;
         1 0 0 0;
         0 1 0 0;
         0 0 2 0] / 2;
rk4.b = [1 2 2 1] / 6;
rk4.c = [0 1 1 2] / 2;
save -binary rk/rk4.mat rk4;

# Kutta's 3/8 variant
kutta38.t = 1;
kutta38.n = 4;
kutta38.a = [ 0  0 0 0;
              1  0 0 0;
             -1  3 0 0;
              3 -3 3 0] / 3;
kutta38.b = [1 3 3 1] / 8;
kutta38.c = [0 1 2 3] / 3;
save -binary rk/kutta38.mat kutta38;

# Forward Euler
ab1.t = 1;
ab1.n = 1;
ab1.a = 1;
ab1.b = 1;
save -binary lms/ab1.mat ab1;

# AB2
ab2.t = 1;
ab2.n = 2;
ab2.a = [0 1];
ab2.b = [-1 3] / 2;
save -binary lms/ab2.mat ab2;

# AB3
ab3.t = 1;
ab3.n = 3;
ab3.a = [0 0 1];
ab3.b = [5 -16 23] / 12;
save -binary lms/ab3.mat ab3;

# AB4
ab4.t = 1;
ab4.n = 4;
ab4.a = [0 0 0 1];
ab4.b = [-9 37 -59 55] / 24;
save -binary lms/ab4.mat ab4;

# AB5
ab5.t = 1;
ab5.n = 5;
ab5.a = [0 0 0 0 1];
ab5.b = [251 -1274 2616 -2774 1901] / 720;
save -binary lms/ab5.mat ab5;

# Backward Euler
am1.t = 2;
am1.n = 1;
am1.a = 1;
am1.b = 0;
am1.c = 1;
save -binary lms/am1.mat am1;

# AM2
am2.t = 2;
am2.n = 1;
am2.a = 1;
am2.b = 1/2;
am2.c = 1/2;
save -binary lms/am2.mat am2;

# AM3
am3.t = 2;
am3.n = 2;
am3.a = [0 1];
am3.b = [-1 8] / 12;
am3.c = 5/12;
save -binary lms/am3.mat am3;

# AM4
am4.t = 2;
am4.n = 3;
am4.a = [0 0 1];
am4.b = [1 -5 19] / 24;
am4.c = 3/8;
save -binary lms/am4.mat am4;

# AM5
am5.t = 2;
am5.n = 4;
am5.a = [0 0 0 1];
am5.b = [-19 106 -264 646] / 720;
am5.c = 251/720;
save -binary lms/am5.mat am5;
