---
title: "Schedule H Data"
---



We have both CSV and RDS (R data set) files available in the [DATA](https://github.com/Nonprofit-Open-Data-Collective/machine_learning_mission_codes/tree/master/DATA) section of this GitHub repository. They can be loaded directly into R as follows.

Read CSV version:

```r
dat <- read.csv( "https://github.com/Nonprofit-Open-Data-Collective/machine_learning_mission_codes/blob/master/DATA/MISSION.csv?raw=true", stringsAsFactors=F )
```

Read RDS version:

```r
dat <- readRDS( gzcon( url( "https://github.com/Nonprofit-Open-Data-Collective/machine_learning_mission_codes/blob/master/DATA/MISSION.rds?raw=true" )))
```

<br> 
<br> 

-------------------

# Overview of the Data




## Raw Data Sources

We have built a training dataset using data from two primary sources:

The IRS E-File database contains machine-readable text fields on nonprofit names, mission statements, and program service accomplishments. 

The IRS 1023-EZ files contain mission taxonomy codes for the traditional National Taxonomy of Exempt Entities (NTEE), as well as eight binary mission codes related to nonprofit purpose such as religious activities, scientific activities, recreational activities, or welfare activities. 

See the [taxonomy](https://nonprofit-open-data-collective.github.io/machine_learning_mission_codes/taxonomies/) section of this site for more information. 



## Other Available Data

Schedule J
Core Files
Trend Files

E-File coverage:


|      |  2009|   2010|   2011|   2012|   2013|   2014|   2015|   2016|  2017|
|:-----|-----:|------:|------:|------:|------:|------:|------:|------:|-----:|
|990   | 33,360| 123,107| 159,539| 179,674| 198,738| 218,614| 232,975| 214,585| 25,921|
|990EZ | 15,500|  63,253|  82,066|  93,769| 104,538| 116,461| 124,507| 121,530| 28,767|
|990PF |  2,352|  25,275|  34,597|  39,936|  45,897|  53,443|  58,724|  60,305| 20,608|


## XML Tools in R

If you want to work with the data directly you will need to use some XML tools. 

[Quick Guide to Working with XML in R](Quick_Guide_to_XML_in_R.html)

## Build Custom Databases

You can build custom datasets from the IRS XML fields. Some sapmle scripts are available here:

[Nonprofit Open Data Collective](https://github.com/Nonprofit-Open-Data-Collective/irs-990-efiler-database/blob/master/BUILD_SCRIPTS/README.md)

And many of the tables in CSV formats are available on our [Data World](https://data.world/activity/npdata) group: https://data.world/activity/npdata
