# Print the first n numbers of the fibonacci sequence

## get n from user input
print("How many numbers would you like? ")
n = int(readline(STDIN))

## print the numbers
println("Printing the first $n numbers of the fibonacci sequence.")
using Catalan #requires the package Catalan (Pkg.add("Catalan"))
for x=1:n
  println(fibonacci(x))
end
