\name{loess.boot}
\alias{loess.boot}
\alias{print.loess.uclaboot}

\title{
  2-D Loess bootstrap.
}

\usage{
loess.boot(lo.object, R, rows = TRUE, new.xpts = NULL, ngrid = 100,
           weights = NULL)
}

\description{
  Bootstrapping of loess fits produced by the \code{loess} function in
  the \code{modreg} package.  Bootstrapping can be done by resampling
  rows from the original data frame or resampling residuals from the
  original model fit.
}

\arguments{
  \item{lo.object}{A loess fit, produced by \code{loess}.}
  \item{R}{The number of bootstrap replicates.}
  \item{rows}{Should we resample rows?  Setting \code{rows} to
    \code{FALSE} indicates resampling of residuals.}
  \item{new.xpts}{Locations where new predictions are to be made.  If
    \code{new.xpts} is \code{NULL}, then an evenly spaced grid spanning
    the range of X (containing \code{ngrid} points) is used.  In either
    case}
  \item{ngrid}{Number of grid points to use if \code{new.xpts} is
    \code{NULL}.}
  \item{weights}{Resampling weights; a vector with length equal to the
    number of observations.}
}

\value{
  An object of class \code{"loess.uclaboot"} (which is a list)
  containing the elements:
  \item{method}{Which method of bootstrapping was used (rows or
    residuals).}
  \item{boot.list}{A list containing values from each of the bootstrap
    samples.  Currently, only residual sum of squares and fitted values
    are stored.}
  \item{orig.loess}{The original loess fit.}
  \item{new.xpts}{The locations where predictions were made (specified
    in the original call to \code{loess.boot}).}
}

\details{
  The user can specify locations for new predictions through
  \code{new.xpts} or an evenly spaced grid will be used.  In either
  case, fitted values at each new location will be stored from each
  bootstrap sample.  These fitted values can be retrieved using either
  the \code{fitted} method or the \code{samples} function.

  Note that the \code{loess} function has many parameters for the user
  to set that can be difficult to reproduce in the bootstrap setting.
  Right now, the user can only specify the \code{span} argument to
  \code{loess} in the original fit.  
}


\author{Roger D. Peng}

\keyword{loess}

\examples{
set.seed(1234)

x <- runif(100)

## Simple sine function simulation
y <- sin(2*pi*x) + .2 * rnorm(100)
plot(x, y)  ## Sine function with noise
lo <- loess(y ~ x, span = .4)

## Bootstrap with resampling of rows
lo.b <- loess.boot(lo, R = 500)

## Plot original fit with +/- 2 std. errors
plot(lo.b)

## Plot all loess bootstrap fits
plot(lo.b, all.lines = TRUE)

## Bootstrap with resampling residuals
lo.b2 <- loess.boot(lo, R = 500, rows = FALSE)
plot(lo.b2)

}
