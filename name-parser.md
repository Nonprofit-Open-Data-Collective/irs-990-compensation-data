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



### Needs Attention

Not clear why this name is having problems. 

|name                    |salutation |first_name |middle_name |last_name     |suffix |gender |gender_confidence |
|:-----------------------|:----------|:----------|:-----------|:-------------|:------|:------|:-----------------|
|Dr Brian Ondulick       |DR         |ONDULICK   |            |BRIAN         |       |U      |50.0              |
|Dr Latha Venkatesh      |DR         |LATHA      |            |VENKATESH     |       |U      |50.0              |

The last name is not included in the Census database of names (I suspect they only report names that occur over a threshold number of times). So it returns zero, which might confuse the algorithm. 

```r
> get.census.data( "ONDULICK" )
       name ordinal male_value female_value first_name_value last_name_value
1: ONDULICK       1          0            0                0               0
> get.census.data( "BRIAN" )
    name ordinal male_value female_value first_name_value last_name_value
1: BRIAN       1    1054140         1518          1055658            4214
> get.census.data( "LATHA" )
    name ordinal male_value female_value first_name_value last_name_value
1: LATHA       1          0            0                0               0
> get.census.data( "VENKATESH" )
        name ordinal male_value female_value first_name_value last_name_value
1: VENKATESH       1          0            0                0            1082 
```
The second case makes sense because there are no values for either names, so it keeps them in the same order. Or is it using the last_name_value? 

Can we add a rule that would make sense here? If one name is clearly a first name, and no data for other, then assign the case with data first, and fill in the second last? 

```r
data( "census.names" )
```

