---
title: "990 EFile Compensation Data"
---



We have both CSV and RDS (R data set) files available in the [DATA](https://github.com/Nonprofit-Open-Data-Collective/irs-990-compensation-data/tree/master/DATA) section of this GitHub repository. They can be loaded directly into R as follows.

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


[Download](https://www.dropbox.com/s/zeic49hwst4w9p7/p7a_data.rds?dl=1)

# Data Dictionary 
 
 
