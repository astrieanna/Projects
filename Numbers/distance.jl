# Distance Between Two Cities - Calculates the distance between
# two cities and allows the user to specify a unit of distance.
# This program may require finding coordinates for the cities
# like latitude and longitude.

# Uses the Haversine formula
# (http://www.movable-type.co.uk/scripts/latlong.html)

# Dependencies:
# Pkg2.clone("https://github.com/astrieanna/geojl")
using geojl
# Pkg2.add("Units")
using Units

# you can get a API key for free from MapQuest
client = MapQuest.MapQuestClient("Fmjtd|luub200znl,7l=o5-9ur0du")

print("Enter a city or address: ")
addr1 = strip(readline())
print("Enter another city or address: ")
addr2 = strip(readline())
print("Which units would you like the answer in?(km/mi) ")
un = lowercase(strip(readline()))

# handle unit answer
if !contains(["km","mi"],un)
  error("Invalid units requested")
elseif un == "km"
  un = Unit(Kilo,Meter)
else #mi
  un = Unit(Mile)
end

loc1 = MapQuest.simple_geocode(client,addr1)
loc2 = MapQuest.simple_geocode(client,addr2)

(lat1,lon1) = (degrees2radians(loc1.latitude),degrees2radians(loc1.longitude))
(lat2,lon2) = (degrees2radians(loc2.latitude),degrees2radians(loc2.longitude))

# start haversne formula:
dlon = lon2 - lon1
dlat = lat2 - lat1
a = (sin(dlat/2) ^ 2) + cos(lat1) * cos(lat2) * (sin(dlon/2) ^2)
c = 2atan2(sqrt(a), sqrt(1 - a))
R = 6373 # km
d = R * c
d = Quantity(Kilo,Meter,d)
d = convert(un,d)

println("Distance between $addr1 and $addr2 is $d")

