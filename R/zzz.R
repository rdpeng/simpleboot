.onLoad <- function(lib, pkg) {
    where <- match(paste("package:", pkg, sep = ""), search())
    ver <- read.dcf(file.path(lib, pkg, "DESCRIPTION"), "Version")
    ver <- as.character(ver)
    cat(paste("Simple Bootstrap Routines (version ", ver, ")\n", sep = ""))
    library(boot)

    if(as.numeric(version$major) <= 1 && as.numeric(version$minor) < 9.0)
        library(modreg)
}
