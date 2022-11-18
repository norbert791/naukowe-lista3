#author: Norbert Jaśniewicz

f1(x::Float64) = exp(1 - x) - 1.0
f2(x::Float64) = x * exp(-x)

function main()

  delta::Float64 = 1e-5
  epsilon::Float64 = delta

end