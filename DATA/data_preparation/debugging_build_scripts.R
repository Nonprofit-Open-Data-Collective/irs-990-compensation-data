##### Examine Path Structures   #####

# devtools::install_github('ultinomics/xmltools')
library( xmltools )
library( purrr )
library( xml2 )
library( dplyr )

# build functions
source( "https://raw.githubusercontent.com/Nonprofit-Open-Data-Collective/irs-990-efiler-database/master/BUILD_SCRIPTS/build_efile_database_functions.R" )




V_990_2014 <- "https://s3.amazonaws.com/irs-form-990/201543089349301829_public.xml"

V_990_2012 <- "https://s3.amazonaws.com/irs-form-990/201322949349300907_public.xml"

V_990EZ_2014 <- "https://s3.amazonaws.com/irs-form-990/201513089349200226_public.xml"

V_990EZ_2012 <- "https://s3.amazonaws.com/irs-form-990/201313549349200311_public.xml"


### GENERATE ALL XPATHS: V 990 2014
url1 <- V_990_2014
doc1 <- read_xml( url1 )
xml_ns_strip( doc1 )
doc1 %>% xml_find_all( '//*') %>% xml_path()



### GENERATE ALL XPATHS: V 990 2012
url2 <- V_990_2012
doc2 <- read_xml( url2 )
xml_ns_strip( doc2 )
doc2 %>% xml_find_all( '//*') %>% xml_path()



### GENERATE ALL XPATHS: V 990EZ 2014
url3 <- V_990EZ_2014
doc3 <- read_xml( url3 )
xml_ns_strip( doc3 )
doc3 %>% xml_find_all( '//*') %>% xml_path()



### GENERATE ALL XPATHS: V 990EZ 2012
url4 <- V_990EZ_2012
doc4 <- read_xml( url4 )
xml_ns_strip( doc4 )
doc4 %>% xml_find_all( '//*') %>% xml_path()




######################################  CONVERT XML TO LISTS AND DATA FRAMES


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





#############################   BUILD TABLES


dd <- buildFUNCTION( doc=doc1, url=url )
dd <- as.data.frame( dd, stringsAsFactors=F )

names( dd )




# index <- filter( index, FormType == "990" & TaxYear > 2010 )

index <- filter( index, FormType != "990PF" & TaxYear > 2010 )

d.list <- list()

for( i in 1:nrow(index) )
{
   doc1 <- read_xml( index$URL[i] )
   xml_ns_strip( doc1 )
   d <- build_program_and_mission_tables( doc=doc1, url=index$URL[i] )
   d.list[[i]] <- d

}

dd <- bind_rows( d.list )  # get errors here, all list elements should contain only one row of data

