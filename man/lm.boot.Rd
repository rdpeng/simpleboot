\name{lm.boot}
\alias{lm.boot}
\alias{print.lm.simpleboot}


\title{
  Linear model bootstrap.
}

\usage{
lm.boot(lm.object, R, rows = TRUE, new.xpts = NULL, ngrid = 100,
        weights = NULL)
}

\description{
  Bootstrapping of linear model fits (using \code{lm}).  Bootstrapping
  can be done by either resampling rows of the original data frame or
  resampling residuals from the original model fit.
}

\arguments{
  \item{lm.object}{A linear model fit, produced by \code{lm}.}
  \item{R}{The number of bootstrap replicates to use.}
  \item{rows}{Should we resample rows?  Setting \code{rows} to
    \code{FALSE} indicates resampling of residuals.}
  \item{new.xpts}{Values at which you wish to make new
    predictions.  If specified, fitted values from each bootstrap sample
    will be stored.}
  \item{ngrid}{If \code{new.xpts} is \code{NULL} and the regression is 2
    dimensional, then predictions are made on an evenly spaced grid
    (containing \code{ngrid} points)
    spanning the range of the predictor values.}
  \item{weights}{Reseampling weights; a vector of length equal to the
    number of observations.}
}

\value{
  An object of class \code{"lm.simpleboot"} (which is a list) containing the
  elements:
  \item{method}{Which method of bootstrapping was used (rows or
    residuals).}
  \item{boot.list}{A list containing values from each of the bootstrap
    samples.  Currently, bootstrapped values are model coefficients,
    residual sum of squares, R-square, and fitted values for predictions.}
  \item{orig.lm}{The original model fit.}
  \item{new.xpts}{The locations where predictions were made.}
  \item{weights}{The resampling weights.  If none were used, this
    component is \code{NULL}}
}

\details{
  Currently, \code{"lm.simpleboot"} objects have a simple \code{print}
  method (which shows the original fit), a \code{summary} method and a
  \code{plot} method.
}


\seealso{
  The \code{plot.lm.simpleboot} method.
}


\author{Roger D. Peng}

\keyword{regression}

\examples{
data(airquality)
attach(airquality)
set.seed(30)
lmodel <- lm(Ozone ~ Wind)
lboot <- lm.boot(lmodel, R = 1000)
summary(lboot)

## With weighting
w <- runif(nrow(model.frame(lmodel)))
lbootw <- lm.boot(lmodel, R = 1000, weights = w)
summary(lbootw)

## Resample residuals
lboot2 <- lm.boot(lmodel, R = 1000, rows = FALSE)
summary(lboot2)
}
