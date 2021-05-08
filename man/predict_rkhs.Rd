\name{predict_rkhs}
\alias{predict_rkhs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Predict functional time series using ARH RKHS.}
\description{using an ARH of order 1 obtain 1 step ahead forecast and 1-\eqn{alpha} predictive confidence bands for the forecasted function.}
\usage{
predict_rkhs(model, newdata, bands=FALSE, B=100, level=0.95, kvec=round(sqrt(2*B)))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{a arh_rkhs object containing the functional objects and the lambda coefficients of the d dimensional RKHS representation and the autocorrelation operator.}
  \item{newdata}{an optional data frame in which to look for variables with which to predict. If missing, the fitted values are used.}
  \item{bands}{logical variable indicating if the predictive confidence band is computed. Default = FALSE.}
  \item{B}{number of bootstrap replicates for the band construction. Needed if bands = TRUE. Default = 100.}
  \item{level}{confidence level for the band construction. Needed if bands = TRUE. Default = 0.95.}
  \item{kvec}{number of neighbour points to consider in the computation of the minimum entropy set.}
}
\value{
\item{forecast}{1 step ahead forecast.}
\item{fitted}{fitted values.}
\item{UB}{upper bound of the 1-\eqn{alpha} predictive confidence band.}
\item{LB}{lower bound of the 1-\eqn{alpha} predictive confidence band.}
\item{bootsrap.pred}{bootstrap pseudo replicates.}
\item{bootsrap.pred.inband}{bootstrap pseudo replicates included in the 1-\eqn{alpha} predictive confidence band.}
\item{res}{estimation residuals.}

}
\references{
N. Hernández, J. Cugliari, J. Jacques. Simultaneous Predictive Bands for Functional Time Series using Minimum Entropy Sets. 2021. -Submited-.
}
\author{N. Hernández and J. Cugliari}
