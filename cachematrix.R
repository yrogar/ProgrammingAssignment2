## These two functions are going to cache the value of the inverse of a matrix
## so that when we need it again, it can be looked up in the cache rather than
## recomputed.

## This function takes as argument a matrix and creates a special object which  
## is really a list containing a function to:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of the matrix
## 4. get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- funcion() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## This function calculates the inverse of the special "matrix" created with
## the above function. But first, it checks to see if the inverse has already
## been calculated. If so, it gets the inverse from the cache and skips the
## computation. If not, it calculates the inverse of the matrix an sets it in
## the cache via the setsolve function.

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
