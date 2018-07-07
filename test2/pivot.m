A = [15 6 8 11; 6 6 5 3; 8 5 7 6; 11 3 6 9];
C = eye(4);
x = b = [1; 1; 1; 1];
e = zeros(4,3);
for k = 1:3
  b = A * b;
  C = A * C;
  [L,U] = lu(C);
  y = L \ b;
  z = U \ y;
  e(:,k) = x - z;
end
