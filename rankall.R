rankall <- function( outcome,num="best"){
files <-list.files("HD", full.names = T)
outcomes <- read.csv(files[3],colClasses = "character")
suppressWarnings(outcomes[, 11] <- as.numeric(outcomes[, 11]))
suppressWarnings(outcomes[, 17] <- as.numeric(outcomes[, 17]))
suppressWarnings(outcomes[, 23] <- as.numeric(outcomes[, 23]))
outcomes <- outcomes[,c(2,7,11,17,23)]
names(outcomes) <-c("hospital","state","heart attack","heart failure", "pneumonia")
if (!(outcome %in% names(outcomes[3:5]))){
stop("invalid outcome")}


selected<-na.omit(outcomes[, c("hospital","state", outcome)])
ordered <-selected[order(selected[,outcome], selected[,"state"], selected[,"hospital"]),]

if (num == "best") {
num <- c(1:10)}
if (num == "worst"){
 num <- c(nrow(ordered)-10:nrow(ordered))
 }
if (num > nrow(ordered)){
 return("NA") }
 


subset(ordered[num,c("hospital", "state")])

}
head(rankall("heart attack", "best"),10)
