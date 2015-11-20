## makeCacheMatrix function  
## This function takes a matrix and creates a list containing the function to
## 1. set the matrix
## 2. get the matrix
## 3. set the inverse of the matrix
## 4. get the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() 
  {
    x
  }
  setinverse <- function(solve) 
  {
    m <<- solve
  }
  getinverse<- function() 
  {
    m
  }
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)  ## returns the list of function
}

## cacheSolve function calculate the inverse of the input matrix.
## It will check if the inverse was calculated first. 
## If the inverse matrix was calculated already, it shows the message "getting cached data" and returns the cached inverse.
## If the inverse matrix has not been calculated, it calculates the inverse of the matrix.
cacheSolve <- function(x, ...) {
  m <- x$getinverse() ## get inverse from themakeCacheMatrix function
  if(!is.null(m)) {
    message("getting cached data") ## prints "getting cached data" 
                                  ## and returns the cached inverse if inverse has been calculated
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...) ## calculates the inverse in the case that the inverse has not been calculated
  x$setinverse(m)
  m
  ## Return a matrix that is the inverse of 'x'
  
}
