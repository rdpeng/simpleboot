\name{one.boot}
\alias{one.boot}
\title{
  One sample bootstrap of a univariate statistic.
}
\usage{
one.boot(data, FUN, R, student = FALSE, M, weights = NULL, ...)
}
\description{
  \code{one.boot} is used for bootstrapping a univariate statistic for
  one sample problems.  Examples include the \code{mean}, \code{median},
  etc.
}
\arguments{
  \item{data}{The data.  This should be a vector of numbers.}
  \item{FUN}{The statistic to be bootstrapped.  This can be either a
    quoted string containing the name of a function or simply the
    function name.}
  \item{R}{The number of bootstrap replicates to use.}
  \item{student}{Should we do a studentized bootstrap?  This requires a
    double bootstrap so it might take longer.}
  \item{M}{If \code{student} is set to \code{TRUE}, then \code{M} is the
    number of internal bootstrap replications to do.}
  \item{weights}{Resampling weights; a vector of length equal to the
    number of observations.}
  \item{...}{Other (named) arguments that should be passed to \code{FUN}.}
}
\value{
  An object of class \code{"simpleboot"}, which is almost identical to the
  regular \code{"boot"} object.  For example, the \code{boot.ci}
  function can be used on this object.
}
\examples{
set.seed(20)
x <- rgamma(100, 1)
b.mean <- one.boot(x, mean, 1000)
print(b.mean)
boot.ci(b.mean)  ## No studentized interval here
hist(b.mean)

## This next line could take some time on a slow computer
b.median <- one.boot(x, median, R = 500, student = TRUE, M = 50)
boot.ci(b.median)
hist(b.median)

## Bootstrap with weights
set.seed(10)
w <- runif(100)
bw <- one.boot(x, median, 1000, weights = w)
print(bw)

## Studentized
bw.stud <- one.boot(x, median, R = 500, student = TRUE, M = 50,
                    weights = w)
boot.ci(bw.stud, type = "stud")
}

\keyword{univar}

\author{Roger D. Peng}
