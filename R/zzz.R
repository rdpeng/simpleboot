.onAttach <- function(lib, pkg) {
    where <- match(paste("package:", pkg, sep = ""), search())
    ver <- read.dcf(file.path(lib, pkg, "DESCRIPTION"), "Version")
    ver <- as.character(ver)
    cat(paste("Simple Bootstrap Routines (version ", ver, ")\n", sep = ""))
}

.onLoad <- function(lib, pkg) {
    if(!require(boot))
        stop(sQuote("boot"), " library required for ", sQuote("simpleboot"))
}

