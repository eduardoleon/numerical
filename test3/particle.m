A = zeros(10);
A(1,1) = A(10,10) = 1;
for k = 2:9
  A(k,k-1) =  3;
  A(k,k  ) = -4;
  A(k,k+1) =  1;
end

x = b = zeros(10,1);
b(1) = 1;

PJ = diag(diag(A));
PG = tril(A);

BJ = PJ \ (PJ - A);
BG = PG \ (PG - A);

rJ = max(abs(eig(BJ)));
rG = max(abs(eig(BG)));

t = 1e-12;
mJ = log(t) / log(rJ);
mG = log(t) / log(rG);

I = eye(10);
[xJ,kJ] = iterative(PJ,I,A,x,b,t,false);
[xG,kG] = iterative(PG,I,A,x,b,t,false);
