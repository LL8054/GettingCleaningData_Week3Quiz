download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "q2.jpg", method="curl", mode="wb")
a <- readJPEG("q2.jpg", native=TRUE)
quantile(a,probs=c(.3,.8))

## answer is -15259150 for 30% and -10575416 for 80%.  