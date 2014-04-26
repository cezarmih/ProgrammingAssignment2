##This is a test file for makeCacheMatrix(x) and cacheSolve(x)

source("cacheMatrix.R")

m <-rnorm(64, mean = 1000, sd = 250)
dim(m) <- c(8,8)
m

mc <- makeCacheMatrix(m)
mc
im <- cacheSolve(mc)
im
im <- cacheSolve(mc)
im
