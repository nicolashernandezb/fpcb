rk <-
function(grid, sigma = 1, r, tol = 1e-8) {
  p <- length(grid)
  K <- exp(- sigma * outer(grid, grid, "-")^2 )
  if(missing(r)) {                     # if r is missing then propose one
    values <- svd(K, nu = 0, nv = 0)$d #no need of eigenvectors here
    r <- length(values[values > tol])
  }
  svd <- svd(K, nu = r, nv = 0)   # svd con nv = 0 es mucho + rapido
  return(list(grid = grid,
              K = K,
              D = diag(svd$d[1:r],nrow=r),
              U = svd$u))
}
