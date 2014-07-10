best <- function(state, outcome) {
    ## Read outcome data
    data_path <- "rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv"
    data <- read.csv(data_path, colClasses="character")

    ## Check that state and outcome are valid
    outcomeNames <- c("heart attack", "heart failure", "pneumonia")
    if(!(outcome %in% outcomeNames)) {
        stop("invalid outcome")
    }
    if(!(state %in% data$State)) {
        stop("invalid state")
    }
    outcomes <- c(11,17,23)
    names(outcomes) <- outcomeNames
    index <- outcomes[outcome]
    data[,index] <- as.numeric(data[,index])

    ## Return hospital name in that state with lowest 30-day death rate
    st <- data[data$State == state,]
    y <- min(st[[index]], na.rm = TRUE)
    x <- st[!is.na(st[[index]]) & st[[index]] == y,]
    min(x$Hospital.Name)
}
