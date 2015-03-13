best <- function(state, outcome){

files <-list.files("HD", full.names = T)

outcomes <- read.csv(files[3],colClasses = "character")

suppressWarnings(outcomes[, 11] <- as.numeric(outcomes[, 11]))

suppressWarnings(outcomes[, 17] <- as.numeric(outcomes[, 17]))

suppressWarnings(outcomes[, 23] <- as.numeric(outcomes[, 23]))

outcomes <- outcomes[,c(2,7,11,17,23)]

states <- unique(outcomes$State)

names(outcomes) <-c("hospital","state","heart attack","heart failure", "pneumonia")

if (!(state %in% states))

{ stop("invalid state")}

if (!(outcome %in% names(outcomes[3:5]))){

stop("invalid outcome")}

 

 

selectState<-outcomes[outcomes$state== state, c("hospital",outcome)]

#selectState <- selectState[-grep("Not Available", selectState[,2]),]

head(selectState)

selectState[which.min(selectState[,outcome]),"hospital"]

 

}

best("MD","heart attack")
