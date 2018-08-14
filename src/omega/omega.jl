"Probability Space indexed with values of type I"
abstract type Ω{I} <: AbstractRNG end

"This is base Omega - Sample Space Object"
abstract type ΩBase{I} <: Ω{I} end

idtype(::Type{OT}) where {I, OT <: Ω{I}} = I

const uidcounter = Counter(0)

"Unique id"
uid() = (global uidcounter; increment(uidcounter))
# @spec (x = [uid() for i = 1:Inf]; unique(x) == x)

"Construct globally unique id for indices for ω"
macro id()
  Omega.uid()
end

"Index of Probability Space"
const Id = Int

"Tuple of Ints"
const Ints = NTuple{N, Int} where N

"Id of a random variable"
const RandVarId = Int

## Rand
## ====
"Random ω ∈ Ω"
Base.rand(x::Type{O}) where O <: ΩBase = defΩ()()

RV = Union{Integer, Random.FloatInterval}
# lookup(::Type{UInt32}) = UInt32, :_UInt32
# lookup(::Type{Close1Open2}) = Float64, :_Float64
# lookup(::Type{CloseOpen}) = Float64, :_Float64