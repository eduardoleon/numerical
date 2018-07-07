function [x,k] = iterative(L,U,A,x,b,t,d)
  r = b - A*x;
  e = 1;
  n = norm(r);
  k = 0;
  while e > t
    z = L \ r;
    z = U \ z;
    if d
      y = z';
      w = y*r / (y*A*z);
      x = x + w*z;
    else
      x = x + z;
    end
    r = b - A*x;
    e = norm(r) / n;
    k = k + 1;
  end
end
