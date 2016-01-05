# state<-"AK"
# num<-20
# outcome<- "heart attack"
# source("rankall1.R")
# rankall("heart attack", 20)
rankall<-function(outcome, num="best")
{ 
  #o/p dataframe initialise
#  ro<-data.frame(hospital=character(), state=character())
  ho<-character(0)
  #read full data
  dat<-read.csv("outcome-of-care-measures.csv", stringsAsFactors=FALSE, na.strings=c("Not Available"))
  p1<-dat
  #required col
  outcomes<-c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
  #validate the state
  #states<-dat[,7]
  #s_valid<-is.element(state,states)
  #if (s_valid==FALSE)
  #  { stop('invalid state')}
  #validate the outcome
  oc_valid<-is.element(outcomes[outcome],outcomes)
  if (oc_valid==FALSE)
    { stop('invalid outcome')}
  #state vector
  uni<-unique(dat[,7])  
  p2<-uni
  se<-sort(uni)
  p3<-se
  for (i in 1:length(se))
  {
    #subset 3 required col data
    data<-dat[,c(2,7,outcomes[outcome])]
    p4<-data 
    #subset w.r.t required state
    state<-se[i]
    p5<-state
    st_data<-subset(data, State==state)
    p6<-st_data
    #rank the outcomes (ie.lowest is 1st) with new rank col
    rr_data<-st_data
    #order hs & outcome values in ascending order
    nr_data<-rr_data[order((rr_data[,3]),(rr_data[,1])),]
    p7<-nr_data
    #remove NA from the outcome values
    nnr_data<-nr_data[complete.cases(nr_data[,3]),]
    p77<-nnr_data
    #remove NA from the hospitals col
    nnr_data<-nnr_data[complete.cases(nnr_data[,1]),]
    p8<-nnr_data
    #rank hospitals
    nnr_data$rank<-rank(nnr_data[,3], ties.method = "first") 
    p9<-nnr_data
    p99<-length(p9[,3])
    #validate num
    if(num=="worst")
    { 
    w<-length(nnr_data[,1])
    p10<-p99
    nu<-w
    }
    else if(num=="best")
    { nu<-1 }
    else 
    {nu=num}
    #extract the row with h name and s name % store the row 
    if((nu %in% nnr_data[,4])==TRUE)
    { 
     p11<-nu
     ho=c(ho, nnr_data[nu,1])
    }
    else
    { 
     ho=c(ho,"<NA>")
    } 
  }
#ho
#nu
data.frame(hospital=ho,state=se)
}  
