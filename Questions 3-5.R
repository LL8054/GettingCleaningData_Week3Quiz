download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile="GDP.csv", method="curl")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="educational.csv", method="curl")
GDP <- read.csv("GDP.csv")
edu <- read.csv("educational.csv")

//GDP numbers for only ranked countries
GDPrank <- paste(GDP[,2])
GDPsub <- GDP[which(GDPrank > 0),]
merged <- merge(GDPsub, edu, by.x="X", by.y="CountryCode")
merged[,2] <- as.numeric(paste(merged[,2]))
final <- merged[order(-merged[,2]),]

//Answer is 189 IDs match, St. Kitts and Nevis is the 13th country listed.