#Happy Numbers 
# A happy number is defined by the following process:
#  Starting with any positive integer,
#  replace the number by the sum of the squares of its digits,
#  and repeat the process until the number equals 1 (where it will stay),
#  or it loops endlessly in a cycle which does not include 1.

# Those numbers for which this process ends in 1 are happy numbers,
# while those that do not end in 1 are unhappy numbers.
# Find first 8 happy numbers.

# Pkg2.add("ArgParse")
using ArgParse

s = ArgParseSettings()
@add_arg_table s begin
    "count"
        help = "how many happy numbers do you want?"
        arg_type = Int
        default = 8
end

function ishappynumber(n::Int)
  if n < 0 error("Only natural numbers can be happy.") end

  if n == 0 | 1 < n < 10 return false end
  #println("n=$n")
  while n >= 10
    n = sum(map(x->x*x,digits(n)))
    #println("\tnn=$n")
  end
  return n == 1
end

args = parse_args(s)
count = args["count"]

happy_numbers = Int[]
next = 1
while length(happy_numbers) < count
  if ishappynumber(next)
    push!(happy_numbers,next)
  end
  next += 1
end

println("The first $count happy numbers are $happy_numbers.")

