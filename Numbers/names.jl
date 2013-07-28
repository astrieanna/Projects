
#Pkg2.add("ArgParse")
using ArgParse
s = ArgParseSettings()
@add_arg_table s begin
  "number"
     help = "the number to spell out in words"
     arg_type = Int
     required = true
end

function nameteen(d)
  d == 0 ? "ten"  :
  d == 1 ? "eleven"   :
  d == 2 ? "twelve"   :
  d == 3 ? "thirteen" :
  d == 4 ? "fourteen"  :
  d == 5 ? "fifteen"  :
  d == 6 ? "sixteen"   :
  d == 7 ? "seventeen" :
  d == 8 ? "eightteen" :
  d == 9 ? "nineteen"  :
  error("expected digit but got $d") 
end

function namedigit(d)
  d == 0 ? "zero"  :
  d == 1 ? "one"   :
  d == 2 ? "two"   :
  d == 3 ? "three" :
  d == 4 ? "four"  :
  d == 5 ? "five"  :
  d == 6 ? "six"   :
  d == 7 ? "seven" :
  d == 8 ? "eight" :
  d == 9 ? "nine"  :
  error("expected digit but got $d") 
end

function namedigit(t,o)
  ones = (o == 0 ? "" : "-" * namedigit(o))

  t == 0 ? namedigit(o) :
  t == 1 ? nameteen(o) :
  t == 2 ? "twenty$ones" :
  t == 3 ? "thirty$ones" :
  t == 4 ? "forty$ones"  :
  t == 5 ? "fifty$ones" :
  t == 6 ? "sixty$ones" :
  t == 7 ? "seventy$ones" :
  t == 8 ? "eighty$ones" :
  t == 9 ? "ninty$ones" :
  error("expected digit, but got $t")
end

function namedigit(h,t,o)
  h == 0 ? namedigit(t,o) :
  t+o == 0 ? namedigit(h) * " hundred" :
  namedigit(h) * " hundred and " * namedigit(t,o)
end

function namedigit(h::Int,t::Int,o::Int,rest::(Int,Int,Int))
  namedigit(h,t,o) * " thousand and " * namedigit(rest...) 
end

function take!{T}(arr::Array{T,1},i::Int)
  arr2 = T[]
  for x=1:i
    if isempty(arr) return arr2 end
    push!(arr2,pop!(arr))
  end
end

args = parse_args(s)
digs = reverse(digits(args["number"]))

result = ""
while !isempty(digs)
  result = namedigit(take!(digs,3)...) * "??"
end
println(result)
