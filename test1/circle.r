# Generate a thousand points in the unit square
k = 1000000
x = runif(k)
y = runif(k)
r = x*x + y*y
m = cumsum(r <= 1)
n = 1:k
z = 4*(m/n)
e = abs(z - pi) / pi

# Plot the cumulative proportion of points
# in the unit circle
jpeg("pi.jpg")
plot(n, z, 'l')
abline(h = pi, col = 'red')
dev.off()

# Plot the relative error w.r.t.
# the correct value in the limit (pi)
jpeg("error.jpg")
plot(n, e, 'l')
dev.off()

# Find the minimum and last errors
j = subset(n, e == min(e))
e[j]
e[k]
