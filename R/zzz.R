.First.lib <- function(lib, pkg) {
    where <- match(paste("package:", pkg, sep = ""), search())
    ver <- read.dcf(file.path(lib, pkg, "DESCRIPTION"), "Version")
    ver <- as.character(ver)
    cat(paste("UCLA Bootstrap Routines (version ", ver, ")\n", sep = ""))

    if(!require(boot))
        stop("package `boot' is required")
    library(modreg)
}
