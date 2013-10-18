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
  blue  = "\033[34m"
  black = "\033[0m"
  green = "\033[32m"
  bold  = "\033[1m"

  inmatchuntil = 0
  incaptureuntil = 0
  print(black)
  for (i,c) in enumerate(text)
    j = findfirst(m.offsets,i)
    if i == m.offset || j != 0
      print(j != 0 ? green : blue)
      if j != 0
         incaptureuntil = i + length(m.captures[j])
      end
      if i == m.offset
         inmatchuntil = i + length(m.match)
      end
    elseif inmatchuntil == i
      print(black)
    elseif incaptureuntil == i
      print(inmatchuntil > i ? blue : black)
    end
    print(c)
  end
  println(black)
end

#no match => no output
  

