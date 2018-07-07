# Runge-Kutta methods
function x = rk(fun,tab,t,x)
  switch tab.t
    case 1
      x = rkexp(fun,tab,t,x);
    case 2
      x = rkimp(fun,tab,t,x);
  end
end

# Explicit methods
function x = rkexp(fun,tab,t,x)
  m = length(t);
  n = length(x);
  z = zeros(tab.n,n);
  for i = 2:m
    ti = t(i-1);
    xi = x(i-1,:);
    dt = t(i) - ti;
    dx = rkdif(fun,tab,ti,xi,dt,z);
    x(i,:) = xi + tab.b*dx;
  end
end

# Sequential differential
function dx = rkdif(fun,tab,t,x,dt,dx)
  for i = 1:tab.n
    dx(i,:) = fun(t + tab.c(i)*dt, x + tab.a(i,:)*dx)*dt;
  end
end

# Implicit methods
function x = rkimp(fun,tab,t,x)
  m = length(t);
  n = length(x);
  z = zeros(tab.n,n);
  for i = 2:m
    ti = t(i-1);
    xi = x(i-1,:);
    dt = t(i) - ti;
    dx = fsolve(@(dx) dx - rkder(fun,tab,ti,xi,dt,dx)*dt, z);
    x(i,:) = xi + tab.b*dx;
  end
end

# Parallel derivative
function v = rkder(fun,tab,t,x,dt,dx)
  for i = 1:tab.n
    v(i,:) = fun(t + tab.c(i)*dt, x + tab.a(i,:)*dx);
  end
end
