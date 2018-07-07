# Net present value of the investment
npv = function(r) {
    s = 1 + r
    6000*r - 1000*s*(s^5 - 1)
}

# Plot the NPV vs. the discount rate
jpeg('invest.jpg')
curve(npv(x), 0, 0.08)
abline(h = 0, col = 'red')
dev.off()

# Find the internal return rate, i.e.
# the discount rate that makes the NPV zero
xs = c(0.04, 0.08)
ys = npv(xs)
repeat {
    ps = tail(xs, 2)
    qs = tail(ys, 2)
    x = diff(qs * rev(ps)) / diff(qs)
    y = npv(x)
    xs = append(xs, x)
    ys = append(ys, y)
    if (abs(diff(ps)) < 1e-10) break
}

# Find the convergence rate
n = length(xs)
phi = (1 + sqrt(5)) / 2
es = abs(xs - x)
data.frame(
    xs = xs,
    ys = ys,
    le = c(es[-1] / es[-n], NaN),
    pe = c(es[-1] / es[-n]^phi, NaN),
    qe = c(es[-1] / es[-n]^2, NaN))
