module DN3

export  ZacetniProblemNDE, resi_trapez

"""
    ZacetniProblemNDE(f, x0, y0)
    
Podatkovni tip za začetni problem navadne diferencialne enačbe. 
`f` predstavlja funkcijo desnih strani DE y' = f(x, y).
`x0` je začetna vrednost neodvisne spremenljivke.
`y0` je začetna vrednost odvisne spremenljivke.
"""

struct ZacetniProblemNDE
    f 
    x0 
    y0 
end

"""
    y, x = resi_trapez(zp::ZacetniProblemNDE, xk; n = n)

Reši začetni problem za NDE z trapezno metodo na [zp.x0, xk] s fiksnim korakom.
Parameter `n` določa število korakov. Funkcija vrne dva vektorja z izračunanimi 
vrednostmi `y` in vrednostmi neodvisne spremenljivke `x`.
"""

function resi_trapez(zp::ZacetniProblemNDE, xk; n = 100)
    y = zeros(n+1, length(zp.y0))
    y[1,:] = zp.y0
    x = LinRange(zp.x0, xk, n+1)
    h = x[2] - x[1]
    for i=1:n
        y[i+1, :] = y[i, :] + h * zp.f(x[i], y[i, :]) # Euler
        y[i+1, :] = y[i, :] + h / 2 * (zp.f(x[i], y[i, :]) + zp.f(x[i+1], y[i+1, :]))  
    end
    return y, x
end


end # module DN3
