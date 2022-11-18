#author Norbert Jaśniewicz

function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
  v :: Float64 = f(x0)
  if abs(v) < epsilon
    return (x0, v, 0, 0)
  end

  for k in 1:maxit
    temp :: Float64 = pf(x0)
    if temp < delta
      return (x0, v, k, 2)
    end

    x1 :: Float64 = x0 - v / pf(x0)
    v = f(x1)
    if abs(x1 - x0) < delta || abs(v) < epsilon
      return x0, v, k, 0
    end
    x0 = x1 
  end

  return x0, v, maxit, 2
end
  