## Regression tests for `simpleboot'.
## Added 2004-10-15

set.seed(1234)
x <- runif(100)

## Simple sine function simulation
y <- sin(2*pi*x) + .2 * rnorm(100)
plot(x, y)  ## Sine function with noise
lo <- loess(y ~ x, span = .4)

## Bootstrap with resampling of rows
lo.b <- loess.boot(lo, R = 500)

## Purposely mask the sd() function; plot.loess.simpleboot() should
## get sd() from the `stats' package namespace
sd <- function(...) { stop("error") }

doPlot <- function(lo.b) {
    postscript(file = "plot-loess-test.eps", height = 7, width = 7)
    on.exit(dev.off())
    
    ## Plot original fit with +/- 2 std. errors
    plot(lo.b)
}
doPlot(lo.b)

unlink("plot-loess-test.eps")
