pkg load io;
citrus = xlsread('citrus.xlsx')';
year = citrus(:,1);
year = year - min(year);
b = citrus(:,2);
r = 1:4;

% Polynomial interpolation
A = zeros(6, 4);
A(:,1) = 1;
A(:,2) = year;
A(:,3) = year .^ 2;
A(:,4) = year .^ 3;

% Least squares, SVD decomposition
[U,S,V] = svd(A);
U = U(:,r);
S = S(r,:);
z = U' * b;
y = S \ z;
x = V * y
e = b - A * x
