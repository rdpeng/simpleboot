\name{pairs.boot}
\alias{pairs.boot}

\title{
  Two sample bootstrap.
}

\usage{
pairs.boot(x, y = NULL, FUN, R, student = FALSE, M, weights = NULL, ...)
}

\description{
  \code{pairs.boot} is used to bootstrap a statistic which operates on
  two samples and returns a single value.  An example of such a
  statistic is the correlation coefficient (i.e. \code{cor}).
  Resampling is done pairwise, so \code{x} and \code{y} must have the
  same length (and be ordered correctly).  One can alternatively pass a
  two-column matrix to \code{x}.
}

\arguments{
  \item{x}{Either a vector of numbers representing the first sample or a
    two column matrix containing both samples.}
  \item{y}{If NULL it is assumed that \code{x} is a two-column matrix.
    Otherwise, \code{y} is the second sample.}
  \item{FUN}{The statistic to bootstrap.  If \code{x} and \code{y} are
    separate vectors then \code{FUN} should operate on separate
    vectors.  Similarly, if \code{x} is a matrix, then \code{FUN} should
    operate on two-column matrices.  \code{FUN} can be either a quoted
    string or a function name.}
  \item{R}{The number of bootstrap replicates.}
  \item{student}{Should we do a studentized bootstrap?  This requires a
    double bootstrap so it might take longer.}
  \item{M}{If \code{student} is set to \code{TRUE}, then \code{M} is the
    number of internal bootstrap replications to do.}
  \item{weights}{Resampling weights.}
  \item{...}{Other (named) arguments that should be passed to \code{FUN}.}
}

\value{
  An object of class \code{"simpleboot"}, which is almost identical to the
  regular \code{"boot"} object.  For example, the \code{boot.ci}
  function can be used on this object.
}

\examples{
set.seed(1)
x <- rnorm(100)
y <- 2 * x + rnorm(100)
boot.cor <- pairs.boot(x, y, FUN = cor, R = 1000)
boot.ci(boot.cor)

## With weighting
set.seed(20)
w <- (100:1)^2
bw <- pairs.boot(x, y, FUN = cor, R = 5000, weights = w)
boot.ci(bw, type = c("norm", "basic", "perc"))
}

\keyword{univar}

\author{Roger D. Peng}
