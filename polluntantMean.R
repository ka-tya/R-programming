pollutantmean <- function(directory, pollutant, id = 1:332) {
files <-list.files(directory, full.names = T)
selectedFiles <- files[id]
df<-lapply(selectedFiles, read.csv)
output <- do.call(rbind,df)

mean(output[,pollutant], na.rm=T)
}
pollutantmean ("specdata","nitrate", 70:72)
