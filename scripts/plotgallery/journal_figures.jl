using Julianim

publication_figure()
publication_figure_dark()
publication_figure_fullscreen()

MARKER_LIST = [:circle, :rect, :utriangle, :star5, :diamond, :dtriangle, :cross, :pentagon]

function publication_figure()
    x = (-π):0.1:π
    y₁ = sin.(x)
    y₂ = cos.(x)
    set_theme!(publication_theme())

    fig = Figure()
    # ax = Axis(fig[1, 1])
    # ax = Axis(fig[1, 1],
    #           xticks = ([-3, -1.5, 0, 1.5, 3], latexstring.([-3, -1.5, 0, 1.5, 3])),
    #           yticks = ([-1, -0.5, 0, 0.5, 1, 1.5, 2.0],
    #                     latexstring.([-1, -0.5, 0, 0.5, 1, 1.5, 2.0])))

    ax = Axis(fig[1, 1],
              xticks = ([-3, -1.5, 0, 1.5, 3]),
              yticks = ([-1, -0.5, 0, 0.5, 1, 1.5, 2.0]))

    lines!(ax, x, y₁; label = L"\text{TW}2")
    lines!(ax, x, y₂; label = L"TW3")
    [lines!(ax, x, y₂ .+ 0.1 * i) for i in 1:8]
    scatter!(ax, x, y₂; label = L"TW4")
    scatter!(ax, x, y₂ .+ 0.1; label = L"TW5")

    axislegend(ax; merge = true, position = :lt)
    text!(ax, L"E = mc^2", space = :relative, position = Point2f(0.5, 0.5), fontsize = 40)
    # DataInspector(fig)
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
    text!(ax, L"E = mc^2", space = :relative, position = Point2f(0.5, 0.5), fontsize = 40)
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
    text!(ax, L"E = mc^2", space = :relative, position = Point2f(0.5, 0.5), fontsize = 40)
    hidedecorations!(ax)
    hidespines!(ax)
    fig
end
