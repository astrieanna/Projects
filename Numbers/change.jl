# Change Return Program - The user enters a cost and
# then the amount of money given. The program will figure
# out the change and the number of quarters, dimes, nickels,
# pennies needed for the change.

print("What's the cost in dollars? ")
cost = float(readline(STDIN))
print("What's how much have they paid in dollars? ")
given = float(readline(STDIN))

# it's important to translate to ints as soon as possible
# to avoid precision issues
cost = int(100cost)
given = int(100given)

change = given - cost

if change < 0
  println("\nPlease ask for \$$(-change/100) more from the customer.")
else
  println("\nThe change is \$$(change/100).")
 
  (q,change) = change >= 25 ? divrem(change,25) : (0,change)
  (d,change) = change >= 10 ? divrem(change,10) : (0,change)
  (n,change) = change >=  5 ? divrem(change, 5) : (0,change)
  (p,change) = change >=  1 ? (change,0) : (0,change)


  println("Give the following change to the customer:")
  println("Quarters: $q\tDimes: $d\tNickels: $n\tPennies: $p")
end
    # DEBUG
    # print "Total change per the number of coins is %.2f" % \
    #       ((q * .25) + (d * .10) + (n * 0.05) + (p * 0.01))
