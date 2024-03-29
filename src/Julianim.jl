module Julianim

using Reexport

@reexport using GLMakie, LaTeXStrings

include("constants.jl")
include("themes/plotting_themes.jl")

export CircularContainer, COLORS, MARKERS, GREYS

export set_publication_theme!, set_publication_dark_theme!

end
