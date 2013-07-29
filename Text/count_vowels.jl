type VowelCount
  total::Int
  a::Int
  e::Int
  i::Int
  o::Int
  u::Int
end
VowelCount() = VowelCount(0,0,0,0,0,0)

function vowelcounts(str::String)
  result = VowelCount()
  for c in str
    c == 'a' ? result.a += 1 :
    c == 'e' ? result.e += 1 :
    c == 'i' ? result.i += 1 :
    c == 'o' ? result.o += 1 :
    c == 'u' ? result.u += 1 :
    nothing
  end
  result.total = sum([result.a,result.e,result.i,result.o,result.u])
  return result
end

print("Enter a string: ")
str = strip(readline())
counts = vowelcounts(str)
println("In \"$str\", there are $(counts.total) vowels.")
for s in (:a,:e,:i,:o,:u)
  println("There are $(counts.(s)) $(s)'s.")
end

