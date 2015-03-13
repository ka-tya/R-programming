makeCacheMatrix <- function(x = matrix()) {
        m <- matrix()  # sets the value of m to NULL (provides a default if cacheSolve has not yet been used)
        set <- function(y) {  #set the value of the matrix
                x <<- y  # caches the inputted matrix so that cacheSolve can check whether it has changed (note this is within the setmatrix function)
                m <<- NULL # sets the value of m (the matrix inverse if used cacheSolve) to NULL
        }
        get <- function() x
        setMatrix <- function(solve) m <<- solve
        getMatrix <- function() m
        list(set = set, get = get,
             setMatrix = setMatrix,
             getMatrix = getMatrix)
}

cacheSolve <- function(x=matrix(), ...) {
# Need to compare matrix to what was there before!
# if an inverse has already been calculated this gets it
    m<-x$getMatrix()
    if(!is.null(m)){ # check to see if cacheSolve has been run before
      message("getting cached data")
      return(m)
    }
# otherwise 
 # run the getmatrix function to get the value of the input matrix
    matrix<-x$get()
    m<-solve(matrix, ...)
    x$setMatrix(m) # run the setmatrix function on the input matrix to cache it

    m m # return the inverse
}
a<-makeCacheMatrix()
a$set(matrix(c(4,2,7,6),2,2))
cacheSolve(a)
