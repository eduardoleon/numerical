n = 100;
I = eye(n);
B = diag(ones(n-1,1), 1);
C = diag(ones(n-2,1), 2);
D = B + C;
A = 4*I - D - D';
x = zeros(n,1);
b = A*ones(n,1);

J = diag(diag(A));
G = tril(A);
P = 2*I - B - B';
l = eig(P);
[L,U] = lu(P);
[xJa,kJa] = iterative(J,I,A,x,b,1e-5,false);
[xGS,kGS] = iterative(G,I,A,x,b,1e-5,false);
[xGN,kGN] = iterative(I,I,A,x,b,1e-5,true);
[xGP,kGP] = iterative(L,U,A,x,b,1e-5,true);
