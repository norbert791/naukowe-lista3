#author: Norbert Jaśniewicz

include("methods.jl")

function main()
  fun(x :: Float64) = x ^ 2 - x - 5
  delta::Float64 = 1e-4
  epsilon::Float64 = 1e-4
  x0, val, it, err = msiecznych(fun, 5.0, 4.0, delta, epsilon, 10)
  @assert(x0 < delta || val < epsilon)
  @assert(err == 0)
  println("Test passed")

  fun2(x :: Float64) = 5
  x0, val, it, err = msiecznych(fun2, 5.0, 4.0, delta, epsilon, 10)
  @assert(err == 1)
end

main()