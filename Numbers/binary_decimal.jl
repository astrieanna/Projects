# Binary to Decimal and Back Converter
# Develop a converter to convert a decimal number to binary
# or a binary number to its decimal equivalent.

# convert from a binary string to a decimal value
function binary_to_decimal(binary::String)
  decimal = 0
  index = 0
  for (i,c) in enumerate(reverse(binary))
    decimal += c == '1' ? (2^(i-1)) : 0
  end
  return decimal
end

# print the menu and collect an answer
println( 
"1. Binary to Decimal
2. Decimal to Binary")
print("Make a choice: ")
choice = int(readline(STDIN))

if choice == 1
  print("Please enter a binary number to convert: ")
  binary = strip(readline(STDIN))
  #validate input: only zeros and ones
  for c in binary
    if !contains(['1','0'],c) error("Invalid binary digit: $c") end
  end
  decimal = binary_to_decimal(binary)
  println("The binary number $binary in decimal is $decimal")
elseif choice == 2
  print("Please enter a decimal number to convert: ")
  decimal = int(readline(STDIN))
  binary = base(2,decimal)
  println("The decimal number $decimal in binary is $binary")
else
  error("Invalid choice")
end
