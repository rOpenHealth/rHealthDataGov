\name{rHealthDataGov-package}
\alias{rHealthDataGov-package}
\alias{rHealthDataGov}
\docType{package}
\title{
Retrieve data sets from the HealthData.gov data API
}
\description{
An R interface for the HealthData.gov data API.  For each data resource, you can filter results (server-side) to select subsets of data.
}
\details{
\tabular{ll}{
Package: \tab rHealthDataGov\cr
Type: \tab Package\cr
Version: \tab 1.0.1\cr
Date: \tab 2014-06-01\cr
License: \tab GPL-2\cr
}
The main function of this package is \code{fetch_healthdata}, which is used to query (by filter) and retrieve data from the HealthData.gov data API.  Currently, the only interesting data store available via the HealthData.gov API is the "Hospital Compare" data store.  This is comprised of 33 data sets containing information about process of care, mortality, and readmission quality measures for U.S. hospitals.  This package is part of the rOpenHealth project: \url{https://github.com/rOpenHealth}
}
\author{
Erin LeDell

Maintainer: Erin LeDell <ledell@berkeley.edu>
}
\references{
\url{http://www.healthdata.gov}\cr
\url{http://www.healthdata.gov/data-api}\cr
\url{http://hub.healthdata.gov/dataset/hospital-compare-api}\cr
}
\keyword{ package }
