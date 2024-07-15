"""
    CircularContainer(v::Vector)

Creates a circular container that wraps around the vector `v`. This is useful for
iterating over a vector in a circular fashion.

# Examples
```julia
julia> c = CircularContainer([1, 2, 3])
CircularContainer([1, 2, 3])

julia> for i in 1:4
           println(c[i])
       end
1
2
3
1
```
"""
struct CircularContainer
    v::Vector
end

Base.length(c::CircularContainer) = length(c.v)
Base.iterate(c::CircularContainer, state = 1) = Base.iterate(c.v, state)

Base.getindex(c::CircularContainer, i::Int) = c.v[mod1(i, length(c))]
Base.firstindex(c::CircularContainer) = 1
Base.lastindex(c::CircularContainer) = length(c)

const COLORSCHEME = [
    "#4263eb",
    "#f03e3e",
    "#0a9a84",
    "#191e44",
    "#f76707",
    "#7143e0",
    "#f2cc35",
    "#791457",
    "#cf6db0",
    "#6adad3"
]

const MARKERSLIST = [
    :circle,
    :utriangle,
    :rect,
    :dtriangle,
    :diamond,
    :xcross,
    :hexagon,
    :star5
]

const GREYPALETTE = [
    "#BBB",
    "#999",
    "#666",
    "#333",
    "#000"
]

const COLORS = CircularContainer(COLORSCHEME)
const GREYS = CircularContainer(GREYPALETTE)
const MARKERS = CircularContainer(MARKERSLIST)

const _FONTSIZE = 36
const _LABELSIZE = 36
const _MARKERSIZE = 24
const _LINEWIDTH = 4
const _DEFAULT_SIZE = (900, 675)
const _FONT = "CMU"
