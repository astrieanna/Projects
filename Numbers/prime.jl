print("Please enter an integer: ")
n = int(readline(STDIN))

## find prime factors
factors = Int[]        # make an empty vector of Ints
for p in primes(n)     # primes(n) returns a vector of all primes <= n
  if n % p == 0        # check if p is a factor of n
    push!(factors,p)   # push p onto the end of factors
  end
end

println("The prime factors of $n are $factors.")
