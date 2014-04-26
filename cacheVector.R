makeVector <- function(x = numeric()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setmean <- function(mean) m <<- mean
      getmean <- function() m
      list(set = set, get = get,
           setmean = setmean,
           getmean = getmean)
}

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

cachemean <- function(x, ...) {
      m <- x$getmean()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- mean(data, ...)
      x$setmean(m)
      m
}

cacheinverse <- function(mx, ...){
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