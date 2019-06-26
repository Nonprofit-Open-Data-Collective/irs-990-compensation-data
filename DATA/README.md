# File Documentation


## Mission Text Files

MISSION.csv / .rds  
PROGRAMS.csv / .rds  

Import CSV version:

```r
dat <- read.csv( "https://github.com/Nonprofit-Open-Data-Collective/machine_learning_mission_codes/blob/master/DATA/MISSION.csv?raw=true", stringsAsFactors=F )
```

Import RDS version:

```r
dat <- readRDS( gzcon( url( "https://github.com/Nonprofit-Open-Data-Collective/machine_learning_mission_codes/blob/master/DATA/MISSION.rds?raw=true" )))
```

These files contain fields from 

They have been merged with the IRS 1023-EZ files to include a set of mission taxonomies:

* **NTEE codes full** - 3-digit NTEE codes
* **NTEE codes basic** - first letter representing top-level activity
* **Religious** - 1 if the organization has religion as part of the mission, 0 otherwise
* **Scientific** - 1 if the organization has science as part of the mission, 0 otherwise


## Text Pre-Processing Files

Mission Ngrams.csv
Program Ngrams.csv

n-grams generated from mission and program statements using quanteda...

```r
mission.corp <- corpus( mission.lim, text_field = "F9_03_PZ_MISSION" )
docid <- paste( mission$EIN, mission$TAXYR, sep = " " )
docnames( mission.corp ) <- docid

myNgram2 <- 
  tokens(mission.corp4) %>%
  tokens_ngrams(n = 2)
  
mission.corp[1]
```

DICTIONARY.csv

dictionary generated with "thesaurus" pre-processing rules for compounding words and creating concept mapping rules. 


## Corpus Files

Mission Corpus.csv
Program Corpus.csv

Output files from pre-processing steps in quanteda. 


## Document Frequency Matrix Files

Mission DFM.csv
Program DFM.csv

Corpus feature files generated from quanteda. 

```r
mission.dfm <- dfm( mission.corp6, stem = T )
```

