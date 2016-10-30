run_analysis <- function(){
    
    # Load packages for script
    library(dplyr)
    library(tidyr) 
    
    # Read in all data files
    
    ## description of the variables
    features <- read.table("features.txt")
    ## read activity labels
    labels <- read.table("activity_labels.txt")
    
    ## read the x data of the test folder
    data.test<-read.table("test/X_test.txt")
    
    ## Append the data with the activity and the subject
    ## data <- data[ , !duplicated(colnames(data))]
    data.test <- cbind(data.test,read.table("test/y_test.txt"))
    data.test <- cbind(data.test, read.table("test/subject_test.txt"))
    
    ## put appropriate column names
    names(data.test) <- c(t(features[2]),"activity","subject")
    
    ## remove duplicate columns and add column for data set
    data.test <- data.test[,!duplicated(colnames(data.test))]
    data.test <- mutate(data.test, set="test")
    
    ## read the x data of the train folder
    data.train <- read.table("train/X_train.txt")
    
    ## Append the data with the activity and the subject
    data.train <- cbind(data.train, read.table("train/y_train.txt"))
    data.train <- cbind(data.train, read.table("train/subject_train.txt"))
    
    ## change column names
    names(data.train) <- c(t(features[2]), "activity" ,"subject")

    ## remove duplicate columns and add column for data set
    data.train <- data.train[,!duplicated(colnames(data.train))]
    data.train <- mutate(data.train, set = "train")
    
    ## Merge the test and train data set
    data <- bind_rows(data.train, data.test)
    
    ## remove unused values
    rm(data.train, data.test)
    
    ## select the rows containing the mean and std values
    data <-select(data, contains("ean"), contains("std"),activity, subject, set)

    ## Merge the activity labels into the data set
    data[["activity"]] <- labels[match(data[['activity']],labels[['V1']]),'V2']
    
    ## group data by subject and activity
    data <- group_by(data, subject, activity)
    
    ## calculate mean value for each subject and activity
    Tidy <- summarize_each(data,funs(mean),-set)
    
    ## write data to the disc as .txt file
    write.table(Tidy, "Tidy.txt", row.name=FALSE)

}
    
    

