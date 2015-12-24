#function calling format
#directory="/home/kannan/coursera/Rprog/specdata/" 
#threshold: some integer
corr<- function (directory, threshold=0)
{ 
  #get dataframe that cotains ids & no_of_cc
  nococ<- complete(directory)
  #apply threshold to no_of_cc  
  tnococ<-subset(nococ, nococ[,2]>threshold)
  #store thresholded ids
  tnids<-numeric(0)
  tnids<-tnococ[,1]   
  #initialise cor vector
  kor<-numeric(0)
  for (i in tnids)
    {
      filepath<- paste(directory, "/", formatC(i, width=3, flag="0"),".csv",sep="")
      data <- read.csv(filepath)
      #omit missing values
      data<-na.omit(data)
      co<-cor(data[,2],data[,3])
      kor<- c(kor, co)
    }
  #Return a vector of correlations for the monitors that meet 
  #the threshold requirement.
  kor
}   
