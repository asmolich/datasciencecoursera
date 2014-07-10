rankall <- function(outcome, num = "best") {
    ## Read outcome data
    data_path <- "rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv"
    data <- read.csv(data_path, colClasses="character")

    ## Check that outcome is valid
    outcomeNames <- c("heart attack", "heart failure", "pneumonia")
    if(!(outcome %in% outcomeNames)) {
        stop("invalid outcome")
    }
    nums <- c("best", "worst")
    if(!is.numeric(num) && !(num %in% nums)) {
        stop("invalid num")
    }
 
    outcomes <- c(11,17,23)
    names(outcomes) <- outcomeNames
    index <- outcomes[outcome]
    data[,index] <- as.numeric(data[,index])
 
    ## For each state, find the hospital of the given rank
    state <- sort(unique(data$State))
    hospital <- unlist(lapply(state, function(s){
        st <- data[data$State == s,]
        o <- order(st[[index]], st$Hospital.Name)
        i <- if(is.numeric(num)){o[num]}
        else if(num == "best"){o[1]}
        else {o[sum(!is.na(st[[index]]))]}
        st[i,]$Hospital.Name
    }))
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    data.frame(hospital, state, row.names = state)
}
