\name{fdata_rkhs}
\alias{fdata_rkhs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{functional data in rkhs}
\description{
Representing functinal data using Reproducing Kernel Hilbert Spaces. Approximate each curve with a smooth function using a kernel function.
}
\usage{
fdata_rkhs(curves, rk, gamma = 1e-5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{curves}{a data matrix with observations (curves) in rows and the discretizations points in columns.}
  \item{rk}{kernek function rk object.}
  \item{gamma}{regularization parameter. Defaoult value = 1e-5.}
}
\details{
With this function each function can be represented with a vector in R^d.
}
\value{
\item{data}{input curves.}
\item{fdata}{smoothed curves.}
\item{lambda}{coefficients of the (stable) and d dimensional RKHS representation.}
\item{alpha}{coefficients of the RKHS expansion.}
\item{gamma}{regularization parameter.}
}
\references{
A. Muñoz, J. González,  Representing functional data using support vector machines,  Pattern Recog-nition Letters 31 (2010) 511–516.
}
\author{N. Hernández and J. Cugliari}
\examples{
t = 1:50
curves = matrix(sin(t)+rnorm(length(t)),nrow=1)
f.data <- fdata_rkhs(curves, rk = rk(t,sigma = 0.01))
plot(t,curves, xlab='time', ylab='PM10 dataset', col='gray', lty=1, type='b')
lines(t,f.data$fdata, col='blue', lty=1)
}

