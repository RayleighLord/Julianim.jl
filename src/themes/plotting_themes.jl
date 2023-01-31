"""
    set_publication_theme!(; kwargs...)

Set the current theme to the predefined publication theme.

You can use the function `update_theme!` to modify the current theme.

# Examples
```julia
julia> using Julianim

julia> set_publication_theme!()            # set the theme to the publication theme

julia> update_theme!(                     # modify the current theme
    fontsize = 10,
    ticksize = 5
)
```
"""
function set_publication_theme!(; kwargs...)
    theme = publication_theme(; kwargs...)
    return set_theme!(; theme...)
end

"""
    set_publication_dark_theme!(; kwargs...)

Set the current theme to the predefined publication theme.

You can use the function `update_theme!` to modify the current theme.

# Examples
```julia
julia> using Julianim

julia> set_publication_theme!()            # set the theme to the publication theme

julia> update_theme!(                     # modify the current theme
    fontsize = 10,
    ticksize = 5
)
```
"""
function set_publication_dark_theme!(; kwargs...)
    theme = publication_dark_theme(; kwargs...)
    return set_theme!(; theme...)
end

"""
    publication_theme(; fullscreen = false)

Defines a paper quality theme for figures. The `fullscreen` keyword argument is set to
`false` by default, which adds padding to the figure. If you want to use the theme for a
full screen figure, set `fullscreen = true`.
"""
function publication_theme(; fullscreen = false)
    f_padding = fullscreen ? (0, 0, 0, 0) : (0, 40, 0, 20)

    Theme(backgroundcolor = :white,
          resolution = (1152, 864),
          fonts = (; regular = "CMU", bold = "CMU"),
          fontsize = 36,
          textcolor = :black,
          figure_padding = f_padding,
          linewidth = 4,
          markersize = 20,
          palette = (color = COLORS,
                     patchcolor = COLORS,
                     marker = MARKERS),
          Scatter = (cycle = Cycle([:marker, :color], covary = true), strokecolor = :black,
                     strokewidth = 1.5),
          ScatterLines = (cycle = Cycle([:marker, :color], covary = true),
                          strokecolor = :black, strokewidth = 1.5),
          Axis = (aspect = nothing,
                  backgroundcolor = :white,
                  spinewidth = 2,
                  titlesize = 38,
                  topspinecolor = :black,
                  rightspinecolor = :black,
                  leftspinecolor = :black,
                  bottomspinecolor = :black,
                  xautolimitmargin = (0.05f0, 0.05f0),
                  xgridcolor = RGBAf(0, 0, 0, 0.2),
                  xgridstyle = nothing,
                  xgridwidth = 1.5,
                  xgridvisible = false,
                  xlabel = L"x",
                  xlabelpadding = 10.0,
                  xlabelsize = 40,
                  xminorgridcolor = RGBAf(0, 0, 0, 0.15),
                  xminorgridstyle = :dot,
                  xminorgridvisible = false,
                  xminorgridwidth = 1.0,
                  xminortickalign = 0.0,
                  xminortickcolor = :black,
                  xminorticks = IntervalsBetween(2),
                  xminorticksize = -12.5,
                  xminorticksvisible = true,
                  xminortickwidth = 1.0,
                  xtickalign = 1,
                  xtickcolor = :black,
                  xtickformat = xs -> [L"%$x" for x in xs],
                  xticklabelpad = 5,
                  xticksize = 20,
                  xtickwidth = 1.5,
                  xticksmirrored = true,
                  yautolimitmargin = (0.05f0, 0.05f0),
                  ygridcolor = RGBAf(0, 0, 0, 0.2),
                  ygridstyle = nothing,
                  ygridwidth = 1.5,
                  ygridvisible = false,
                  ylabel = L"y",
                  ylabelpadding = 5.0,
                  ylabelsize = 40,
                  yminorgridcolor = RGBAf(0, 0, 0, 0.15),
                  yminorgridstyle = :dot,
                  yminorgridvisible = false,
                  yminorgridwidth = 1.0,
                  yminortickalign = 0.0,
                  yminortickcolor = :black,
                  yminorticks = IntervalsBetween(2),
                  yminorticksize = -12.5,
                  yminorticksvisible = true,
                  yminortickwidth = 1.0,
                  ytickalign = 1,
                  ytickcolor = :black,
                  ytickformat = ys -> [L"%$y" for y in ys],
                  yticklabelpad = 10,
                  yticksize = 20,
                  ytickwidth = 1.5,
                  yticksmirrored = true),
          Legend = (bgcolor = :white,
                    framecolor = (:black, 1),
                    framewidth = 1.5,
                    margin = (25, 25, 25, 25),
                    orientation = :vertical,
                    padding = (10, 10, 8, 8),
                    patchlabelgap = 15,
                    patchsize = (70, 20),
                    halign = :left,
                    valign = :top,
                    tellheight = false,
                    tellwidth = false),
          Colorbar = (bottomspinevisible = true,
                      minorticksvisible = false,
                      labelpadding = 25,
                      labelsize = 40,
                      spinewidth = 1.75,
                      tickcolor = :black,
                      ticksize = 10,
                      tickalign = 0,
                      ticklabelpad = 7.5,
                      tickwidth = 1.5,
                      width = 30),
          Axis3 = (aspect = (1, 1, 3 / 4),
                   azimuth = 1.275π,
                   elevation = π / 8,
                   backgroundcolor = :transparent,
                   perspectiveness = 0.0,
                   protrusions = 0,
                   viewmode = :fit,
                   xgridcolor = RGBAf(0, 0, 0, 0.2),
                   xgridvisible = false,
                   xgridwith = 1.5,
                   xlabel = L"x",
                   xlabeloffset = 50,
                   xspinecolor_1 = :black,
                   xspinecolor_2 = :black,
                   xspinecolor_3 = :black,
                   xspinevisible = true,
                   xspinewidth = 1.5,
                   xtickcolor = :black,
                   #    xtickformat = xs -> [L"%$x" for x in xs],
                   xtickwidth = 1.5,
                   ygridcolor = RGBAf(0, 0, 0, 0.2),
                   ygridvisible = false,
                   ygridwith = 1.5,
                   ylabel = L"y",
                   ylabeloffset = 50,
                   yspinecolor_1 = :black,
                   yspinecolor_2 = :black,
                   yspinecolor_3 = :black,
                   yspinevisible = true,
                   yspinewidth = 1.5,
                   ytickcolor = :black,
                   #    ytickformat = ys -> [L"%$y" for y in ys],
                   ytickwidth = 1.5,
                   zgridcolor = RGBAf(0, 0, 0, 0.2),
                   zgridvisible = false,
                   zgridwith = 1.5,
                   zlabel = L"z",
                   zlabeloffset = 75,
                   zspinecolor_1 = :black,
                   zspinecolor_2 = :black,
                   zspinecolor_3 = :black,
                   zspinevisible = true,
                   zspinewidth = 1.5,
                   ztickcolor = :black,
                   #    ztickformat = zs -> [L"%$z" for z in zs],
                   ztickwidth = 1.5,
                   bottomspinecolor = :black,
                   tickcolor = :black))
end

"""
    publication_dark_theme(; fullscreen = false)

Defines a paper quality dark theme for figures. The `fullscreen` keyword argument is set to
`false` by default, which adds padding to the figure. If you want to use the theme for a
full screen figure, set `fullscreen = true`.
"""
function publication_dark_theme(; fullscreen = false)
    f_padding = fullscreen ? (0, 0, 0, 0) : (0, 40, 0, 20)

    Theme(backgroundcolor = :black,
          resolution = (1152, 864),
          fonts = (; regular = "CMU", bold = "CMU"),
          fontsize = 36,
          textcolor = :white,
          figure_padding = f_padding,
          linewidth = 4,
          markersize = 20,
          palette = (color = COLORS,
                     patchcolor = COLORS,
                     marker = MARKERS),
          Scatter = (cycle = Cycle([:marker, :color], covary = true), strokecolor = :white,
                     strokewidth = 1.5),
          ScatterLines = (cycle = Cycle([:marker, :color], covary = true),
                          strokecolor = :white, strokewidth = 1.5),
          Axis = (aspect = nothing,
                  backgroundcolor = :black,
                  spinewidth = 2,
                  titlesize = 38,
                  topspinecolor = :white,
                  rightspinecolor = :white,
                  leftspinecolor = :white,
                  bottomspinecolor = :white,
                  xautolimitmargin = (0.05f0, 0.05f0),
                  xgridcolor = RGBAf(1, 1, 1, 0.2),
                  xgridstyle = nothing,
                  xgridwidth = 1.5,
                  xgridvisible = false,
                  xlabel = L"x",
                  xlabelpadding = 10.0,
                  xlabelsize = 40,
                  xminorgridcolor = RGBAf(1, 1, 1, 0.15),
                  xminorgridstyle = :dot,
                  xminorgridvisible = false,
                  xminorgridwidth = 1.0,
                  xminortickalign = 0.0,
                  xminortickcolor = :white,
                  xminorticks = IntervalsBetween(2),
                  xminorticksize = -12.5,
                  xminorticksvisible = true,
                  xminortickwidth = 1.0,
                  xtickalign = 1,
                  xtickcolor = :white,
                  xtickformat = xs -> [L"%$x" for x in xs],
                  xticklabelpad = 5,
                  xticksize = 20,
                  xtickwidth = 1.5,
                  xticksmirrored = true,
                  yautolimitmargin = (0.05f0, 0.05f0),
                  ygridcolor = RGBAf(1, 1, 1, 0.2),
                  ygridstyle = nothing,
                  ygridwidth = 1.5,
                  ygridvisible = false,
                  ylabel = L"y",
                  ylabelpadding = 5.0,
                  ylabelsize = 40,
                  yminorgridcolor = RGBAf(1, 1, 1, 0.15),
                  yminorgridstyle = :dot,
                  yminorgridvisible = false,
                  yminorgridwidth = 1.0,
                  yminortickalign = 0.0,
                  yminortickcolor = :white,
                  yminorticks = IntervalsBetween(2),
                  yminorticksize = -12.5,
                  yminorticksvisible = true,
                  yminortickwidth = 1.0,
                  ytickalign = 1,
                  ytickcolor = :white,
                  ytickformat = ys -> [L"%$y" for y in ys],
                  yticklabelpad = 10,
                  yticksize = 20,
                  ytickwidth = 1.5,
                  yticksmirrored = true),
          Legend = (bgcolor = :black,
                    framecolor = (:white, 1),
                    framewidth = 1.5,
                    margin = (25, 25, 25, 25),
                    orientation = :vertical,
                    padding = (10, 10, 8, 8),
                    patchlabelgap = 15,
                    patchsize = (70, 20),
                    halign = :left,
                    valign = :top,
                    tellheight = false,
                    tellwidth = false),
          Colorbar = (bottomspinevisible = true,
                      minorticksvisible = false,
                      labelpadding = 25,
                      labelsize = 40,
                      spinewidth = 1.75,
                      tickcolor = :white,
                      ticksize = 10,
                      tickalign = 0,
                      ticklabelpad = 7.5,
                      tickwidth = 1.5,
                      width = 30),
          Axis3 = (aspect = (1, 1, 3 / 4),
                   azimuth = 1.275π,
                   elevation = π / 8,
                   backgroundcolor = :transparent,
                   perspectiveness = 0.0,
                   protrusions = 0,
                   viewmode = :fit,
                   xgridcolor = RGBAf(1, 1, 1, 0.2),
                   xgridvisible = false,
                   xgridwith = 1.5,
                   xlabel = L"x",
                   xlabeloffset = 50,
                   xspinecolor_1 = :white,
                   xspinecolor_2 = :white,
                   xspinecolor_3 = :white,
                   xspinevisible = true,
                   xspinewidth = 1.5,
                   xtickcolor = :white,
                   #    xtickformat = xs -> [L"%$x" for x in xs],
                   xtickwidth = 1.5,
                   ygridcolor = RGBAf(1, 1, 1, 0.2),
                   ygridvisible = false,
                   ygridwith = 1.5,
                   ylabel = L"y",
                   ylabeloffset = 50,
                   yspinecolor_1 = :white,
                   yspinecolor_2 = :white,
                   yspinecolor_3 = :white,
                   yspinevisible = true,
                   yspinewidth = 1.5,
                   ytickcolor = :white,
                   #    ytickformat = ys -> [L"%$y" for y in ys],
                   ytickwidth = 1.5,
                   zgridcolor = RGBAf(1, 1, 1, 0.2),
                   zgridvisible = false,
                   zgridwith = 1.5,
                   zlabel = L"z",
                   zlabeloffset = 75,
                   zspinecolor_1 = :white,
                   zspinecolor_2 = :white,
                   zspinecolor_3 = :white,
                   zspinevisible = true,
                   zspinewidth = 1.5,
                   ztickcolor = :white,
                   #    ztickformat = zs -> [L"%$z" for z in zs],
                   ztickwidth = 1.5,
                   bottomspinecolor = :white,
                   tickcolor = :white))
end
