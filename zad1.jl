#author: Norbert Jaśniewicz

function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
  u :: Float64 = f(a)
  v :: Float64 = f(b)
  counter = 0
  if (sign(u) == sign(v))
    return 0, 0, 0, 1
  end
  
  e :: Float64 = (b - a) / 2.0
  w :: Float64 = f(e)

  while abs(e) > delta && abs(w) > epsilon
    c :: Float64 = a + e
    w = f(c)
    if sign(w) != sign(u)
      b = c
      u = w
    else
      a = c
      u = w
    end
    e /= 2.0
    counter += 1
  end

  return a + e, w, counter, 0
end
