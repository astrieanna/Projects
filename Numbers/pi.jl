# Find pi to the nth digit

n = 0
if length(ARGS) == 0
  ## Get n from user input (STDIN)
  print("Please enter an integer: ")
  n = int(readline(STDIN))
elseif length(ARGS) == 1
  n = int(ARGS[1])
else
  error("Invalid number of arguments. Either provide one or zero integers.")
end

## Find pi to nth digit
short_pi = round(pi,n-1) #doesn't work for n > 15

## Print to STDOUT
print("The first $n digits of pi: ")
println(short_pi)
