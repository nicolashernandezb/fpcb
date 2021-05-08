\name{invgen}
\alias{invgen}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generalized inverse
%%  ~~function to do ... ~~
}
\description{Computes a regularized inverse of a square matrix using eigen decomposition
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
invgen(A, tol=1e-05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{A}{A square m x m matrix}
  \item{tol}{A tolerance to keep the first d eigenvalues of A. Default = 1e-05.}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
The generalized inverse of A.
}
%%\references{
%% ~put references to the literature/web site here ~
%%}
\author{J. Cugliari}
%%\note{
%%  ~~further notes~~
%%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%%}
\examples{
A<-matrix(rnorm(100),nrow=10)
invgen(A)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
