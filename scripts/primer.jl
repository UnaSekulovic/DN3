using Main.DN3
using Plots

# Definirajte funkcijo, ki predstavlja diferencialno enačbo
# x′′(t)−4(1−x2)x′(t)+x=0
perioda_f(t, x) = [x[2], 4(1 - x[1]^2)*x[2] - x[1]]


# primer
#začetni približek
x0 = 2.0
y0 = 0.0

perioda_zacetni_problem = ZacetniProblemNDE(perioda_f, 0.0, [x0, y0])

# rešitev s trapezno metodo
z_tr, t_tr = resi_trapez(perioda_zacetni_problem, 50; n=100000)

#rešitev v fazni ravnini
plot(z_tr[:,1], z_tr[:,2])


#izračunati ničle
tocke = []
for i=1:length(t_tr)-1
    if z_tr[i, 1] * z_tr[i+1, 1] < 0
        push!(tocke, (t_tr[i] + t_tr[i+1])/2)
    end
end


#izračunati periodo
#rezultat 10.2035236
perioda = round(tocke[end] - tocke[end-2]; digits = 10)



