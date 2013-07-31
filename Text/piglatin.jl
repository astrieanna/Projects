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
args = parse_args(s)
println(args)
str = args["word"] != nothing ? args["word"] :
      args["file"] != nothing ? args["file"] :
      begin
        println(ArgParse.usage_string(s)) 
        error("please provide a word or a file (see --help)")
      end

println("$(str[2:end])$(str[1])ay") 
