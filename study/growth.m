ns = 1:500;
ts = 1:500;
for n = ns
  tic;
  det(magic(n));
  ts(n) = toc;
end
plot(ns,ts);
