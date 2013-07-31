# Pkg2.add("ArgParse")
using ArgParse
s = ArgParseSettings()
@add_arg_table s begin
  "--word", "-w"
  help = "a word to translate to pig latin"
  arg_type = String
  "--file", "-f"
  help = "a file of text to translate to pig latin"
  arg_type = String
end

function piglatin(word::String)
  words = split(word,"-")
  out = String[] 
  for word1 in words
    w = collect(word1) #Vector{Char}
    ending = Char[] 
    while contains(".,;:!?#&",w[end])
      push!(ending,pop!(w))
    end
    ps = join(ending)
    push!(out, "$(join(w[2:end]))$(w[1])ay$ps")
  end
  join(out,"-")
end

args = parse_args(s)
println(args)
str = args["word"] != nothing ? args["word"] :
      args["file"] != nothing ? readall(open(args["file"])) :
      begin
        println(ArgParse.usage_string(s)) 
        error("please provide a word or a file (see --help)")
      end
words = split(lowercase(strip(str)))
words = map(piglatin,words)
println(join(words," ")) 
