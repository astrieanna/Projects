print("What is the price (\$) per square foot? ")
price = float(readline(STDIN))

print("What is the width of the floor in feet? ")
width = float(readline(STDIN))

print("What is the length of the floor in feet? ")
length = float(readline(STDIN))

area = width * length
println("It will cost \$$(area*price) to cover $area sq. feet.")
