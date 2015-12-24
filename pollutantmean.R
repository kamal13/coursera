#function calling format
#directory="/home/kannan/coursera/Rprog/specdata/" 
#pollutant="sulfate" or "nitrate"
#id=1:332
pollutantmean <- function (directory, pollutant, id=1:332)
{ 
  #File name
  fids <- paste(formatC(id, width=3, flag="0"), ".csv", sep="")  
  pol_mean<- vector(mode="numeric", length=length(id))
  # to read file
  sum_tot<- 0
  sum_len<- 0
  i<- id[1]
  x<- i
  y<- tail(id, n=1)
  z<-seq(from=x, to=y, by=1)
  for (i in z)
    { 
      filepath<- paste(directory, "/", fids[match(i,z)], sep="")
      data <- read.csv(filepath)
      cnames<- names(data)
      pol_no<- grep(pollutant, cnames)
      #extract/subset the pollutant values
      pol <- data[,pol_no] 
      missing <- is.na(pol)
      nomis <- pol[!missing]
      tot<- sum(nomis)
      #grand sum of complete cases
      sum_tot<- sum_tot+tot
      # grand length of complete cases
      len<- length(nomis)
      sum_len<- sum_len+len
    }
  #Return the mean of the pollutant across all of the monitors, ignoring any 
  #missing values coded as NA.
  pollutantmean<- sum_tot/sum_len
  pollutantmean
}
