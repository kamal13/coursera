#makeCacheMatrix function stores 4 functions
#They are: set, get, setinv, getinv
makeCacheMatrix<- function(x=matrix())
{  
  i<-NULL
  #set is a function that changes the matrix stored in the main function
  set<- function(y)
  {
    x<<-y
    i<<-NULL
  }
  #get is a function that returns the matrix x stored in the main fuction
  get<-function() 
  x
  #setinv and getinv are functions similar to set and get, they don't calculate
  #the inverse but simply store the value of the input in a variable i
  #into the main function makeCacheMatrix(setinv) and return it (getinv)
  setinv<- function(inv) 
  i<<-inv
  getinv<- function() 
  i
  #this list stores the 4 functions
  list(set=set, get=get, setinv=setinv,getinv=getinv)
}
      


#cacheSolve function first verifies the value of i, stored previously with 
#getinv. if it exists and is not NULL, it returns the message "getting cached 
#inv matrix" and simply returns the value i
cacheSolve <- function(x) 
{
  i <- x$getinv()
  if(!is.null(i)) 
  {
    message("getting cached inv matrix")
    return(i)
  }
  #if i is NULL, data gets the matrix from the makeCacheMatrix using x$get, i 
  #calculates the inverse of the vector and x$setinv(i) stores it in the object
  #generated assigned with makeCacheMatrix
  data <- x$get()
  i <- solve(data)
  x$setinv(i)
  i
}
