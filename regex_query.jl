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
s.description = 
  "The regex will be run on the text.
Matches will be shown in blue;
captures will be shown in green."

args = parse_args(s)
text = args["text"]
ex = Regex(args["regex"])
ms = collect(eachmatch(ex,text))

blue  = "\033[34m"
black = "\033[0m"
green = "\033[32m"
bold  = "\033[1m"

function flatten!(arr,arrs)
  for i in arrs
    for e in i
      push!(arr,e)
    end
  end
  arr
end

if ms != []
  local offset = [m.offset for m in ms] 
  local match = [m.match for m in ms]
  local offsets = flatten!(Int64[],[m.offsets for m in ms])
  local captures = flatten!(Any[],[m.captures for m in ms])

  inmatchuntil = 0
  incaptureuntil = 0

  print(black)
  for (i,c) in enumerate(text)
    j = findfirst(offsets,i)
    k = findfirst(offset,i)
    if k != 0 || j != 0
      print(j != 0 ? green : blue)
      if j != 0
         incaptureuntil = i + length(captures[j])
      end
      if k != 0
         inmatchuntil = i + length(match[k])
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
  

