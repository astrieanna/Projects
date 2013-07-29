
# Pkg2.add("ArgParse")
using ArgParse
s = ArgParseSettings()
@add_arg_table s begin
  "price"
    help = "price in dollars"
    arg_type = Float64
    required = true
  "tax"
    help = "tax percentage"
    arg_type = Float64
    required = true 
end

s = parse_args(s)
subtotal = round(s["price"],2)
tax_percent = s["tax"]
tax_cost = round(subtotal * (tax_percent/100),2)
total = tax_cost + subtotal

#splitting this line doesn't seem to be allowed :-/
@printf "A %s%% tax on \$%.2f will result in \$%.2f of tax, for a total of \$%.2f.\n" "$tax_percent" subtotal tax_cost total
