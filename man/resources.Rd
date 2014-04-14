\name{resources}
\alias{resources}
\docType{data}
\title{
HealthData.gov resources metadata
}
\description{
This is a data frame that contains the resource names which can be passed as a string to the \code{resource} argument of the \code{fetch_healthdata} function.  It also contains resource descriptions and other metadata.
}
\usage{data(resources)}
\format{
  A data frame with 33 observations on the following 6 variables.
  \describe{
    \item{\code{resource}}{a factor with levels \code{ahrqn} \code{ahrqp} \code{ahrqs} \code{cacn} \code{cacop} \code{cacp} \code{cacs} \code{cn} \code{cp} \code{cs} \code{hacn} \code{hacp} \code{haip} \code{hais} \code{hn} \code{hophc} \code{hophp} \code{hopnp} \code{hopqdrpq} \code{hopsp} \code{hosp} \code{hp} \code{hpv} \code{hs} \code{npv} \code{on} \code{op} \code{oq} \code{os} \code{ppv} \code{q} \code{sm} \code{spv}}
    \item{\code{description}}{a character vector}
    \item{\code{date}}{a Date}    
    \item{\code{nrow}}{a numeric vector}
    \item{\code{ncol}}{a numeric vector}
    \item{\code{resource_id}}{a factor (with levels identified by a hash assigned by HealthData.gov)}

  }
}
\details{
There are 33 available resources which can be queried by their resource name.  The names, descriptions, source dates, number of records and fields, and resource ids are available in this data frame.
}
\source{
\url{http://hub.healthdata.gov/dataset/hospital-compare-api}
}
\references{
\url{http://www.healthdata.gov/data-api}
}
\examples{
data(resources)
head(resources[,1:2])
#   resource                                                description
# 1    ahrqn Healthcare Research and Quality Indicators, Natioanal data
# 2    ahrqp      Healthcare Research and Quality Indicators, Providers
# 3    ahrqs     Healthcare Research and Quality Indicators, State data
# 4     cacn                      Childrens Asthma Care National (CACN)
# 5    cacop               Childrens Asthma Care Only Providers (CACOP)
# 6     cacp                     Childrens Asthma Care Providers (CACP) 
}
\keyword{datasets}
