if (!file.exists("data")){
    dir.create("data")
}
csvUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(csvUrl, destfile="./data/housing2006.csv", method="curl")
housing <- read.csv("./data/housing2006.csv")
q1 <- strsplit(names(housing), "wgtp")[123]

gdpUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(gdpUrl, destfile="./data/gdp.csv", method="curl")
gdp <- read.csv("./data/gdp.csv", header = FALSE, skip = 5, stringsAsFactors = FALSE,
                                col.names=c("CountryCode", "Ranking", "X1", "Country", "USD", "X2", "X3", "X4", "X5", "X6"))
gdp <- gdp[1:231,c("CountryCode", "Ranking", "Country", "USD")]
gdp$USD[gdp$USD == "" | gdp$USD == ".."] <- NA
gdp$Ranking <- as.integer(gdp$Ranking)
gdp_raw <- gdp
gdp$USD <- as.integer(gsub(",", "", gdp$USD))
gdp <- gdp[complete.cases(gdp),]
q2 <- mean(gdp$USD)
q3 <- gdp[grep("^United",gdp$Country),]

eduUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(eduUrl, destfile="./data/edu.csv", method="curl")

edu <- read.csv("./data/edu.csv", stringsAsFactors = FALSE)
edu <- edu[,c("CountryCode", "Special.Notes")]

q4 <- length(grep("^Fiscal year end: June", edu$Special.Notes))

q51 <- length(grep("^2012-", sampleTimes))
q52 <- sum(weekdays(sampleTimes[grep("^2012-", sampleTimes)]) == "Monday")
