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

# turns a word that may have punctuation into piglatin
function piglatinwithpunctuation(word::String)
  words = split(word,"-")
  out = String[] 
  for word1 in words
    w = collect(word1) #Vector{Char}
    # TODO: there must be a string function for doing this
    # TODO: should also grab punctuation prefix
    ending = Char[] 
    while length(w) > 0 && contains(".,;:!?#&",w[end])
      push!(ending,pop!(w))
    end
    w = join(w)
    ps = join(ending)
    push!(out, "$(piglatin(w))$ps")
  end
  join(out,"-")
end

# expected to just be letters
vowels = collect("aeiou")
function piglatin(word::String)
  if word == ""
    ""
  elseif contains(vowels,word[1])
    "$(word)way"
  else
    n = search(word,vowels)
    n = n > 0 ? n : search(word,'y')
    if n > 0 "$(join(word[n:end]))$(word[1:n-1])ay"
    else word end
  end
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
words = map(piglatinwithpunctuation,words)
println(join(words," ")) 
