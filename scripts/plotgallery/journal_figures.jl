using Julianim

publication_figure()
publication_figure_dark()
publication_figure_fullscreen()
colorbar_example()
threed_fig()

function publication_figure()
    x = (-π):0.1:π
    y₁ = sin.(x)
    y₂ = cos.(x)

    set_publication_theme!()

    fig = Figure()
    ax = Axis(fig[1, 1],
        xticks = ([-3, -1.5, 0, 1.5, 3]),
        yticks = ([-1, -0.5, 0, 0.5, 1, 1.5, 2.0]))

    [lines!(ax, x, y₂ .+ 0.2 * i) for i in 1:7]
    [scatter!(ax, x[1:5:end], y₂[1:5:end] .+ 0.2 * i) for i in 1:7]
    # [scatter!(ax, x[1:4:end], y₂[1:4:end] .+ 0.1 * i; color = :white, cycle = [:marker],
    #     strokecolor = :black) for i in 1:7]

    scatterlines!(ax, x, y₁; label = L"\text{TW}2")
    lines!(ax, x, y₂; label = L"\text{TW}3")

    Legend(fig[1, 1], ax)
    text!(ax, L"E = mc^2", space = :relative, position = Point2f(0.5, 0.5), fontsize = 40)
    # DataInspector(fig)
    # save("test.svg", fig, px_per_unit = 2)
    display(GLMakie.Screen(), fig)
end

function publication_figure_dark()
    x = (-π):0.1:π
    y₁ = sin.(x)
    y₂ = cos.(x)

    set_publication_dark_theme!()

    fig = Figure()
    ax = Axis(fig[1, 1],
        xticks = ([-3, -1.5, 0, 1.5, 3]),
        yticks = ([-1, -0.5, 0, 0.5, 1, 1.5, 2.0]))

    [lines!(ax, x, y₂ .+ 0.1 * i) for i in 1:7]
    [scatter!(ax, x[1:4:end], y₂[1:4:end] .+ 0.1 * i) for i in 1:7]
    # [scatter!(ax, x[1:4:end], y₂[1:4:end] .+ 0.1 * i; color = :white, cycle = [:marker],
    #           strokecolor = :black) for i in 1:7]

    scatterlines!(ax, x, y₁; label = L"\text{TW}2")
    lines!(ax, x, y₂; label = L"\text{TW}3")

    Legend(fig[1, 1], ax)
    text!(ax, L"E = mc^2", space = :relative, position = Point2f(0.5, 0.5), fontsize = 40)
    # DataInspector(fig)
    # save("test.png", fig)
    fig
end

function threed_fig()
    xs = LinRange(0, 10, 100)
    ys = LinRange(0, 15, 100)
    zs = [cos(x) * sin(y) for x in xs, y in ys]

    set_publication_theme!()

    fig = Figure()
    ax = Axis3(fig[1, 1])

    surface!(ax, xs, ys, zs)
    # save("test.png", fig)
    fig
end

function colorbar_example()
    x = LinRange(0, 2π, 100)
    set_publication_theme!()

    fig = Figure()
    ax = Axis(fig[1, 1])

    obj = lines!(ax, x, sin.(x); color = x, colormap = :viridis)
    Colorbar(fig[1, 2], obj, label = L"\sin{x}")
    # Colorbar(fig[1, 2], obj)
    fig
end

function publication_figure_fullscreen()
    x = (-π):0.1:π
    y₁ = sin.(x)
    y₂ = cos.(x)
    set_publication_theme!(fullscreen = true)

    fig = Figure()
    ax = Axis(fig[1, 1],
        xticks = ([-3, -1.5, 0, 1.5, 3]),
        yticks = ([-1, -0.5, 0, 0.5, 1, 1.5, 2.0]))

    [lines!(ax, x, y₂ .+ 0.1 * i) for i in 1:7]
    [scatter!(ax, x[1:4:end], y₂[1:4:end] .+ 0.1 * i) for i in 1:7]
    # [scatter!(ax, x[1:4:end], y₂[1:4:end] .+ 0.1 * i; color = :white, cycle = [:marker],
    #           strokecolor = :black) for i in 1:7]

    scatterlines!(ax, x, y₁; label = L"\text{TW}2")
    lines!(ax, x, y₂; label = L"\text{TW}3")

    Legend(fig[1, 1], ax)
    text!(ax, L"E = mc^2", space = :relative, position = Point2f(0.5, 0.5), fontsize = 40)
    # DataInspector(fig)
    # save("test.png", fig)
    hidespines!(ax)
    hidedecorations!(ax)
    fig
end
