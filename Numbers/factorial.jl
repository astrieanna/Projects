#Factorial Finder - The Factorial of a positive integer, n,
#is defined as the product of the sequence n, n-1, n-2, ...1
#and the factorial of zero, 0, is defined as being 1. Solve
#this using both loops and recursion.

function fact_loop(n)
    fact = 1
    while n > 0
        fact *= n
        n -= 1
    end
    return fact
end

function fact_recursion(n)
    return n == 0 ? 1 : n * fact_recursion(n - 1) 
end

n = 0
if length(ARGS) == 0
  print("Please enter a positive number: ")
  n = BigInt(int(readline(STDIN)))
elseif length(ARGS) == 1
  n = int(ARGS[1])
else
  error("Too many commandline args. Please enter zero or one integer.")
end

if n >= 0
   println("Factorial of $n by loops is $(fact_loop(n))")
   println("Factorial of $n by recursion is $(fact_recursion(n))")
   println("Factorial of $n by built-in is $(factorial(n))")
else
    println("Not a valid number")
end
