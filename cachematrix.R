## Matrix inversion is a costly operation.
##In order to avoid the re-computation of an already existing matrix inverse, two functions are provided:
## makeCacheMatrix(mx), a "constructor" function providing four methods to be used subsequently
##cacheSolve(mx,...) accepts as arguments the list produced by makeCacheMatrix and checks if the matrix inversion is present.
##In case it exists, it will return the cached version, otherwise will compute the inverse and return it.
# It is supposed that the matrix argument provided to the constructor is a square inversable matrix

## This is a matrix & inverse "constructor" function

makeCacheMatrix <- function(mx = matrix()) {
      im <- NULL
      set <- function(y){
            mx <<- y
            im <<- NULL
      }
      get <- function() mx
      setinverse <-function(inverse) im <<- inverse
      getinverse <- function() im
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## This is a function checking the existence of an inverse for a matrix provided as argument to the makeCacheMatrix constructor


cacheSolve <- function(mx, ...){
      im <- mx$getinverse()
      if(!is.null(im)){
            message("getting cached data")
            return(im)
      }
      data <- mx$get()
      im <- solve(data)
      mx$setinverse(im)  
      im
}