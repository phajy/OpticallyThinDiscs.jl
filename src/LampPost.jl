# Point source model test

using Gradus
using Plots

# Schwarzschild metric
m = KerrMetric(a = 0.0)

# Point source
sr = 20.0
sθ = 0.01
sϕ = 0.0
model = LampPostModel(h = sr, θ = sθ, ϕ = sϕ)
u = @SVector [0.0, sr, sθ, sϕ]

# defining a correctly normalized velocity of stationary source based on model and metric
v_source = Gradus.source_velocity(m, model)

# defining the sampler
sampler = EvenSampler(domain = BothHemispheres(), generator = GoldenSpiralGenerator())

N = 50

# sample theta and phi and generate initial photon directions
# for now just sample in theta
vs = map(1:N) do index
    # i = Gradus.geti(sampler, index, N)
    # θ, ϕ = Gradus.sample_angles(sampler, i, N)
    θ = π*index/N
    ϕ = 0.0
    vel = Gradus.sky_angles_to_velocity(m, u, v_source, θ, ϕ)
end

us = [u for _ in vs]

sols = tracegeodesics(
    m, us, vs, (0.0, 2000.0)
)

# plot_paths(sols, legend = false, n_points = 2048)
# plot_horizon!(m, lw = 2.0, color = :black)

# create cartesian plot axes
p = plot(
    xlims = (-25, 25),
    ylims = (-25, 25),
    aspect_ratio = 1,
    legend = false,
    xlabel = "x",
    ylabel = "y",
)

for s in sols
    su = s.u
    x = [i[2]*sin(i[3]*cos(i[4])) for i in su]
    y = [i[2]*sin(i[3]*sin(i[4])) for i in su]
    z = [i[2]*cos(i[3]) for i in su]
    plot!(x,z)
end

plot_horizon!(m, lw = 2.0, color = :black)

display(p)
