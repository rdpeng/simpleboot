\name{hist.uclaboot}

\alias{hist.uclaboot}

\title{
  Histograms for bootstrap sampling distributions.
}

\usage{
\method{hist}{uclaboot}(x, do.rug = FALSE, xlab = "Bootstrap samples", main = "", ...)
}

\description{
  Construct a histogram of the bootstrap distribution of univariate
  statistic.
}

\arguments{
  \item{x}{An object of class \code{"uclaboot"} returned from either
    \code{one.boot}, \code{two.boot}, or \code{pairs.boot}.}
  \item{do.rug}{Should a rug of the bootstrap distribution be plotted
    under the histogram?}
  \item{xlab}{The label for the x-axis.}
  \item{main}{The title for the histogram.}
  \item{...}{Other arguments passed to \code{hist}.}
}

\value{
  Nothing is returned.
}

\details{
  \code{hist} constructs a histogram for the bootstrap distribution of a
  univariate statistic.  It cannot be used with linear model or loess
  bootstraps.  In the histogram a red dotted line is plotted denoting
  the observed value of the statistic.
}

\author{Roger D. Peng}

\keyword{hplot}

\examples{
x <- rnorm(100)

## Bootstrap the 75th percentile
b <- one.boot(x, quantile, R = 1000, probs = 0.75)
hist(b)
}
