#author: Norbert Jaśniewicz

include("zad1.jl")
include("zad2.jl")
include("zad3.jl")

f(x) = x - (0.5 * x) ^ 2
fp(x) = 1 - 0.5 * x

function stringRow(name :: String, p::NTuple{4, Any})
  return "$name,$(p[1]),$(p[2]),$(p[3]),$(p[4])"
end

function main()
  delta = 5e-6
  eps = delta
  res1 = mbisekcji(f, 1.5, 2.0, delta, eps)
  res2 = mstycznych(f, fp, 1.5, delta, eps, 100)
  res3 = msiecznych(f, 1.0, 2.0, delta, eps, 100)
  println("method,root,f(root),it,err")
  println(
  """
  $(stringRow("bisection", res1))
  $(stringRow("newton", res2))
  $(stringRow("secant", res3))
  """)
end

main()
