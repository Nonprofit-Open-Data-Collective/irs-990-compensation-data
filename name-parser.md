# Parsing Managers, Director, and Key Employee Names

```r
devtools::install_github('mjfii/Name-Parser')
library('name.parser')

# fix parse.names function 
parse.names <- function (x, ...) 
{
    data("census.names")
    no_cores <- parallel::detectCores() - 1
    cl <- parallel::makeCluster(no_cores)
    parallel::clusterExport( cl=cl, 'census.names' )
    input_names <- data.frame(name = x)
    input_names$parsed_name <- parallel::parLapply(cl, input_names$name, 
        parse.name, ...)
    input_names <- data.frame(input_names$name, do.call("rbind", 
        strsplit(as.character(input_names$parsed_name), "|", 
            fixed = TRUE)), stringsAsFactors = FALSE)
    colnames(input_names) <- c("name", "salutation", "first_name", 
        "middle_name", "last_name", "suffix", "gender", "gender_confidence")
    parallel::stopCluster(cl)
    return(input_names)
}

x <- 'livingston III,  Mr. MICHAEL JOHN9'
parse.names(x)
```

|name                               |salutation |first_name |middle_name |last_name  |suffix |gender |gender_confidence |
|:----------------------------------|:----------|:----------|:-----------|:----------|:------|:------|:-----------------|
|livingston III,  Mr. MICHAEL JOHN9 |MR         |MICHAEL    |JOHN        |LIVINGSTON |III    |M      |99.6              |


```r
url <- "https://raw.githubusercontent.com/Nonprofit-Open-Data-Collective/irs-990-compensation-data/master/DATA/Part-VII-Sample.csv"
part.vii <- read.csv( url, stringsAsFactors=F )
x <- as.character( part.vii$PersonNm )


# Customize prefix and suffix libraries 

suffixes <- c("JR","II", "III", "IV", "SR")

prefixes <- c("MR", "DR", "MISS", "MS", "MRS", "REV",
              "MD", "JD", "SENATOR", "COMMISSIONER",
              "DELEGATE", "PHD", "PhD", "CFA", "CPA", 
              "CMPE", "CMA-A", "CMAA",
              "FACS", "SH1", "SH2", "EN1", "LCRD" )

# LCDR Lieutenant commander 
# EN1 navy levels
# SH1 navy levels


p <- parse.names( x, prefixes=prefixes, suffixes=suffixes )
p
```


|name                    |salutation |first_name |middle_name |last_name     |suffix |gender |gender_confidence |
|:-----------------------|:----------|:----------|:-----------|:-------------|:------|:------|:-----------------|
|Tim Ko                  |           |TIM        |            |KO            |       |M      |100               |
|Dr Latha Venkatesh      |DR         |LATHA      |            |VENKATESH     |       |U      |50.0              |
|Dr Brian Ondulick       |DR         |ONDULICK   |            |BRIAN         |       |U      |50.0              |
|Dr Wayne Woodard        |DR         |WAYNE      |            |WOODARD       |       |M      |100               |
|Dr Richard Byers        |DR         |RICHARD    |            |BYERS         |       |M      |99.8              |
|Dr Linda Bailey         |DR         |LINDA      |            |BAILEY        |       |F      |100               |
|Mark Smith              |           |MARK       |            |SMITH         |       |M      |99.5              |
|Steve Chavez            |           |STEVE      |            |CHAVEZ        |       |M      |100               |
|Ronald Connovich        |           |CONNOVICH  |            |RONALD        |       |U      |50.0              |
|DELMER HOLLINGSWORTH JR |           |DELMER     |            |HOLLINGSWORTH |JR     |M      |100               |
|HATTIE OUTLAW ASKEW     |           |HATTIE     |OUTLAW      |ASKEW         |       |F      |100               |
|LUCY ROBINSON           |           |LUCY       |            |ROBINSON      |       |F      |100               |
|EDITH YOUNG             |           |EDITH      |            |YOUNG         |       |F      |100               |
|JUNE LEVESQUE           |           |JUNE       |            |LEVESQUE      |       |F      |100               |
|BAXTER MCLENDON MD      |MD         |MCLENDON   |            |BAXTER        |       |U      |50.0              |
|CAROLYN THEODORE        |           |CAROLYN    |            |THEODORE      |       |F      |100               |
|YORK GLOVER             |           |YORK       |            |GLOVER        |       |U      |50.0              |
|REV DR RENTY KITTY JR   |REV        |KITTY      |            |RENTY         |JR     |F      |100               |
|JORETTA SIMMONS         |           |JORETTA    |            |SIMMONS       |       |U      |50.0              |
|ROLAND J GARDNER        |           |ROLAND     |J           |GARDNER       |       |M      |100               |
|CATHY BAGLEY MD         |MD         |CATHY      |            |BAGLEY        |       |F      |100               |

