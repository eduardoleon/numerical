pkg load io;
t = (1:10)' / 10;
s = 2*t*pi;
b = xlsread('blood.xlsx')';
r = 1:4;

% Sinusoidal interpolation
A = zeros(10, 5);
A(:,1) = 1;
A(:,2) = cos(s);
A(:,3) = cos(2*s);
A(:,4) = sin(s);
A(:,5) = sin(2*s);

% Least squares, Cholesky decomposition
R = chol(A' * A);
z = A' * b;
y = R' \ z;
x = R \ y
e = b - A*x
