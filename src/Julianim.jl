module Julianim

using Reexport

@reexport using GLMakie, LaTeXStrings

include("themes/plotting_themes.jl")

const COLORS = [
    "#4263eb",
    "#f03e3e",
    "#f76707",
    "#22b371",
    "#5f3dc4",
    "#fcc419",
    "#c2255c",
    "#1098ad",
    "#cf6db0",
]

const MARKERS = [
    :circle,
    :utriangle,
    :rect,
    :dtriangle,
    :diamond,
    :xcross,
    :hexagon,
    :star5,
]

export COLORS, MARKERS

export set_publication_theme!, set_publication_dark_theme!

end
