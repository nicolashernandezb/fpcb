fdata_rkhs <-
function(curves, rk, gamma = 1e-5) {  # this will be called as 'fdata'
  p      <- ncol(curves)
  alpha  <- curves %*% solve(diag(gamma, p) + rk$K)
  lambda <- alpha %*% rk$U %*% sqrt(rk$D)
  fdata  <- lambda %*% t(rk$U %*% sqrt(rk$D))
  return(list(data   = curves,
              rk     = rk,
              alpha  = alpha,
              lambda = lambda,
              gamma  = gamma,
              fdata  = fdata))
}
