function request_float()
  print("Enter a number: ")
  float(readline())
end

function op2function(op::String)
  op == "+" ? (+) :
  op == "-" ? (-) :
  op == "*" ? (*) :
  op == "/" ? (/) :
  op == "%" ? (%) :
  error("Invalid operator $op")
end  

function calculate(n1)
  println("$n1 _ _ = _")
  
  print("Enter an operator (+,-,*,/,%): ")
  opstr= strip(readline())
  op = op2function(opstr)
  println("$n1 $opstr _ = _")

  n2 = request_float()
  n3 = op(n1,n2)
  println("$n1 $opstr $n2 = $n3\n")
  n3
end

n1 = request_float()

while true
  n1 = calculate(n1)

  print("Enter '0' to exit: ")
  resp = strip(readline())
  if resp == "0" return end
end
