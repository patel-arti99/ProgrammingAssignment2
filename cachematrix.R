## Put comments here that give an overall description of what your
## functions do

## These functions are useful for matrix inversions because they make the
## computations easier by caching the data



## Write a short comment describing this function

## This function allows a matrix to cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(solveMatrix) m <<- solveMatrix
  getInverse <- function() m
  list(set = set, get = get, setInverse = setInverse, 
       getInverse = getInverse)
}


## Write a short comment describing this function

## This function then takes the cached data from the above function and 
## solves for its inverse

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setInverse(m)
  m
}
