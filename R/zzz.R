.First.lib <- function(lib, pkg) {
    where <- match(paste("package:", pkg, sep = ""), search())
    ver <- read.dcf(file.path(lib, pkg, "DESCRIPTION"), "Version")
    ver <- as.character(ver)
    cat(paste("Simple Bootstrap Routines (version ", ver, ")\n", sep = ""))

    library(boot)
    library(modreg)
}
