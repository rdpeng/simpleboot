\name{loess.simpleboot.methods}

\alias{fitted.loess.simpleboot}

\title{
  Methods for loess bootstrap.
}

\usage{
\method{fitted}{loess.simpleboot}(object, ...)
}

\description{
  Methods for \code{"loess.simpleboot"} class objects.
}

\arguments{
  \item{object}{An object of class \code{"loess.simpleboot"} as
    returned by the function \code{loess.boot}.}
  \item{...}{Other arguments passed to and from other methods.}
}

\details{
  \code{fitted} returns a n x R matrix of fitted values where n is the
  number of new locations at which predictions were made and R is the
  number of bootstrap replications used in the original loess
  bootstrap.  This is the equivalent of calling \code{samples(object,
    "fitted")}.
}

\author{Roger D. Peng}

\value{
  Nothing is returned.
}


\keyword{loess}
