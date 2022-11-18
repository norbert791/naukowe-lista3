#author: Norbert Jaśniewicz

function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
  fa = f(x0); fb = f(x1)
  for k in 1:maxit
    if abs(fa) > abs(fb)
      x1, x0 = x0, x1
      fa, fb = fb, fa
    end
    s :: Float64 = (x1 - x0) / (fb - fa)
    x1 = x0
    fb = fa
    x0 = x0 - fa * s
    fa = f(x0)
    if abs(x1 - x0) < delta || abs(fa) < epsilon
      return x0, fa, maxit, 0
    end
  end
  return x0, fa, maxit, 1
end 