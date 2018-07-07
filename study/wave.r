s = function(w) 4.9 / w^2 * (sinh(w) - sin(w))
# curve(s(x) - 1, 0.5, 3, xlab = 'w', ylab = 's(w) - 1')

f = function(w) s(w) - 1

a = 0.5
b = 3
fa = f(a)
fb = f(b)
tol = 1e-5
while (b - a >= tol) {
    x = a + (b - a) / 2
    fx = f(x)
    if (fa*fx > 0) {
        a = x
        fa = fx
    } else {
        b = x
        fb = fx
    }
}
