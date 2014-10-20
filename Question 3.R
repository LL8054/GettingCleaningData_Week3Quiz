download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile="GDP.csv", method="curl")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="educational.csv", method="curl")
GDPwhole <- read.csv("GDP.csv")
edu <- read.csv("educational.csv")
GDP[which(GDP$Gross.domestic.product.2012 > 0),]
merged <- merge(GDP, edu, by.x="X", by.y="CountryCode", all=TRUE)