\name{perc}
\alias{perc}
\alias{perc.lm}

\title{
  Extract percentiles from a bootstrap sampling distribution.
}

\usage{
perc(boot.out, p = c(0.025, 0.975))
perc.lm(lm.boot.obj, p)
}

\description{
  \code{perc} can be used to extract percentiles from the sampling
  distribution of a statistic.
}

\arguments{
  \item{boot.out}{Output from either \code{one.boot}, \code{two.boot},
    or \code{pairs.boot}.}
  \item{p}{numeric vector with values in [0, 1].}
  \item{lm.boot.obj}{An object of class \code{"lm.uclaboot"},
    returned from \code{lm.boot}.}
}

\details{
  \code{perc} automatically calls \code{perc.lm} if \code{boot.out} is
  of the class \code{"lm.uclaboot"} so there is no need to use
  \code{perc.lm} separately.
}


\value{
  For bootstraps which are not linear model bootstraps, \code{perc}
  returns a vector of percentiles of length
  \code{length(p)}.  Linear interpolation of percentiles is done if
  necessary.  \code{perc.lm} returns a matrix of percentiles
  of each of the model coefficients.  For example, if there are k model
  coefficients, the \code{perc.lm} returns a \code{length(p)} by k matrix.
}

\examples{
x <- rnorm(100)
b <- one.boot(x, median, R = 1000)
perc(b, c(.90, .95, .99))
}

\keyword{univar}
  
\author{Roger D. Peng}
