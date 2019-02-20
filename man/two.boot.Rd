\name{two.boot}
\alias{two.boot}

\title{
  Two sample bootstrap of differences between univariate statistics.
}

\usage{
two.boot(sample1, sample2, FUN, R, student = FALSE, M, weights = NULL, ...)
}

\description{
  \code{two.boot} is used to bootstrap the difference between various
  univariate statistics.  An example is the difference of means.
  Bootstrapping is
  done by independently resampling from \code{sample1} and \code{sample2}.
}

\arguments{
  \item{sample1}{First sample; a vector of numbers.}
  \item{sample2}{Second sample; a vector of numbers.}
  \item{FUN}{The statistic which is applied to each sample.  This can be
    a quoted string or a function name.}
  \item{R}{Number of bootstrap replicates.}
  \item{student}{Should we do a studentized bootstrap?  This requires a
    double bootstrap so it might take longer.}
  \item{M}{If \code{student} is set to \code{TRUE}, then \code{M} is the
    number of internal bootstrap replications to do.}
  \item{weights}{Resampling weights; a list with two components.  The
    first component of the list is a vector of weights for
    \code{sample1} and the second component of the list is a vector of
    weights for \code{sample2}.}
  \item{...}{Other (named) arguments that should be passed to
    \code{FUN}.}
}

\details{
  The differences are always taken as \code{FUN(sample1) -
    FUN(sample2)}.  If you want the difference to be reversed you need
  to reverse the order of the arguments \code{sample1} and
  \code{sample2}.
}
\value{
  An object of class \code{"simpleboot"}, which is almost identical to the
  regular \code{"boot"} object.  For example, the \code{boot.ci}
  function can be used on this object.
}

\examples{
library(boot)
set.seed(50)
x <- rnorm(100, 1)  ## Mean 1 normals
y <- rnorm(100, 0)  ## Mean 0 normals
b <- two.boot(x, y, median, R = 100)
hist(b)  ## Histogram of the bootstrap replicates
b <- two.boot(x, y, quantile, R = 100, probs = .75)
}

\keyword{univar}

\author{Roger D. Peng}
