#author: Norbert Jaśniewicz
include("methods.jl")

function main()
  fun(x :: Float64) = x ^ 2 - x - 5
  funPrim(x :: Float64) = 2 * x - 1
  delta::Float64 = 1e-4
  epsilon::Float64 = 1e-4
  x0, val, it, err = mstycznych(fun, funPrim, 4.0, delta, epsilon, 10)
  @assert(x0 < delta || val < epsilon)
  @assert(err == 0)
  println("Test passed")

  fun2(x :: Float64) = 5
  fun2Prim(x :: Float64) = 0
  x0, val, it, err = mstycznych(fun2, fun2Prim, 4.0, delta, epsilon, 10)
  @assert(err == 2)
end

main()