# The function in the problem statement and its derivative
f = function(x) cosh(x) + cos(x) - 2
fp = function(x) sinh(x) - sin(x)

# Plot the function in the problem statement
jpeg("newton.jpg")
curve(f(x), -0.5, 0.5)
abline(h = 0, col = 'red')
dev.off()

# Use Newton's method to find the root
xs = 1
ys = f(1)
ds = ys / fp(1)
repeat {
    x = tail(xs, 1) - tail(ds, 1)
    y = f(x)
    d = y / fp(x)
    xs = append(xs, x)
    ys = append(ys, y)
    ds = append(ds, d)
    if (d == 0) break
}

n = length(xs)
es = abs(xs)
data.frame(
    xs = xs,
    ys = ys,
    ds = ds,
    le = c(es[-1] / es[-n], NaN),
    qe = c(es[-1] / es[-n]^2, NaN))
