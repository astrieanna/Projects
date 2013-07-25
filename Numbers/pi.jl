# Find pi to the nth digit

## Get n from user input (STDIN)
print("Please enter an integer: ")
n = int(readline(STDIN))

## Find pi to nth digit
short_pi = round(pi,n-1) #doesn't work for n > 15

## Print to STDOUT
print("The first $n digits of pi: ")
println(short_pi)
