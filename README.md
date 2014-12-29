rHealthDataGov
==============

This package provides an R interface to the [HealthData.gov data API](http://www.healthdata.gov/data-api).

**Note to users:** The HealthData.gov Data API is currently down.  See this [issue](https://github.com/rOpenHealth/rHealthDataGov/issues/3) for updates.

Info
====

This package currently supports querying the 33 [Hospital Compare](http://hub.healthdata.gov/dataset/hospital-compare-api) data sets that are available via the [HealthData.gov Data API](http://www.healthdata.gov/data-api).  These data sets contain information related to process of care, mortality, and readmission quality measures of U.S. hospitals.

The full functionality of the API is exposed through this package, so you can pass one or more filters that subset a data set on the server-side, returning only the records that match your query.  The original API limits the number of records returned by a query to 100 records per HTTP request.  This package simplifies the retrieval process by making multiple HTTP requests on your behalf and returning the full result of your query as an R data frame.  We also simplify the experience by providing two data objects that provide metadata about the data sources, their available fields and field values.  These data objects, which are included in the package, include a data frame called `resources` that describes the available data sources and a list called `filters` that includes the available filters for each data resource along with the unique values that exist for each filter.

Please visit the R package documentation for more information.


Examples
========

Query Hospital Characteristics 
------------------------------

The query parameters are passed in POST request in JSON format.  Here is an example of a query that can be executed with this package.  This is a query of the "Hospital Characteristics" data set that filters to hospitals in San Francisco, CA using the [curl](http://en.wikipedia.org/wiki/CURL#cURL) command line tool.

```shell
curl http://hub.Healthdata.gov/api/action/datastore_search --data-urlencode '
{
  "resource_id": "391792b5-9c0a-48a1-918f-2ee63caa1c54",
  "filters": {
    "addr_city": "SAN FRANCISCO"
  }
}'
```

Using this package, we can make the same request as follows:

```r
> df <- fetch_healthdata(resource="hosp", filter=list(addr_city="SAN FRANCISCO"))
> dim(df)
[1] 10 14
> head(df)
      addr_city provider_id    tel_nbr seqn              addr_line_1
1 SAN FRANCISCO       50076 4158332646   38          2425 GEARY BLVD
2 SAN FRANCISCO       50228 4152068000  641      1001 POTRERO AVENUE
3 SAN FRANCISCO       50668 4157592300  660    375 LAGUNA HONDA BLVD
4 SAN FRANCISCO       50008 4156006000 1207         45 CASTRO STREET
5 SAN FRANCISCO       50152 4153536000 2353              900 HYDE ST
6 SAN FRANCISCO       50055 4156416562 2911 3555 CESAR CHAVEZ STREET
                               ownership_type hsp_accreditation addr_postalcode
1 Government - Hospital District or Authority                             94115
2                          Government - Local                             94110
3                          Government - Local                             94116
4                Voluntary non-profit - Other                             94114
5              Voluntary non-profit - Private                             94109
6               Voluntary non-profit - Church                             94110
  emergency_serv_type addr_state X_id hospital_type
1                 Yes         CA   38    Short-term
2                 Yes         CA  641    Short-term
3                 Yes         CA  660    Short-term
4                 Yes         CA 1207    Short-term
5                 Yes         CA 2353    Short-term
6                 Yes         CA 2911    Short-term
                                            hsp_name county_cd
1         KAISER FOUNDATION HOSPITAL - SAN FRANCISCO       480
2                     SAN FRANCISCO GENERAL HOSPITAL       480
3      LAGUNA HONDA HOSPITAL & REHABILITATION CENTER       480
4  CALIFORNIA PACIFIC MEDICAL CTR-DAVIES CAMPUS HOSP       480
5                    SAINT FRANCIS MEMORIAL HOSPITAL       480
6 CALIFORNIA PACIFIC MEDICAL CTR - ST. LUKE'S CAMPUS       480
```

To apply multiple filters, we add list elements to the `filter` argument as follows:

```r
> myfilter <- list(addr_city="SAN FRANCISCO", ownership_type="Government - Local")
> df <- fetch_healthdata(resource="hosp", filter=myfilter)
> dim(df)
[1]  2 14
```


To retrieve the entire data set without filtering, you simply set `filter = NULL` and wait for the response.

```r
> system.time(df <- fetch_healthdata("hosp", filter=NULL))
   user  system elapsed 
  1.902   0.136  15.207 
> dim(df)
[1] 4609   14
```

Query Healthcare Quality Indicators
===================================

Here we will query for providers with a post-op respiratory failure that is "Worse than the U.S. National Rate".  This info is available in the "Healthcare Research and Quality Indicators, Providers (ahrqp)" data set.

```r
> myfilter <- list(psi_11_postop_respfail_1="Worse than U.S. National Rate")
> df <- fetch_healthdata(resource="ahrqp", filter=myfilter)
> dim(df)
[1] 251  63
```

