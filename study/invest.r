M = 6000
v = 1000
n = 5

npv = function(r) {
    s = 1 + r
    v*s*(s^n - 1)/r
}

f = function(r) npv(r) - M

fp = function(r) {
    s = (1 + r)^n
    (v*(s - 1) + v*n*s - npv(r)) / r
}

#curve(f(x), 0, 0.08)
#abline(h = 0, col = 'red')

# Bisection method
a = 0.01
b = 0.1
fa = f(a)
fb = f(b)
for (i in 1:5) {
    r = a + (b - a) / 2
    fr = f(r)
    if (fa*fr > 0) {
        a = r
        fa = fr
    } else {
        b = r
        fb = fr
    }
}

# Newton's method
tol = 1e-6
repeat {
    y = f(r)
    d = y / fp(r)
    r = r - d
    if (abs(y) < tol) break
}
