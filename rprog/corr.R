corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    files <- paste0(directory, "/", list.files(path = directory))
    res <- lapply(files, function(file) {
        csv <- read.csv(file, colClasses=c("Date","numeric","numeric","numeric"))
        if (sum(complete.cases(csv)) > threshold) {
            x <- csv[complete.cases(csv),]
            cor(x$sulfate, x$nitrate, use = "complete.obs")
        }
    })
    result <- unlist(res)
    if (is.null(result)) {
        numeric()
    } else {
        result
    }
}