module Julianim

using Reexport

@reexport using GLMakie, LaTeXStrings

include("themes/plotting_themes.jl")

export set_publication_theme!, set_publication_dark_theme!

end
