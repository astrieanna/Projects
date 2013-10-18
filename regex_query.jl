# Regex Query Tool
# Enter a string of text and a regex pattern
# Get any matches from the text or errors in the regular expression.

#Pkg.add("ArgParse")
using ArgParse

s = ArgParseSettings()
@add_arg_table s begin
  "text"
     help = "the source text to match against"
     arg_type = String
     required = true
  "regex"
     help = "regular expression"
     arg_type = String 
     required = true
end

args = parse_args(s)
text = args["text"]
ex = Regex(args["regex"])
m = match(ex,text)

if m != nothing
  blue  =  "\033[34m"
  black =  "\033[0m"
  bold  =  "\033[1m"

  inmatchuntil = 0
  print(black)
  for (i,c) in enumerate(text)
    if i == m.offset
      print("$blue$bold$c")
      inmatchuntil = i + length(m.match)
    elseif inmatchuntil == i
      print("$black$c")
    else
      print(c)
    end
  end
  println(black)
end

#no match => no output
  

