\name{lm.simpleboot.methods}

\alias{summary.lm.simpleboot}
\alias{print.summary.lm.simpleboot}
\alias{fitted.lm.simpleboot}

\title{
  Methods for linear model bootstrap.
}

\usage{
\method{summary}{lm.simpleboot}(object, ...)
\method{print}{summary.lm.simpleboot}(x, ...)
\method{fitted}{lm.simpleboot}(object, ...)
}

\description{
  Methods for \code{"lm.simpleboot"} class objects.  
}

\arguments{
  \item{object}{An object of class \code{"lm.simpleboot"}, as returned by
    \code{lm.boot}.}
  \item{x}{An object of class \code{"summary.lm.simpleboot"}, a result of
    a call to \code{summary.lm.simpleboot}.}
  \item{...}{Other arguments passed to and from other methods.}
}

\details{
  \code{print} is essentially the same as the usual
  printing of a linear model fit, except the bootstrap standard errors
  are printed for each model coefficient.

  \code{fitted} returns the fitted values from each
  bootstrap sample for the predictor values specified by the
  \code{new.xpts} in \code{lm.boot} (or from the grid if \code{new.xpts}
  was not specified).  This is a p x R matrix where p is the number of
  points where prediction was desired and R is the number of bootstrap
  samples specified.  Using \code{fitted} is the equivalent
  of using \code{samples(object, name = "fitted")}.
}

\value{
  \code{summary} returns a list containing the original
  estimated coefficients and their bootstrap standard errors.
}

\seealso{
  \code{lm.boot}.
}

\examples{
data(airquality)
attach(airquality)
lmodel <- lm(Ozone ~ Wind + Solar.R)
lboot <- lm.boot(lmodel, R = 300)
summary(lboot)
}

\keyword{regression}

\author{Roger D. Peng}
