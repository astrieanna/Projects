vigenere_table = Dict{Char,Array{Char,1}}()
alpha = [char(x + 'a') for x=0:25] #lowercase alphabet
for x=1:26
  vigenere_table[alpha[1]] = copy(alpha)
  push!(alpha,shift!(alpha))
end

function print_vigenere()
  values = sort(collect(vigenere_table))
  for (k,v) in values
    println("$k : $v")
  end
end

# Pkg2.add("ArgParse")
using ArgParse
s = ArgParseSettings()
@add_arg_table s begin
  "key"
    help = "key to use in cipher"
    arg_type = String
    required = true
  "file"
    help = "text to encode"
    arg_type = String
    required = true
end

args = parse_args(s)
key = lowercase(args["key"])
l = length(key)
intext = lowercase(readall(open(args["file"],"r")))
outtext = Char[] 
for i in 1:length(intext)
  if contains(alpha,intext[i])
    push!(outtext,vigenere_table[key[i%length(key)]][intext[i] - 'a' + 1])
  else
    push!(outtext,intext[i])
  end
end
#outtext = [contains(alpha,intext[i]) ? vigenere_table[key[i%l]][intext[i]-'a'+1] : c  for i in 1:length(intext)]
println(String(outtext))


