% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cyclocomp.R
\name{cyclocomp_package}
\alias{cyclocomp_package}
\title{Cyclomatic complexity of the objects in an installed package}
\usage{
cyclocomp_package(package)
}
\arguments{
\item{package}{Package name, character scalar.}
}
\value{
Data frame with two columns: \code{name} and \code{cyclocomp}.
}
\description{
Note that the package must be installed.
}
\examples{
## They might take a while to run
\dontrun{
cyclocomp_package("grDevices")
cyclocomp_package("methods")
}
}
\seealso{
Other cyclomatic complexity: 
\code{\link{cyclocomp_package_dir}()},
\code{\link{cyclocomp}()}
}
\concept{cyclomatic complexity}
