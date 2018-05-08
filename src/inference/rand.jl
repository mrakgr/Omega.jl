"Unconditional Sample from `x`"
Base.rand(x::Union{RandVar, UTuple{RandVar}}; OmegaT::Type{T} = DefaultOmega) where T <: Omega = x(OmegaT())

# const DefaultOmega = Mu.SimpleOmega{Mu.Paired, Mu.Float64}
const DefaultOmega = Mu.SimpleOmega{Mu.Paired, Mu.ValueTuple}

"Version A"
Base.rand(x::RandVar, OmegaT::T = DefaultOmega) where T = x(OmegaT())

defaultomega(::Type{ALG}) where ALG = DefaultOmega

"Sample from `x | y == true` with Metropolis Hasting"
function Base.rand(x::Union{RandVar, UTuple{RandVar}}, y, alg::Type{ALG};
                   n::Integer = 1000,
                   OmegaT::OT = defaultomega(ALG),
                   cb = default_cbs(n)) where {ALG, OT}
  map(x, rand(OmegaT, y, alg; n = n, cb = cb))
end