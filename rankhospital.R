# state<-"TX"
# outcome<- "heart failure"
# source("rankhospital4.R")
# rankhospital4("TX","heart failure", 4)
rankhospital<-function(state, outcome, num="best")
{ 
  #read full data
  dat<-read.csv("outcome-of-care-measures.csv", stringsAsFactors=FALSE, na.strings=c("Not Available"))
  #required col
  outcomes<-c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
  #validate the state
  states<-dat[,7]
  s_valid<-is.element(state,states)
  if (s_valid==FALSE)
    { stop('invalid state')}
  #validate the outcome
  oc_valid<-is.element(outcomes[outcome],outcomes)
  if (oc_valid==FALSE)
    { stop('invalid outcome')}
  #subset 3 required col data
  data<-dat[,c(2,7,outcomes[outcome])]
  #subset w.r.t required state
  st_data<-subset(data, State==state) 
  #rank the outcomes (ie.lowest is 1st) with new rank col
  rr_data<-st_data
  #order hs & outcome values in ascending order
  nr_data<-rr_data[order((rr_data[,3]),(rr_data[,1])),]
  #remove NA in the dataframe
  nnr_data<-nr_data[complete.cases(nr_data),]
  #validate num
  if(num=="best")
  { num<-1 }
  else if(num=="worst")
  { num<-length(nnr_data[,1]) }
  else if(!(num<=length(nnr_data[,1])))
  {
   print(NA) 
  }
  #rank hospitals
  nnr_data$rank<-rank(nnr_data[,3], ties.method = "first") 
  #find the hospis in the given rank
  hlist<- nnr_data[,1]
  hlist[which(nnr_data[,4]==num)]
}
