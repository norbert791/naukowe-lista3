#author: Norbert Jaśniewicz
include("methods.jl")

f1(x::Float64) = exp(1 - x) - 1.0
f2(x::Float64) = x * exp(-x)

f1_p(x::Float64) = -exp(1 - x)
f2_p(x::Float64) = exp(-x) - x * exp(-x)

function main()
  delta::Float64 = 1e-5
  epsilon::Float64 = delta
  a::Float64 = 0.0
  b::Float64 = 2.0
  iterations = 100

  f1_bi = mbisekcji(f1, a, b, delta, epsilon)
  f2_bi = mbisekcji(f2, a, b, delta, epsilon)
  f1_new = mstycznych(f1, f1_p, 0.95, delta, epsilon, iterations)
  f2_new = mstycznych(f2, f2_p, 0.5, delta, epsilon, iterations)
  f1_sec = msiecznych(f1, 0.25, 0.5, delta, epsilon, iterations)
  f2_sec = msiecznych(f2, 0.25, 0.5, delta, epsilon, iterations)

  open("zad6_fun1.csv", "w") do file
    function write_line(name, tup)
      write(file, "$name,$(join(tup,","))\n")
    end
    write(file, "method,root,value,iterations,error\n")
    write_line("bijection", f1_bi)
    write_line("newton", f1_new)
    write_line("secant", f1_sec)
  end

  open("zad6_fun2.csv", "w") do file
    function write_line(name, tup)
      write(file, "$name,$(join(tup,","))\n")
    end
    write(file, "method,root,value,iterations,error\n")
    write_line("bijection", f2_bi)
    write_line("newton", f2_new)
    write_line("secant", f2_sec)
  end
  
  open("zad6_newton_lim_1.csv", "w") do file
    write(file,"x_0,root,value,iterations,error\n")
    start :: Float64 = 2.0
    while (isfinite(start))
      write(file, "$start,$(join(mstycznych(f1, f1_p, start, delta, epsilon, 100), ","))\n")
      start *= 2.0
    end
    write(file, "$start,$(join(mstycznych(f1, f1_p, start, delta, epsilon, 100), ","))\n")
  end

  open("zad6_newton_lim_2.csv", "w") do file
    write(file,"x_0,root,value,iterations,error\n")
    start :: Float64 = 2.0
    while (isfinite(start))
      write(file, "$start,$(join(mstycznych(f2, f2_p, start, delta, epsilon, 100), ","))\n")
      start *= 2.0
    end
  end

  println("Wynik metody stycznych dla x_0 = 1: $(mstycznych(f2, f2_p, 1.0, delta, epsilon, 100))")
end

main()
