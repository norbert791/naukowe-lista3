#author
include("zad1.jl")

f(x) = exp(x) - 3 * x

function main()
  res = mbisekcji(f, -1.0, 1.0, 1e-4, 1e-4)
  println(res)
end

main()