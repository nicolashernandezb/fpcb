
# fpcb -- Functional Predictive Confidence Bands

<!-- badges: start -->
[![R-CMD-check](https://github.com/nicolashernandezb/fpcb/workflows/R-CMD-check/badge.svg)](https://github.com/nicolashernandezb/fpcb/actions)
<!-- badges: end -->

fpcb provides estimation and prediction functions for autoregressive Hilbert processes of order one within the framework of reproducing kernel Hilbert spaces.

## Installation

You can install the released version of fpcb from [CRAN](https://CRAN.R-project.org) with :

``` r
install.packages("fpcb")
```

Or install the development version from GitHub with:
``` r
# install.packages("remotes")
remotes::install_github("nicolashernandezb/fpcb")
```


## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(fpcb)
require(ftsa)
t            <- seq(0, 1,length.out = nrow(ftsa::pm_10_GR$y)) 
kernel       <- fpcb::rk(grid = t, r=10, sigma = 0.01)
data         <- t(sqrt(ftsa::pm_10_GR$y))
fd.curves    <- fpcb::fdata_rkhs(curves = data, rk = kernel)
model        <- fpcb::arh_rkhs(fd.curves)
#POINT PREDICTION 
predict.rkhs <- fpcb::predict_rkhs(model, bands=F)
matplot(t,t(data), xlab='time', ylab='PM10 dataset', col='gray', lty=1, type='l')
matlines(t,t(fd.curves$fdata), col='blue', lty=1)
lines(t,predict.rkhs$forecast,col='red',lty=1,lwd=1.5)
legend("topright",lty=1, col=c('gray','blue','red'), legend=c('PM10 curves','PM10 smoothed curves','Point Forecast (n+1)'))
#PREDICTIVE BANDS
predict.rkhs <- fpcb::predict_rkhs(model, bands=T, B = 1000, level = 0.95)
matplot(t,t(data), xlab='time', ylab='PM10 dataset', col='gray', lty=1, type='l')
lines(t,predict.rkhs$forecast,col='red',lty=1,lwd=1.5)
lines(t,predict.rkhs$UB,col='blue',lty=2,lwd=1.5)
lines(t,predict.rkhs$LB,col='blue',lty=2,lwd=1.5)
legend("topright",lty=c(1,1,2), col=c('gray','red','blue'), legend=c('PM10 curves','Point Forecast (n+1)','95% Conf. Band'))
```

