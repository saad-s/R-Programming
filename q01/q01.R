# set working dir
setwd ("/Users//mac/Coursera//r-programming//r-programming-repo//q01")

# read csv file provided
airq <- read.csv ("hw1_data.csv")

#q11
print(colnames (airq))

#q12
print(airq[1:2, ])

#q13
print(nrow (airq))

#q14
print(airq[152:153, ])

#q15
print(airq$Ozone[47]) 
#airq[["Ozone"]][[47]]
#airq[[1]][[47]]
#airq[[1]][47]

#q16
print(sum(is.na(airq$Ozone)))

#q17
print(mean(airq$Ozone[!is.na(airq$Ozone)]))

#q18
solarm <- airq$Solar.R[(airq$Ozone > 31) & (airq$Temp > 90)]
solarm <- solarm[!is.na (solarm)]
print(mean (solarm))

#q19
print(mean (airq$Temp[airq$Month == 6]))

#q20
ozonemax <- airq$Ozone[airq$Month == 5]
ozonemax <- ozonemax[!is.na (ozonemax)]
print(max (ozonemax))
