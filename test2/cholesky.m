A = zeros(15);
A(1,1) = 1/4;
A(2,2) = 1/2;
A(3,3) = 1/2;
for k = 4:7
  A(k,k) = 1;
end
for k = 8:15
  A(k,k) = 2;
end

p = [0 1 1 2 2 2 2 4 4 4 4 4 4 4 4];

for k = 2:15
  j = floor(k/2);
  floor(k);
  A(j,k) = -p(k)/10;
  A(k,j) = -p(k)/10;
end

R = chol(A);
b = zeros(15,1);
b(1) = 5/2;
y = R' \ b;
x = R \ y
