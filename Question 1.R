download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "housing.csv", method=curl)
a<-read.csv("housing.csv")
agricultureLogical <- ifelse(a$ACR == "3" & a$AGS == "6", TRUE, FALSE)
aa <- a[which(agricultureLogical==TRUE),]
head(aa)

##answer is 125, 238, 262