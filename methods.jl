#author: Norbert Jaśniewicz

function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
  valA :: Float64 = f(a)
  valB :: Float64 = f(b)
  counter = 0
  if (sign(valA) == sign(valB))
    return 0, 0, 0, 1
  end
  
  mid :: Float64 = a + (b - a) / 2.0
  midVal :: Float64 = f(mid)

  while abs(mid - a) > delta && abs(midVal) > epsilon
    if sign(midVal) == sign(valA)
      a = mid
      valA = midVal
    else
      b = mid
      valB = midVal   
    end
    mid = a + (b - a) / 2.0
    midVal = f(mid)
    counter += 1
  end

  return mid, midVal, counter, 0
end

function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
  resultVal :: Float64 = f(x0)
  if abs(resultVal) < epsilon
    return (x0, resultVal, 0, 0)
  end

  for iterationCounter in 1:maxit
    pfValue :: Float64 = pf(x0)
    if abs(pfValue) < eps(Float64)
      return (x0, resultVal, iterationCounter, 2)
    end
    x1 :: Float64 = x0 - resultVal / pfValue
    resultVal = f(x1)
    if abs(x1 - x0) < delta || abs(resultVal) < epsilon
      return x0, resultVal, iterationCounter, 0
    end
    x0 = x1 
  end

  return x0, resultVal, maxit, 1
end

function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
  x0Val = f(x0); x1Val = f(x1)
  for k in 1:maxit
    if abs(x1Val) > abs(x0Val)
      x1, x0 = x0, x1
      x0Val, x1Val = x1Val, x0Val
    end
    diff :: Float64 = (x1 - x0) / (x1Val - x0Val)
    x1, x0 = x1 - x1Val * diff, x1
    x1Val, x0Val = f(x1), x1Val
    if abs(x1 - x0) < delta || abs(x0Val) < epsilon
      return x1, x1Val, k, 0
    end
  end
  return x1, x1Val, maxit, 1
end 