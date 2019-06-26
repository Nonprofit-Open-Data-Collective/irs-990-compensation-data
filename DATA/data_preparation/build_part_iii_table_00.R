build_part_iii_table_00 <- function( doc, url )
{


## NAME

V_990NAMEpost2014 <- "//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1Txt" 
V_990NAME_2013 <- "//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1" 
V_990NAMEpre2013  <- "//Return/ReturnHeader/Filer/Name/BusinessNameLine1"
name.xpath <- paste( V_990NAME_2013, V_990NAMEpre2013, V_990NAMEpost2014, sep="|" )
NAME <- xml_text( xml_find_all( doc, name.xpath ) )

## EIN
EIN  <- xml_text( xml_find_all( doc, "//Return/ReturnHeader/Filer/EIN" ) )

## TAX YEAR
V_990FYRpost2013 <- "//Return/ReturnHeader/TaxYr"
V_990FYRpre2013  <- "//Return/ReturnHeader/TaxYear"
tax.year.xpath <- paste( V_990FYRpost2013, V_990FYRpre2013, sep="|" )
TAXYR <- xml_text( xml_find_all( doc, tax.year.xpath ) )

## TYPE OF TAX FORM
V_990TFpost2013 <- "//Return/ReturnHeader/ReturnTypeCd"
V_990TFpre2013  <- "//Return/ReturnHeader/ReturnType"
tax.form.xpath <- paste( V_990TFpost2013, V_990TFpre2013, sep="|" )
FORMTYPE <- xml_text( xml_find_all( doc, tax.form.xpath ) )

## OBJECT ID
OBJECTID <- get_object_id( url )

## URL
URL <- url

#-------------------------------------------------------------------


## VARIABLE NAME:  F9_03_PC_NEW_PROG_CHECKBOX
## DESCRIPTION:  Significant new programs?
## LOCATION:  F990-PC-PART-03-LINE-02
## TABLE:  F9-P03-TABLE-00-MISSION
## VARIABLE TYPE:  NA

V1 <- '//Return/ReturnData/IRS990/SignificantNewProgramServices'
V2 <- '//Return/ReturnData/IRS990/SignificantNewProgramSrvcInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIII/SignificantNewProgramServices'
NEW_PROG_CHECKBOX <- paste( V1, V2, V3 , sep='|' )
F9_03_PC_NEW_PROG_CHECKBOX <- xml_text( xml_find_all( doc, NEW_PROG_CHECKBOX ) )





## VARIABLE NAME:  F9_03_PC_SIG_CHANGE_CHECKBOX
## DESCRIPTION:  Significant changed programs?
## LOCATION:  F990-PC-PART-03-LINE-03
## TABLE:  F9-P03-TABLE-00-MISSION
## VARIABLE TYPE:  NA

V1 <- '//Return/ReturnData/IRS990/SignificantChange'
V2 <- '//Return/ReturnData/IRS990/SignificantChangeInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIII/SignificantChange'
SIG_CHANGE_CHECKBOX <- paste( V1, V2, V3 , sep='|' )
F9_03_PC_SIG_CHANGE_CHECKBOX <- xml_text( xml_find_all( doc, SIG_CHANGE_CHECKBOX ) )





## VARIABLE NAME:  F9_03_PC_TOTAL_PROG_EXP
## DESCRIPTION:  Total program service expense
## LOCATION:  F990-PC-PART-03-LINE-4e
## TABLE:  F9-P03-TABLE-00-MISSION
## VARIABLE TYPE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIII/TotalProgramServiceExpense'
V2 <- '//Return/ReturnData/IRS990/TotalProgramServicesExpenses'
V3 <- '//Return/ReturnData/IRS990/TotalProgramServiceExpense'
V4 <- '//Return/ReturnData/IRS990/TotalProgramServiceExpensesAmt'
V5 <- '//Return/ReturnData/IRS990EZ/TotalProgramServiceExpenses'
V6 <- '//Return/ReturnData/IRS990EZ/TotalProgramServiceExpensesAmt'
TOTAL_PROG_EXP <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_03_PC_TOTAL_PROG_EXP <- xml_text( xml_find_all( doc, TOTAL_PROG_EXP ) )





## VARIABLE NAME:  F9_03_PZ_MISSION
## DESCRIPTION:  Mission description
## LOCATION:  F990-PC-PART-03-LINE-1
## TABLE:  F9-P03-TABLE-00-MISSION
## VARIABLE TYPE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIII/MissionDescription'
V2 <- '//Return/ReturnData/IRS990EZ/MissionDesc'
V3 <- '//Return/ReturnData/IRS990EZ/MissionDescription'
V4 <- '//Return/ReturnData/IRS990/MissionDesc'
V5 <- '//Return/ReturnData/IRS990/MissionDescription'
V6 <- '//Return/ReturnData/IRS990EZ/PrimaryExemptPurpose'
V7 <- '//Return/ReturnData/IRS990EZ/PrimaryExemptPurposeTxt'
V8 <- '//Return/ReturnData/IRS990/PrimaryExemptPurpose'
MISSION <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
F9_03_PZ_MISSION <- xml_text( xml_find_all( doc, MISSION ) )





## VARIABLE NAME:  F9_03_PZ_SCHED_O_CHECKBOX
## DESCRIPTION:  Was Schedule O used to respond to any part of Part III?
## LOCATION:  F990-PC-PART-03-LINE-00
## TABLE:  F9-P03-TABLE-00-MISSION
## VARIABLE TYPE:  NA

V1 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartIII'
V2 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartIIIInd'
V3 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartIII'
V4 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartIIIInd'
SCHED_O_CHECKBOX <- paste( V1, V2, V3, V4 , sep='|' )
F9_03_PZ_SCHED_O_CHECKBOX <- xml_text( xml_find_all( doc, SCHED_O_CHECKBOX ) )





namedList <- function(...){
		      names <- as.list(substitute(list(...)))[-1L]
		      result <- list(...)
		      names(result) <- names
		      result[sapply(result, function(x){length(x)==0})] <- NA
		      result[sapply(result, is.null)] <- NA
		      result
		  }

d <- namedList( NAME, EIN, TAXYR, FORMTYPE, OBJECTID, URL, F9_03_PC_NEW_PROG_CHECKBOX, F9_03_PC_SIG_CHANGE_CHECKBOX, F9_03_PC_TOTAL_PROG_EXP, F9_03_PZ_MISSION, F9_03_PZ_SCHED_O_CHECKBOX )

return( d )


}
