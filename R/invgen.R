invgen <-
function(A, tol=1e-05){
  spa <- eigen(A, symmetric = T)
  p <- ncol(A)
  ind <- (1:p)[spa$values > tol] # eigen values that are not zero
  #  print(paste("[@invgen]:", length(ind), "out of", p, ">0"))
  U <- spa$vectors
  U <- U[, ind]
  if(length(ind) > 1) {
    B <- U %*% diag(1/spa$values[ind]) %*% t(U)
  } else {
    B <- 1 / spa$values[ind] * as.matrix(U) %*%
      t(as.matrix(U))
  }
  B
}
