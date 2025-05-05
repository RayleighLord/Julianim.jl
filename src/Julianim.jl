module Julianim

using Reexport

@reexport using Makie, GLMakie, LaTeXStrings

include("constants.jl")
include("themes/plotting_themes.jl")

export CircularContainer, COLORS, MARKERS, GREYS

export BLUE, RED, GREEN, DARKBLUE, ORANGE, PURPLE, YELLOW, DARKPINK, LIGHTBLUE, PINK

export set_publication_theme!, set_publication_dark_theme!

end
