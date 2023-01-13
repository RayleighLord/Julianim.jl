using Julianim

const FPS = 30
const T = 6
const dt = 1 / FPS
const ω = 2π / T

f₊(x, t) = sin.(2x .- ω * t)
f₋(x, t) = sin.(2x .+ ω * t)

x = 0:0.01:(2π)
t = Observable(0.0)
y₊ = @lift f₊(x, $t)
y₋ = @lift f₋(x, $t)
y = @lift $y₊ + $y₋

step!(t) = t[] += dt

function twavefig()
    set_publication_dark_theme!(fullscreen = true)
    fig = Figure()
    # display(fig)
    ax = Axis(fig[1, 1])

    hidedecorations!(ax)
    hidespines!(ax)
    limits!(-0.5, 2π + 0.5, -3, 3.5)

    lines!(ax, [-0.015, 2π + 0.015], [0, 0]; color = (:white, 0.6), linewidth = 1)
    lines!(ax, x, y₊; color = (COLORS[1], 0.7))
    lines!(ax, x, y₋; color = (COLORS[2], 0.7))
    lines!(ax, x, y; color = (COLORS[4], 1), linewidth = 7.5)
    lines!(ax, [0, 0], [-1.25, 1.25]; color = (:white, 0.5))
    lines!(ax, [2π + 0.015, 2π + 0.015], [-1.25, 1.25]; color = (:white, 0.5))
    scatter!(ax, [0, π / 2, π, 3π / 2, 2π], [0, 0, 0, 0, 0]; color = :white,
             markersize = 15)

    text!("@RayleighLord", space = :relative, position = Point2f(0.8, 0.025),
          color = (:white, 0.6), fontsize = 30)
    text!(L"\sin(x - ct)", position = (0.55, 2.65), color = (COLORS[1], 1), fontsize = 50)
    text!(L"+", position = (2.0, 2.67), color = :white, fontsize = 50)
    text!(L"\sin(x + ct)", position = (2.35, 2.65), color = (COLORS[2], 1), fontsize = 50)
    text!(L"=", position = (3.8, 2.67), color = :white, fontsize = 50)
    text!(L"2 \sin (x)  \cos (ct)", position = (4.1, 2.65), color = (COLORS[4], 1),
          fontsize = 50)

    fig
end

fig = twavefig()

# Test the animation before recording
for i in 1:(T * FPS)
    step!(t)
    sleep(dt)
end

# Record the actual animation
fig = twavefig()
frames = 1:(T * FPS)
dir = (@__DIR__) * "/videos/sw_from_tws.gif"

record(fig, dir, frames; framerate = FPS) do i
    step!(t)
end
