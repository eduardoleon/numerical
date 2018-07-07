r = zeros(3,20);
for k = 0:19
  e = 10^-k / 3;
  A = [2 -2 0; e-2 2 0; 0 -1 3];
  x = [log(5/2); 1; 1];
  b = A * x;
  r(:,k+1) = abs(A \ b - x) ./ x;
end
