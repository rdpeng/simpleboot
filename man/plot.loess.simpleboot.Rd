\name{plot.loess.simpleboot}

\alias{plot.loess.simpleboot}

\title{
  Plot method for loess bootstraps.
}

\usage{
\method{plot}{loess.simpleboot}(x, add = FALSE, all.lines = FALSE, ...)
}

\description{
  Plot loess lines with bootstrap standard errors.
}

\arguments{
  \item{x}{An object of class \code{"loess.simpleboot"} as
    returned by the function \code{loess.boot}.}
  \item{add}{Should the loess line be plotted over the current plot?}
  \item{all.lines}{Should we plot each of the individual loess lines
    from the bootstrap samples?}
  \item{...}{Other arguments passed to \code{plot}.}
}

\details{
  \code{plot} constructs (and plots) the original loess fit and +/- 2
  bootstrap standard errors at locations specified in the \code{new.xpts}
  in \code{loess.boot} (or on an evenly spaced grid).
}

\author{Roger D. Peng}

\value{
  Nothing is returned.
}

\examples{
## See the help page for `loess.boot' for an example.
}

\keyword{loess}
