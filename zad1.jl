#author: Norbert Jaśniewicz
include("methods.jl")

function main()
  fun(x :: Float64) = x ^ 2 - x - 5
  delta::Float64 = 1e-4
  epsilon::Float64 = 1e-4
  x0, val, it, err = mbisekcji(fun, 2.0, 4.0, delta, epsilon)
  @assert(x0 < delta || val < epsilon)
  @assert(err == 0)
  x0, val, it, err = mbisekcji(fun, 8.0, 16.0, delta, epsilon)
  @assert(err == 1)
  println("Test passed")
end

main()
