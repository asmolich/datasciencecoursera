if (!file.exists("data")){
    dir.create("data")
}
csvUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(csvUrl, destfile="./data/housing2006.csv", method="curl")

housing <- read.csv("./data/housing2006.csv")

agricultureLogical <- housing$ACR == 3 & housing$AGS == 6
print(which(agricultureLogical)[1:3])
print('==============')

library(jpeg)
jpegUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(jpegUrl, destfile="./data/jeff.jpg", method="curl")

image <- readJPEG("./data/jeff.jpg", native=TRUE)
print(quantile(image, probs = c(0.3, 0.8)))
print('==============')

gdpUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(gdpUrl, destfile="./data/gdp.csv", method="curl")
eduUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(eduUrl, destfile="./data/edu.csv", method="curl")

gdp <- read.csv("./data/gdp.csv", header = FALSE, skip = 5, stringsAsFactors = FALSE,
                col.names=c("CountryCode", "Ranking", "X1", "Country", "USD", "X2", "X3", "X4", "X5", "X6"))
gdp <- gdp[1:231,c("CountryCode", "Ranking", "Country", "USD")]
gdp$USD[gdp$USD == "" | gdp$USD == ".."] <- NA
gdp$Ranking <- as.integer(gdp$Ranking)
gdp_raw <- gdp
gdp$USD <- as.integer(gsub(",", "", gdp$USD))
gdp <- gdp[complete.cases(gdp),]

edu <- read.csv("./data/edu.csv", stringsAsFactors = FALSE)
edu <- edu[,c("CountryCode", "Income.Group")]
edu_raw <- edu

x <- merge(gdp, edu)

res <- x[order(x$Ranking, decreasing = TRUE),]
print(dim(res)[1])
print(res[13,])
print('==============')

avgOECD <- mean(x[x$Income.Group == "High income: OECD",]$Ranking, na.rm = TRUE)
avgNonOECD <- mean(x[x$Income.Group == "High income: nonOECD",]$Ranking, na.rm = TRUE)
print(avgOECD)
print(avgNonOECD)
print('==============')

res <- table(x$Income.Group, cut(x$Ranking, breaks=quantile(x$Ranking, prob=seq(0, 1, length=6))), useNA = c("no"))
print(res)

