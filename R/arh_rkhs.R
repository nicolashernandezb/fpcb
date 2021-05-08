arh_rkhs <-
function(fdata) { # this will be called as the 'model'
  n <- nrow(fdata$fdata)
  lambda.me   <- colMeans(fdata$lambda)
  lambda.cent <- sweep(fdata$lambda, 2, lambda.me)
  
  # operators
  Covariance = t(lambda.cent) %*% (lambda.cent) / n
  Cross.Cov  = t(lambda.cent[2:n,]) %*% (lambda.cent[1:(n-1),]) / (n - 1)
  rho = Cross.Cov %*% invgen(Covariance)
  return(list(fdata = fdata,
              lambda_cent = lambda.cent,
              lambda_me   = lambda.me,
              rho = rho))
}
