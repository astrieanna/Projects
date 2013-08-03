# Pkg2.add("ArgParse")
using ArgParse

s = ArgParseSettings()
@add_arg_table s begin
  "filename"
    help = "a filename from which to read in text"
    arg_type = String
    required = true
end
args = parse_args(s)

# get words
f = open(args["filename"],"r")
str = readall(f)
words = split(str)

# count words
counts = Dict{String,Int}()
for w in words
  w = lowercase(w)
  counts[w] = get(counts,w,0) + 1
end

# get top 5 most common words
counts = [(k,v) for (k,v) in counts]
sort!(counts;by=(x->x[2]))
top5 = [pop!(counts) for x=1:(min(5,length(counts)))]
top5 = map(x->repr(x[1]),top5)
top5[end] = "and $(top5[end])"

# print summary
println("There are $(length(words)) words in that file.")
println("The five most used words are: $(join(top5,", ")).")

