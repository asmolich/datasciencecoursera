if (!file.exists("data")){
    dir.create("data")
}
csvUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(csvUrl, destfile="./data/housing2006.csv", method="curl")

housing <- read.csv("./data/housing2006.csv")
q1 <- sum(housing$VAL == 24, na.rm = TRUE)

xlsxUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(xlsxUrl, destfile="./data/gas.xlsx", method="curl")

library(xlsx)
gas <- read.xlsx("./data/gas.xlsx", sheetIndex=1, header=TRUE, startRow=18, endRow=23, colIndex=7:15)
q3 <- sum(gas$Zip*gas$Ext,na.rm=T)

xmlUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(xmlUrl, destfile="./data/restaurants.xml", method="curl")

library(XML)
doc <- xmlTreeParse("./data/restaurants.xml", useInternal=TRUE)
root <- xmlRoot(doc)
q4 <- sum(xpathSApply(root, "//zipcode", xmlValue) == 21231)
