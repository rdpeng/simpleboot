\name{plot.lm.simpleboot}

\alias{plot.lm.simpleboot}

\title{
  Plot method for linear model bootstraps.
}

\usage{
\method{plot}{lm.simpleboot}(x, add = FALSE, ...)
}

\description{
  Plot regression lines with bootstrap standard errors.  This method
  only works for 2-D regression fits.
}

\arguments{
  \item{x}{An object of class \code{"lm.simpleboot"} returned by
    \code{lm.boot}.}
  \item{add}{Switch indicating whether the regression line should be
    added to the current plot.}
  \item{...}{Additional arguments passed down to \code{plot}.  Ignored
    if \code{add = TRUE}.}
}

\details{
  This function plots the data and the original regression line fit
  along with +/- 2 bootstrap standard errors at locations specified by
  the \code{new.xpts} argument to \code{lm.boot} (or on an evenly spaced
  grid).
}


\author{Roger D. Peng}

\value{
  Nothing is returned.
}

\examples{
## None right now
}

\keyword{regression}
