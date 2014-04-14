\name{filters}
\alias{filters}
\docType{data}
\title{
List of supported fields and field values for each of the data resources.
}
\description{
This is a list containing elements for each resource.  Each resource element is another list that contains named (filter names) vectors of values (unique filter values). 
}
\usage{data(filters)}
\format{
  The format is:\cr
List of 33
}
\details{
This list was created by by calling the \code{fetch_healthdata} function (with \code{filter = NULL}) on all of the resources and returning the unique values for each column in the resulting data frame.
}
\source{
\url{http://hub.healthdata.gov/dataset/hospital-compare-api}
}
\references{
\url{http://www.healthdata.gov/data-api}
}
\examples{
data(filters)

str(filters$hosp$addr_state)
# chr [1:55] "AK" "AL" "AR" "AZ" "CA" "CO" "CT" "DC" "DE" ...

str(filters$hosp$addr_city)
# chr [1:2832] "ABBEVILLE" "ABERDEEN" "ABILENE" "ABINGDON" ...

}
\keyword{datasets}
