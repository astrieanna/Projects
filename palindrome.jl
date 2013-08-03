# Pkg2.add("ArgParse")
using ArgParse
s = ArgParseSettings()
@add_arg_table s begin
  "candidate"
    help = "the string that might be a palindrome"
    arg_type = String
    required = true
end
args = parse_args(s)

function ispalindrome(str::String)
  rev = reverse(str)
  rev == str
end

function ispalindrome!(str::Vector{Char})
  while length(str) >= 2
    if !(shift!(str) == pop!(str))
      return false
    end
  end
  return true
end

not = ispalindrome(args["candidate"]) ? "" : " not"
println("$(repr(args["candidate"])) is$not a palindrome")
