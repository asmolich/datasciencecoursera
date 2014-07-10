rankhospital <- function(state, outcome, num = "best") {
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
    nums <- c("best", "worst")
    if(!is.numeric(num) && !(num %in% nums)) {
        stop("invalid num")
    }
    
    outcomes <- c(11,17,23)
    names(outcomes) <- outcomeNames
    index <- outcomes[outcome]
    data[,index] <- as.numeric(data[,index])

    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    st <- data[data$State == state,]
    o <- order(st[[index]], st$Hospital.Name)
    i <- if(is.numeric(num)){o[num]}
        else if(num == "best"){o[1]}
        else {o[sum(!is.na(st[[index]]))]}
    st[i,]$Hospital.Name
}