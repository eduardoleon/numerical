A = zeros(20);
for m = 1:20
  for n = 1:20
    A(m,n) = m + n;
  end
end

x = zeros(20,1);
b = (1:20)';

I = eye(20);
[x,k] = iterative(I,I,A,x,b,1e-5,true);
