\name{fetch_healthdata}
\alias{fetch_healthdata}
\title{Fetch HealthData.gov data sets
}
\description{
Query and retrieve data from the HealthData.gov data API.
}
\usage{
fetch_healthdata(resource = "hosp", filter = NULL)
}
\arguments{
  \item{resource}{
A string that identifies the name of the desired data resource.  See the \code{resources} object for names and descriptions of the available data resources.  Any name from the \code{resources$resource} column can be a value here.
}
  \item{filter}{
A list of named filters to apply to the API call.  The named list elements must be a field in the given resource.  To return all records from a particular data resource, set \code{filter} to \code{NULL}.
}
}
\details{
The \code{resources} data frame and \code{filters} list will be lazy-loaded automatically when you load the package.  You can also load them explicitly using the \code{data(resources)} and \code{data(filters)} commands.  The filter(s) will be applied on the server-side.
}
\value{
A data frame containing the results of the API query.
}
\references{
\url{http://www.healthdata.gov/data-api}
}
\author{
Erin LeDell
}
\note{
The HealthData.gov API only returns 100 results per HTTP request, so if you query matches more than 100 rows, multiple HTTP requests will be made.  After all the records that match your query are retrived via the API, a data frame containing all the records will be returned.  Field types will be converted automatically using the field type information returned by the API.  Support for 64-bit integers is provided by the required \pkg{bit64} package.  Some date fields are designated by the API as "text", and therefore will not be converted automatically.  However, there are some fields that are designated as having type, "timestamp", and these columns will be converted from a UTC character string (e.g. "2011-01-01T00:00:00") to R base class "POSIXct".
}

\examples{
df <- fetch_healthdata(resource="hosp", filter=list(addr_city="SAN FRANCISCO"))
head(df)
#       addr_city provider_id    tel_nbr seqn              addr_line_1
# 1 SAN FRANCISCO       50076 4158332646   38          2425 GEARY BLVD
# 2 SAN FRANCISCO       50228 4152068000  641      1001 POTRERO AVENUE
# 3 SAN FRANCISCO       50668 4157592300  660    375 LAGUNA HONDA BLVD
# 4 SAN FRANCISCO       50008 4156006000 1207         45 CASTRO STREET
# 5 SAN FRANCISCO       50152 4153536000 2353              900 HYDE ST
# 6 SAN FRANCISCO       50055 4156416562 2911 3555 CESAR CHAVEZ STREET
#                                ownership_type hsp_accreditation addr_postalcode
# 1 Government - Hospital District or Authority                             94115
# 2                          Government - Local                             94110
# 3                          Government - Local                             94116
# 4                Voluntary non-profit - Other                             94114
# 5              Voluntary non-profit - Private                             94109
# 6               Voluntary non-profit - Church                             94110
#   emergency_serv_type addr_state  _id hospital_type
# 1                 Yes         CA   38    Short-term
# 2                 Yes         CA  641    Short-term
# 3                 Yes         CA  660    Short-term
# 4                 Yes         CA 1207    Short-term
# 5                 Yes         CA 2353    Short-term
# 6                 Yes         CA 2911    Short-term
#                                             hsp_name county_cd
# 1         KAISER FOUNDATION HOSPITAL - SAN FRANCISCO       480
# 2                     SAN FRANCISCO GENERAL HOSPITAL       480
# 3      LAGUNA HONDA HOSPITAL & REHABILITATION CENTER       480
# 4  CALIFORNIA PACIFIC MEDICAL CTR-DAVIES CAMPUS HOSP       480
# 5                    SAINT FRANCIS MEMORIAL HOSPITAL       480
# 6  CALIFORNIA PACIFIC MEDICAL CTR - ST. LUKES CAMPUS       480

}
\keyword{API}
