function main()
  x = 2 # the first prime
  while true
    while !isprime(x) x += 1 end # keep checking numbers until we find a prime
    println(x)
    if !printmore() return end # ask if we should continue
    x += 1
  end
end

function printmore()
  print("Would you like the next prime number? (y/n)[y] ")
  line = readline(STDIN)
  return contains(["y","yes",""],lowercase(strip(line)))
end

main()
