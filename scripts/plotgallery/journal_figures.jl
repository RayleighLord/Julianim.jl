using Julianim

publication_figure()
publication_figure_dark()
publication_figure_fullscreen()

function publication_figure()
    x = (-π):0.1:π
    y₁ = sin.(x)
    y₂ = cos.(x)
    set_theme!(publication_theme())

    fig = Figure()
    ax = Axis(fig[1, 1],
              xticks = ([-3, -1.5, 0, 1.5, 3], latexstring.([-3, -1.5, 0, 1.5, 3])),
              yticks = ([-1, -0.5, 0, 0.5, 1, 1.5, 2.0],
                        latexstring.([-1, -0.5, 0, 0.5, 1, 1.5, 2.0])))

    lines!(ax, x, y₁; label = "TW2")
    lines!(ax, x, y₂; label = "TW3")
    [lines!(ax, x, y₂ .+ 0.1 * i) for i in 1:8]

    axislegend(ax; merge = true, position = :lt)
    text!(ax, L"E = mc^2", space = :relative, position = Point2f(0.5, 0.5), textsize = 40)
    fig
end

function publication_figure_dark()
    x = (-π):0.1:π
    y₁ = sin.(x)
    y₂ = cos.(x)
    set_theme!(publication_dark_theme())

    fig = Figure()
    ax = Axis(fig[1, 1],
              xticks = ([-3, -1.5, 0, 1.5, 3], latexstring.([-3, -1.5, 0, 1.5, 3])),
              yticks = ([-1, -0.5, 0, 0.5, 1, 1.5, 2.0],
                        latexstring.([-1, -0.5, 0, 0.5, 1, 1.5, 2.0])))
    lines!(ax, x, y₁; label = "TW2")
    lines!(ax, x, y₂; label = "TW3")
    [lines!(ax, x, y₂ .+ 0.1 * i) for i in 1:8]

    axislegend(ax; merge = true, position = :lt)
    text!(ax, L"E = mc^2", space = :relative, position = Point2f(0.5, 0.5), textsize = 40)
    fig
end

function publication_figure_fullscreen()
    x = (-π):0.1:π
    y₁ = sin.(x)
    y₂ = cos.(x)
    set_theme!(publication_dark_theme())
    update_theme!(fullscreen())

    fig = Figure()
    ax = Axis(fig[1, 1],
              xticks = ([-3, -1.5, 0, 1.5, 3], latexstring.([-3, -1.5, 0, 1.5, 3])),
              yticks = ([-1, -0.5, 0, 0.5, 1, 1.5, 2.0],
                        latexstring.([-1, -0.5, 0, 0.5, 1, 1.5, 2.0])))
    lines!(ax, x, y₁; label = "TW2")
    lines!(ax, x, y₂; label = "TW3")
    [lines!(ax, x, y₂ .+ 0.1 * i) for i in 1:8]

    axislegend(ax; merge = true, position = :lt)
    text!(ax, L"E = mc^2", space = :relative, position = Point2f(0.5, 0.5), textsize = 40)
    hidedecorations!(ax)
    hidespines!(ax)
    fig
end
