\name{samples}
\alias{samples}

\title{
  Extract sampling distributions from bootstrapped linear/loess models.
}
\usage{
samples(object, name = c("fitted", "coef", "rsquare", "rss"))
}

\description{
  Extract sampling distributions of various entities from either a
  linear model or a loess bootstrap.  Entities for linear models are
  currently, model coefficients, residual sum of squares, R-square, and
  fitted values (given a set of X values in the original bootstrap).
  For loess, one can extract residual sum of squares and fitted values.
}

\arguments{
  \item{object}{The output from either \code{lm.boot} or
    \code{loess.boot}.}
  \item{name}{The name of the entity to extract.  The default is fitted
    values.}
}

\value{
  Either a vector or matrix depending on the entity extracted.  For
  example, when extracting the sampling distributions for linear model
  coefficents, the return value is p x R matrix where p is the number of
  coefficients and R is the number of bootstrap replicates.
}

\examples{
data(airquality)
attach(airquality)
lmodel <- lm(Ozone ~ Solar.R + Wind)
lboot <- lm.boot(lmodel, R = 100)

## Get sampling distributions for coefficients
s <- samples(lboot, "coef")

## Histogram for the intercept
hist(s[1,])

}

\keyword{utilities}

\author{Roger D. Peng}
