# Van der Waals constants for carbon dioxide
a = 0.401      # m^6 Pa mol^-2
b = 42.7e-6    # m^3 mol^-1

# Problem data
n = 1000       # molecules
T = 300        # K
R = 8.314      # J mol^-1 K^-1
e = 10e-12     # tolerance

nRT = n*R*T    # J
nb = n*b       # m^3

# Pressure is a function of volume
p = function(V) nRT / (V - nb) - a*(n/V)^2
f = function(V) p(V) - 3.5e7

#curve(p(x), 0.05, 0.1, xlab = 'Volume', ylab = 'Pressure')
#abline(h = 3.5e7, col = 'red')

v0 = 0.05
v2 = 0.1
f0 = f(v0)
f2 = f(v2)
tol = 1e-12
while (v2 - v0 >= tol) {
    v1 = v0 + (v2 - v0) / 2
    f1 = f(v1)
    if (f0 * f1 > 0) {
        v0 = v1
        f0 = f1
    } else {
        v2 = v1
        f2 = f1
    }
}
