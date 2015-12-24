# read data
data <- read.csv("hw1_data.csv")
# names of column
names(data)
#print 1st 2 rows
data[1:2,]
#print last 2 rows
data[152:153,]
tail(data)
#extract 47th value of ozone 
data[47,1]
#mean of ozone values
oz <- data[,1] 
missing <- is.na(oz)
oz[missing]
nomis <- oz[!missing]
tot <- sum(nomis)
av <- tot/(153-37)
#mean of temp values from row 32 to 61
t <- data[,4]
tgap <-t[32:61]
mean <- sum(tgap)/length(tgap)
#maximum ozone value in the month of May
omax <- may[which.max(data[1:31,1])]
#data frame where Ozone values are above 31 & Temp values are above 90. What is the mean of Solar.R in this subset?
d1 <- subset(data, Ozone>31 & Temp>90)
meen <- mean(d1[,2])
