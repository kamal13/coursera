#function calling format
#directory="/home/kannan/coursera/Rprog/specdata/" 
#id=1:332
complete<- function (directory, id=1:332)
{ 
  # intialising no of complete cases(cc)
  nocc<- numeric(0)
  for (i in id)
    { 
      #read files
      filepath<- paste(directory, "/", formatC(i, width=3, flag="0"),".csv", sep="")
      data <- read.csv(filepath) 
      #compute no of cc
      nocc<- c(nocc, sum(complete.cases(data))) 
    }
  #Return a data frame where the first column is the name of the file and the 
  #second column is the number of complete cases.
  data.frame(id=id,nobs=nocc)
}
