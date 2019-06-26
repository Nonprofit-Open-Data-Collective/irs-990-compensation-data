# SVM Sample cases

## Source article regarding SVM and RTextTools:
### Jurka et al., 2013: https://journal.r-project.org/archive/2013/RJ-2013-001/RJ-2013-001.pdf
### Collingwood and Wilkerson, 2013
## Data is a document-term matrix 

library( RTextTools )
library( tidytext )
library( dplyr )

# Download the data
dat <- read.csv( "https://raw.githubusercontent.com/Nonprofit-Open-Data-Collective/machine_learning_mission_codes/master/DATA/Mission%20w%20Corpus%20and%20DFM.csv")
datMat <- as.matrix( dat )
#sub_dat <- as.matrix( dat[ , -c(1:118 )] ) #Drop all non-numerical fields and convert to matrix
sub_dat <- dat[ , -c(1:118 )] #Drop all non-numerical fields

# convert from dfm to dtm
## Cast from dfm to tidy, and from tidy to dtm
## https://cran.r-project.org/web/packages/tidytext/vignettes/tidying_casting.html
subTidy <- tidy( sub_dat ) #tidy the subset of data in dfm format
subDTM <- cast_dtm( data = subTidy,
                    document = document,
                    term = term,
                    value = count )


# Create a container, a partition of the dtm data into training and testing sets
container <- create_container( matrix = subDTM,
                               labels = dat$X, # labels corresponding to each document in the matrix 
                               trainSize = 1:3000, # which documents to use to train the model
                               testSize = 3001:3446, # which documents to set aside to test the model
                               virgin = FALSE #we are not classifying "virgin" docs, we are still evaluating docs
                               ) 

# Generate the trained data for the model
SVM <- train_model( container, "SVM" ) 

# Classify the newly generated data into predicted codes and probabilities
SVM_Classify <- classify_model( container, SVM ) 

# Generate analytics
SVM_Analytics <- create_analytics( container, SVM_Classify )
summary( SVM_Analytics )
1 - mean(SVM_Analytics@document_summary[,8]) # calculate the accuracy #Thanks to Adam Hayes


# Cross Validate
SVM <- cross_validate( container = container,
                       #nfold = 4,
                       algorithm = "SVM",
                       #seed = 
                      )
