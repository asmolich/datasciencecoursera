x <- read.fwf("./data/getdata-wksst8110.for",
              widths=c(10, 9, 4, 9, 4, 9, 4, 9, 4), header = FALSE, skip=4)
q5 <- sum(x$V4)
