module Julianim

using Reexport

@reexport using GLMakie, LaTeXStrings

include("themes/plotting_themes.jl")

export publication_theme, publication_dark_theme, fullscreen

end
