library(downloader)

//APPLES AND ORANGES
download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/appleorange.csv", destfile="appleorange.csv")
download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/stability.csv", destfile="stability.csv")
aoraw <- read.csv("appleorange.csv", stringsAsFactors=FALSE, header=FALSE)
aodata <- aoraw[3:700,]

//name columns
names(aodata) <- c("country", "countrynumber", "products", "productnumber", "tonnes", "year")
aodata$countrynumber <- as.integer(aodata$countrynumber)


//get rid of nonsense lines
fslines <- which(aodata$country == "Food supply quantity (tonnes) (tonnes)")
aodata <- aodata[(-1 * fslines),]

//tidy up extraneous measurements
aodata$tonnes <- gsub("\xca", "", aodata$tonnes)
aodata$tonnes <- gsub(", tonnes \\(\\)", "", aodata$tonnes)
aodata$tonnes <- as.numeric(aodata$tonnes)

stabilitydataindex$Index <- gsub(", index ()", "", stabilitydataindex$Index)
stabilitydataindex$Index <- gsub("\\(\\)", "", stabilitydataindex$Index)


//fixes year column
aodata$year <- 2009
stabilitydataindex$Year <- 2013

//POLITICAL STABILITY
stability <- read.csv("stability.csv", stringsAsFactors=FALSE, header=FALSE)
stabilitydataindex <- stability[6:424,]
stabilitydatakcal <- stability[428:786,]
stabilitydataper100 <- stability[790:960,]

//name columns
names(stabilitydataindex) <- c("Country", "Value", "Variable", "Region", "Index", "Year")
stabilitydataindex$Value <- as.integer(stabilitydataindex$Value)

//purge nonsense lines
vilines <- which(stabilitydataindex$Country == "Value (index)")
stabilitydataindex <- stabilitydataindex[(-1 * vilines),]
/stabilitydataindex <- subset(stabilitydataindex, select = -c(Variable))

