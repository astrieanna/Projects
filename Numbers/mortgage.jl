# Mortgage Calculator 
# Calculate the monthly payments of a fixed term mortgage
# over given N terms at a given interest rate.

#Pkg2.add("ArgParse")
using ArgParse

s = ArgParseSettings()
@add_arg_table s begin
    "principle"
        help = "how much money are you borrowing (dollars)"
        arg_type = Float64
        required = true
    "years"
        help = "how many years are there in the fixed term of the mortgage"
        arg_type = Int
        required = true
    "interest"
        help = "annual interest rate"
        arg_type = Float64
        required = true
end

args = parse_args(s)
years = args["years"]
months = 12years                  #N
interest = args["interest"]
monthly_interest = 0.01interest/12 #r
principle = args["principle"]     #P

r = monthly_interest
n = months
p = principle
monthly_payment = ceil((p*r*(1+r)^n) / (((1+r)^n) -1),2)

println("Your mortgage is $years years long " *
        "with a $interest% annual interest rate")
println("It will take you $months payments " *
        "of $monthly_payment to pay it off")
