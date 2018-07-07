x = (-10:10) / 10;
y = sin(2*pi*x);
t = (-175:175) / 100;

# Lagrange polynomial
lc = polyfit(x,y,20);
li = polyval(lc,t);

# Cubic spline
sc = spline(x,y);
si = ppval(sc,t);

hold off;
plot(x,y,'o');
hold on;
plot(t,li,'r');
plot(t,si,'b');
hold off;
