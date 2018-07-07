pkg load io;
climate = xlsread('climate.xlsx');
lat = climate(:,1);
b = climate(:,2);
r = 1:5;

% Sinusoidal interpolation
T = max(lat) - min(lat);
w = 2*pi*lat/T;
A = zeros(13, 5);
A(:,1) = 1;
A(:,2) = cos(w);
A(:,3) = cos(w*2);
A(:,4) = cos(w*3);
A(:,5) = cos(w*4);

% Least squares, QR decomposition
[Q,R] = qr(A);
Q = Q(:,r);
R = R(r,:);
y = Q' * b;
x = R \ y
e = b - A*x
