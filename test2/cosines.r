g = 3
f = function(x) cosh(x) + cos(x) - g

curve(f(x), 0, 3)

a = 0
b = 3
fa = f(a)
fb = f(b)
tol = 1e-10
while (b - a >= tol) {
    x = (a + b) / 2
    fx = f(x)
    if (fa*fx > 0) {
        a = x
        fa = fx
    } else {
        b = x
        fb = fx
    }
}
