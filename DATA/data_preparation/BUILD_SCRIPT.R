library( dplyr )
library( tidyr )

setwd( "C:/Users/jdlecy/Dropbox/04 - PAPERS/01 - In Progress/25 - USC Mission Taxonomies/USC Mission Paper/Data and Analysis/Sample Framework" )


# source("build_program_and_mission_tables.R")
source( "https://raw.githubusercontent.com/Nonprofit-Open-Data-Collective/machine_learning_mission_codes/master/DATA/data_preparation/build_program_and_mission_tables.R" )
source( "https://raw.githubusercontent.com/Nonprofit-Open-Data-Collective/irs-990-efiler-database/master/BUILD_SCRIPTS/build_efile_database_functions.R" )

# index <- readRDS( "EfileSampleIndex.rds" )
index <- readRDS(gzcon(url( "https://github.com/Nonprofit-Open-Data-Collective/machine_learning_mission_codes/blob/master/DATA/data_preparation/EfileIndex.rds?raw=true" )))


dd <- buildFUNCTION( doc=doc1, url=url )
dd <- as.data.frame( dd, stringsAsFactors=F )

names( dd )


# devtools::install_github('ultinomics/xmltools')
library( xmltools )
library( purrr )
library( xml2 )
library( dplyr )




# index <- filter( index, FormType == "990" & TaxYear > 2010 )

index <- filter( index, FormType != "990PF" )

d.list <- list()

for( i in 1:nrow(index) )
{
   doc1 <- read_xml( index$URL[i] )
   xml_ns_strip( doc1 )
   d <- build_program_and_mission_tables( doc=doc1, url=index$URL[i] )
   d.list[[i]] <- d

}

dd <- bind_rows( d.list )



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

# prog4 <- select( dd, F9_03_PC_PROG_4_ACTIVITY_CODE, 
#                     F9_03_PC_PROG_4_DESCRIPTION, 
#                     F9_03_PC_PROG_4_EXPENSE, 
#                     F9_03_PC_PROG_4_GRANTS,
#                     F9_03_PC_PROG_4_REVENUE )



d1 <- data.frame( head, PROGRAM="PROG1", prog1, stringsAsFactors=F )
d2 <- data.frame( head, PROGRAM="PROG2", prog2, stringsAsFactors=F )
d3 <- data.frame( head, PROGRAM="PROG3", prog3, stringsAsFactors=F )
# d4 <- data.frame( head, PROGRAM="PROG4", prog4, stringsAsFactors=F )

names( d1 ) <- gsub( "F9_03_PC_PROG_1_", "", names(d1) )
names( d2 ) <- gsub( "F9_03_PC_PROG_2_", "", names(d2) )
names( d3 ) <- gsub( "F9_03_PC_PROG_3_", "", names(d3) )
# names( d4 ) <- gsub( "F9_03_PC_PROG_4_", "", names(d4) )

d.programs <- bind_rows( d1, d2, d3 )
d.mission <- cbind( head, mission )


d.programs$EIN <- as.numeric( d.programs$EIN )
d.programs2 <- filter( d.programs, ! (is.na(DESCRIPTION) & is.na(EXPENSE) & is.na(GRANTS) & is.na(REVENUE)) )

d.mission$EIN <- as.numeric( d.mission$EIN )


form1023 <- readRDS( "Form_1023ez_Efilers.rds" )
form1023$NTEE <- substr( form1023$Nteecode, 0, 1 )

sum( d.programs2$EIN %in% form1023$EIN )

dat.prog <- merge( d.programs2, form1023, by="EIN", all.x=T )
dat.mission <- merge( d.mission, form1023, by="EIN", all.x=T )


saveRDS( dat.prog, "DATA/PROGRAMS.rds" )
saveRDS( dat.mission, "DATA/MISSION.rds" )

write.csv( dat.prog, "DATA/PROGRAMS.csv", row.names=F )
write.csv( dat.mission, "DATA/MISSION.csv", row.names=F )





### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library( XML )
library( xml2 )
library( jsonlite )




url <- "https://s3.amazonaws.com/irs-form-990/201123199349203472_public.xml"
doc <- read_xml( url )
xml_ns_strip( doc )

doc <- xmlParse( doc )
a <- xmlToList(doc)
str( a )

# all nodes in Return Data main form (not schedules)
b <- a[["ReturnData"]][["IRS990EZ"]] #[["ProgSrvcAccomActyOtherGrp"]]
names(b)

which( names(b) == "ProgramServiceAccomplishment" )

c <- b[ which( names(b) == "ProgramServiceAccomplishment" ) ]

bind_rows( c )





url <- "https://s3.amazonaws.com/irs-form-990/201623209349312437_public.xml"
doc <- read_xml( url )
xml_ns_strip( doc )

doc <- xmlParse( doc )
a <- xmlToList(doc)
str( a )

# all nodes in Return Data main form (not schedules)
b <- a[["ReturnData"]][["IRS990"]] #[["ProgSrvcAccomActyOtherGrp"]]
names(b)

which( names(b) == "ProgSrvcAccomActyOtherGrp" )

c <- b[ which( names(b) == "ProgSrvcAccomActyOtherGrp" ) ]

bind_rows( c )




######################################


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library( XML )
library( xml2 )
library( jsonlite )


url <- "https://s3.amazonaws.com/irs-form-990/201123199349203472_public.xml"
url <- "https://s3.amazonaws.com/irs-form-990/201820249349200607_public.xml"
doc <- read_xml( url )
xml_ns_strip( doc )

doc <- xmlParse( doc )
a <- xmlToList(doc)
str( a )

# all nodes in Return Data main form (not schedules)
b <- a[["ReturnData"]][["IRS990EZ"]] #[["ProgSrvcAccomActyOtherGrp"]]
names(b)

which( names(b) == "ProgramServiceAccomplishment" )

c <- b[ which( names(b) == "ProgramServiceAccomplishment" ) ]

bind_rows( c )




url <- "https://s3.amazonaws.com/irs-form-990/201511769349300811_public.xml"
doc <- read_xml( url )
xml_ns_strip( doc )

doc <- xmlParse( doc )
a <- xmlToList(doc)
str( a )

# all nodes in Return Data main form (not schedules)
b <- a[["ReturnData"]][["IRS990"]] #[["ProgSrvcAccomActyOtherGrp"]]
names(b)

which( names(b) == "ProgramServiceAccomplishment" )

c <- b[ which( names(b) == "ProgramServiceAccomplishment" ) ]

bind_rows( c )


