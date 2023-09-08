myDF <- read.csv("/anvil/projects/tdm/data/craigslist/vehicles.csv")
dim(myDF)
str(myDF)
head(myDF)

sum(is.na(myDF$year))
1205/ dim(myDF)[1]
goodyearsDF <- subset(myDF, !is.na(year))
head(goodyearsDF)
missingyearsDF <- subset(myDF, is.na(year))
head(missingyearsDF)

subset(aggregate(price ~ year, data = myDF, FUN = mean), year>2002)
table(myDF$year)[which.max(table(myDF$year))]

tail(sort(table(myDF$region_url)),n=1)
tail(sort(table(myDF$state)),n=3)

myyears <- subset(aggregate(price ~ year, data = myDF, FUN = mean), year>2002)$year
myprices <- subset(aggregate(price ~ year, data = myDF, FUN = mean), year>2002)$price
plot(myyears[myprices<50000],myprices[myprices<50000])
plot(myyears[myprices<50000],myprices[myprices<50000], main = "Prices vs Years" , xlab ="Years", ylab = "Prices")
#Took out the ouliter years
plot(myyears[myprices<50000],myprices[myprices<50000], type = "o", main = "Prices vs Years" , xlab ="Years", ylab = "Prices") 