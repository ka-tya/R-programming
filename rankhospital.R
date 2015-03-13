rankhospital<- function(state, outcome, num = "best"){

files <-list.files("HD", full.names = T)
outcomes <- read.csv(files[3],colClasses = "character")
suppressWarnings(outcomes[, 11] <- as.numeric(outcomes[, 11]))
suppressWarnings(outcomes[, 17] <- as.numeric(outcomes[, 17]))
suppressWarnings(outcomes[, 23] <- as.numeric(outcomes[, 23]))
outcomes <- outcomes[,c(2,7,11,17,23)]
names(outcomes) <-c("hospital","state","heart attack","heart failure", "pneumonia")
states <-outcomes$state
if (!(state %in% states)){
stop("invalid state")}
if (!(outcome %in% names(outcomes[3:5]))){
stop("invalid outcome")}


selected<-na.omit(outcomes[outcomes$state== state, c("hospital",outcome)])
ordered <-selected[order(selected[,outcome], selected[,"hospital"]),]

if (num == "best") {
num <- 1}
if (num == "worst"){
 num <- nrow(ordered)
 }
if (num > nrow(ordered)){
 return("NA") }
 

ordered[num,]$hospital


}
rankhospital("MD", "heart attack", 50)
