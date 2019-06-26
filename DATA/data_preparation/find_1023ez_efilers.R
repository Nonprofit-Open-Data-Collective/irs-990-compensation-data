library( dplyr )
library( tidyr )

setwd( "C:/Users/jdlecy/Dropbox/04 - PAPERS/01 - In Progress/18 - 1023 EZ Forms" )
"D:/Dropbox/04 - PAPERS/01 - In Progress/18 - 1023 EZ Forms/Data"

dd1 <- read.csv( "f1023ez_approvals_2014.csv", stringsAsFactors=F )
dd2 <- read.csv( "f1023ez_approvals_2015.csv", stringsAsFactors=F )
dd3 <- read.csv( "f1023ez_approvals_2016.csv", stringsAsFactors=F )
dd4 <- read.csv( "f1023ez_approvals_2017.csv", stringsAsFactors=F )


d2 <- bind_rows( dd1, dd2, dd3, dd4 )

nrow( d2 )

source( "https://raw.githubusercontent.com/Nonprofit-Open-Data-Collective/irs-990-efiler-database/master/BUILD_SCRIPTS/build_efile_database_functions.R" )

d2$EIN <- gsub( "-", "", d2$EIN )
d2$EIN <- as.numeric( d2$EIN )

d$EIN <- as.numeric( d$EIN )
head( EIN )
 
ein <- unique( d$EIN )

length( intersect( d2$EIN, ein ) )

these <- intersect( d2$EIN, ein )

d3 <- filter( d, EIN %in% these )

table( d3$FormType, d3$TaxYear )

saveRDS( d3, "New1023ezEfilers.rds" )

d4 <- filter( d2, d2$EIN %in% these )

nrow( d4 )

saveRDS( d4, "Form_1023ez_Efilers.rds" )

table( substr( d4$Nteecode, 1, 1 ) )

table( d4$Orgpurposecharitable )
table( d4$Orgpurposereligious )
table( d4$Orgpurposeeducational  )
table( d4$Orgpurposescientific  )
table( d4$Orgpurposeliterary  )
table( d4$Orgpurposepublicsafety  )
table( d4$Orgpurposeamateursports  )
table( d4$Orgpurposecrueltyprevention  )









### ~~~ 

setwd( "D:/Dropbox/04 - PAPERS/01 - In Progress/25 - USC Mission Taxonomies/USC Mission Paper/Data and Analysis/Sample Framework" )

dat <- readRDS( "Form_1023ez_Efilers.rds" )

length( unique( dat$EIN ) )

source( "https://raw.githubusercontent.com/Nonprofit-Open-Data-Collective/irs-990-efiler-database/master/BUILD_SCRIPTS/build_efile_database_functions.R" )

index <- buildIndex()

index$EIN <- as.numeric( index$EIN )

length( intersect( index$EIN, dat$EIN ) )  # [1] 13983

length( unique( dat$EIN ) )  # [1] 13983


sample <- index[ index$EIN %in% intersect( index$EIN, dat$EIN ) , ]

saveRDS( sample, "EfileSampleIndex.rds" )


### ~~~ CREATE BUILD FUNCTION ~~~ ###


library( dplyr )

part.iii <- read.csv( "PartIII.csv", stringsAsFactors=F )
names( part.iii ) <- toupper( names( part.iii ) )
part.iii.one.to.one <- 
   filter( part.iii, CARDINALITY == "ONE" ) %>%
   filter( VARIABLE_NAME_NEW != "F9_03_PC_PROG_1_GRANTS_FRGN" ) %>%
   arrange( RDB_TABLE )

create_code_chunks( part.iii.one.to.one )

dd <- buildFUNCTION( doc=doc1, url=url )
dd <- as.data.frame( dd, stringsAsFactors=F )

names(dd)

head <- select( dd, NAME, EIN, TAXYR, FORMTYPE, OBJECTID, URL )

mission <- select( dd, F9_03_PC_NEW_PROG_CHECKBOX,
                       F9_03_PC_SIG_CHANGE_CHECKBOX,
                       F9_03_PC_TOTAL_PROG_EXP,
                       F9_03_PZ_MISSION,
                       F9_03_PZ_SCHED_O_CHECKBOX )
 
prog1 <- select( dd, F9_03_PC_PROG_1_ACTIVITY_CODE, 
                     F9_03_PC_PROG_1_DESCRIPTION, 
                     F9_03_PC_PROG_1_EXPENSE, 
                     F9_03_PC_PROG_1_GRANTS,
                     F9_03_PC_PROG_1_REVENUE )

prog2 <- select( dd, F9_03_PC_PROG_2_ACTIVITY_CODE, 
                     F9_03_PC_PROG_2_DESCRIPTION, 
                     F9_03_PC_PROG_2_EXPENSE, 
                     F9_03_PC_PROG_2_GRANTS,
                     F9_03_PC_PROG_2_REVENUE )

prog3 <- select( dd, F9_03_PC_PROG_3_ACTIVITY_CODE, 
                     F9_03_PC_PROG_3_DESCRIPTION, 
                     F9_03_PC_PROG_3_EXPENSE, 
                     F9_03_PC_PROG_3_GRANTS,
                     F9_03_PC_PROG_3_REVENUE )

prog4 <- select( dd, F9_03_PC_PROG_4_ACTIVITY_CODE, 
                     F9_03_PC_PROG_4_DESCRIPTION, 
                     F9_03_PC_PROG_4_EXPENSE, 
                     F9_03_PC_PROG_4_GRANTS,
                     F9_03_PC_PROG_4_REVENUE )



d1 <- data.frame( head, PROGRAM="PROG1", prog1, stringsAsFactors=F )
d2 <- data.frame( head, PROGRAM="PROG2", prog2, stringsAsFactors=F )
d3 <- data.frame( head, PROGRAM="PROG3", prog3, stringsAsFactors=F )
d4 <- data.frame( head, PROGRAM="PROG4", prog4, stringsAsFactors=F )

names( d1 ) <- gsub( "F9_03_PC_PROG_1_", "", names(d1) )
names( d2 ) <- gsub( "F9_03_PC_PROG_2_", "", names(d2) )
names( d3 ) <- gsub( "F9_03_PC_PROG_3_", "", names(d3) )
names( d4 ) <- gsub( "F9_03_PC_PROG_4_", "", names(d4) )

d.programs <- bind_rows( d1, d2, d3, d4 )
d.mission <- cbind( head, mission )






### ~~~ TEST DATA


library( xmltools )
library( purrr )
library( xml2 )
library( dplyr )


V_990_2014 <- "https://s3.amazonaws.com/irs-form-990/201543089349301829_public.xml"

V_990_2012 <- "https://s3.amazonaws.com/irs-form-990/201322949349300907_public.xml"

V_990EZ_2014 <- "https://s3.amazonaws.com/irs-form-990/201513089349200226_public.xml"

V_990EZ_2012 <- "https://s3.amazonaws.com/irs-form-990/201313549349200311_public.xml"

### GENERATE ALL XPATHS: V 990 2014
url1 <- V_990_2014
doc1 <- read_xml( url1 )
xml_ns_strip( doc1 )
# doc1 %>% xml_find_all( '//*') %>% xml_path()

### GENERATE ALL XPATHS: V 990 2012
url2 <- V_990_2012
doc2 <- read_xml( url2 )
xml_ns_strip( doc2 )
# doc2 %>% xml_find_all( '//*') %>% xml_path()

### GENERATE ALL XPATHS: V 990EZ 2014
url3 <- V_990EZ_2014
doc3 <- read_xml( url3 )
xml_ns_strip( doc3 )
# doc3 %>% xml_find_all( '//*') %>% xml_path()

### GENERATE ALL XPATHS: V 990EZ 2012
url4 <- V_990EZ_2012
doc4 <- read_xml( url4 )
xml_ns_strip( doc4 )
# doc4 %>% xml_find_all( '//*') %>% xml_path()



test.dat <- sample[ 1:10 , ]



build_part_iii_table_00( doc=doc1, url=url )
build_part_iii_table_00( doc=doc2, url=url2 )
build_part_iii_table_00( doc=doc3, url=url3 )
build_part_iii_table_00( doc=doc4, url=url4 )


buildFUNCTION( doc=doc1, url=url )
buildFUNCTION( doc=doc2, url=url2 )
buildFUNCTION( doc=doc3, url=url3 )
buildFUNCTION( doc=doc4, url=url4 )









part.iii.01.group.names <- find_group_names( part.iii, "F9-P03-TABLE-01-PROG-ACCOMPLISHMENTS" )
part.iii.01.v.map       <- get_var_map( part.iii, table.name="F9-P03-TABLE-01-PROG-ACCOMPLISHMENTS" )

build_rdb_table( doc1, url=url, group.names=part.iii.01.group.names, v.map=part.iii.01.v.map )
build_rdb_table( doc2, url=url2, group.names=part.iii.01.group.names, v.map=part.iii.01.v.map )
build_rdb_table( doc3, url=url3, group.names=part.iii.01.group.names, v.map=part.iii.01.v.map )
build_rdb_table( doc4, url=url4, group.names=part.iii.01.group.names, v.map=part.iii.01.v.map )



library( XML )
xmlToList( doc1 )


library(xml2)
library(jsonlite)



x <- xml2::as_list( doc1 ) 

xl <- lapply( x, attributes )

toJSON( xl, pretty = TRUE, auto_unbox = TRUE )

xml_find_all( doc1, '//Return//ReturnData')

doc1 %>% xml2::xml_find_all( '//*') %>% xml2::xml_path()

xml_name( xml_children( doc1 ) )

xml_name( xml_children( customer1 ) )

customer1 <- xml_find_all( doc1, ".//Return/ReturnData" )


xml_name( xml_children( xml_find_first( doc1, "//ReturnData/IRS990" ) ) )



### GENERATE ALL XPATHS: V 990 2014
url1 <- V_990_2014
doc1 <- read_xml( url )
xml_ns_strip( doc1 )
# doc1 %>% xml_find_all( '//*') %>% xml_path()


these <- xml_children( xml_find_first( doc1, "//ReturnData/IRS990" ) )
x <- xml2::as_list( these ) 
xl <- lapply( x, attributes )
toJSON( xl, pretty = TRUE, auto_unbox = TRUE )


url <- "https://s3.amazonaws.com/irs-form-990/201123149349301147_public.xml"
doc <- read_xml( url )
xml_ns_strip( doc )


doc <- xmlParse( doc )
a <- xmlToList(doc)
dd <- jsonlite::toJSON(a, pretty=TRUE)



names( dd )
str( dd )
str( a )


library(jsonlite)
library(dplyr)
library(purrr)
library(tidyr)


dd %>% 
  mutate( json = map(json, ~ fromJSON(.) %>% as.data.frame())) %>% 
  unnest( json)

