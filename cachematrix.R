## Below are two functions:makeCacheMatrix and cacheSolve.
## These two functions are used to cache the inverse of the matrix.

## makeCacheMatrix creates a special 'matrix',which is really a list
## containing a function to
## 1.set the value of the matrix
## 2.get the value of the matrix
## 3.set the value of the inverse of the matrix
## 4.get the value of the inverse of the matrix 
makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i<<-inverse 
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## cacheSolve: This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.
## The matrix is always ausumed invertible.

cacheSolve <- function(x) {
 i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <-solve(data)
        x$setsolve(i)
        i       
 ## Return a matrix that is the inverse of 'x'
}
