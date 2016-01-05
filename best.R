# state<-"TX"
# outcome<- "heart failure"
# source("best.R") 
# best("TX","heart failure")
best<-function(state, outcome)
{
  #read full data
  dat<-read.csv("outcome-of-care-measures.csv", stringsAsFactors=FALSE)
  #required col
  outcomes<-c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
  #validate the state
  states<-dat[,7]
  s_valid<-is.element(state,states)
  if (s_valid==FALSE)
    { stop("invalid state")}
  #validate the outcome
  oc_valid<-is.element(outcomes[outcome],outcomes)
  if (oc_valid==FALSE)
    { stop("invalid outcome")}
  #subset 3 required col data
  data<-dat[,c(2,7,outcomes[outcome])]
  #subset w.r.t required state
  st_data<-subset(data, State==state) 
  #find min of outcome(i.e.mortality rate)
  suppressWarnings(min_mor<-min(as.numeric(st_data[,3]), na.rm=TRUE))
  #find its row no
  min_loc<-grep(min_mor,st_data[,3])
  #find the hospis in that rows
  BHS<-as.character(st_data[min_loc,1])
  #the best hospital
  s<-sort(BHS)
  s[1]
}
