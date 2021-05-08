entropy <-
function(X,alpha=2,K,scale=F)  {
  # Parameters: alhpa and k (parametro de delta-localidad)
  X=as.matrix(X)
  if(scale==T){X=scale(X)}else{X=X}
  n  =  dim(X)[1]
  Knn.distances = FNN::knn.dist(X, k=K)
  v_k = as.matrix(rowMeans(Knn.distances),ncol=1)
  l.entropy=log(1+v_k^alpha)/abs(1-alpha)
  entropy=log(sum(1+v_k^alpha))/abs(1-alpha)
  return(list(local.etropy=l.entropy,
              entropy=entropy))
}
