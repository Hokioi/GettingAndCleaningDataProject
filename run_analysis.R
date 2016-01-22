# Analysis script for Getting and Cleaning Data Course Project


#This script:
  ## Loads the relevant tables from the Human Activity Recognition Using Smartphones Dataset v1.0 into R
  ## Merges the training and the test sets to create one data set.
  ## Extracts only the measurements on the mean and standard deviation for each measurement.
  ## Uses descriptive activity names to name the activities in the data set
  ## Labels the data set with descriptive variable names.
  ## Creates a second, independent tidy data set with the average of each variable for each activity and subject.
  ## Saves the first dataset as "accelerometerTidy.csv"
  ## Saves the second dataset as "accelerometerAverages.csv"


# Download and extract the relevant files into R

  ## Download files

    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)

  ## Read the relevant data into R

    trainData <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))
    trainLabels <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
    trainSubjects <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))
    testData <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"))
    testLabels <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))
    testSubjects <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))
    activityLabels <- read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"))
    features <- read.table(unz(temp, "UCI HAR Dataset/features.txt"))

  ## Unlink the temporary file
    unlink(temp)

  ## Record the download date
    DateDownloaded <- date()
    DateDownloaded ### "Wed Jan 20 12:08:48 2016"
  

# Merge data into one complete dataset
    
  ## Rename variables
    
    ### Load dplyr package
      library(dplyr)
    
    ### rename subject and label columns
      testSubjects <- rename(testSubjects, subject = V1)
      testLabels <- rename(testLabels, activity = V1)
      
    ### Rename testData columns using the data in column 2 of the features table
      columnnames <- features[ ,2]
      names(testData) <- columnnames
  
  ## Create one table with all of the test data
    test <- cbind(testSubjects, testLabels, testData)
  
  ## Create one table with all of the training data
    train <- cbind(trainSubjects, trainLabels, trainData)
  
  ## Create one table with all of the test and training data, using THE test data column names that were created above
    names(train) <- names(test) ## this needs to be done or rbind throws an errow due to non-matching column names
    complete <- rbind(test, train)

  
# Extract the mean and standard deviation measurements only for each measurement
    
  ## Use grep to create a vector with the column names that have "mean()" or "std()" in them
    meansd <- grep("mean\\(\\)|std\\(\\)", names(complete), value = TRUE)
    
  ## Use select and the meansd vector to extract the subject, activity, mean() and std() columns

    complete2 <-complete[ , meansd] ### works
    complete2 <-complete[ , c("subject", "activity", meansd)]
    
    
# Apply descriptive activity names to the levels of the variable "activity"
    
  ## Change activity to a factor variable
    
    complete2$activity <- as.factor(as.integer(complete2$activity))
    
  ## Use the revalue function of the plyr package to assign new values to the levels
  ## (uses the levels specified in the activityLabels data frame, but using lower case)
    
    library(plyr)
    complete3 <- mutate(complete2, activity = revalue(complete2$activity, 
                        c("1" = "walking", "2" = "walking_upstairs", "3" = "walking_downstairs", 
                          "4" = "sitting", "5" = "standing", "6" = "laying")))
    
  ## Detach plyr package as it interferes with subsequent operations of dplyr
    detach("package:plyr", unload=TRUE)
    
    
# Assign descriptive variable names to the mean and sd variables
    
  ## In principle, names of variables should be: 
    ## all lower case where possible
    ## descriptive
    ## not duplicated
    ## not have underscores, dots, or white spaces
    
  ## The following code:
    ## removes "()" as they are reserved characters and unecessary
    ## removes "-" as it is a reserved character that can make subsequent analysis difficult
    ## changes "std" to "sd" as sd is a more commonly used abbrieviation for standard deviation
    ## does NOT convert variable names to full descriptions because this would make them excessively long
    ## does NOT convert all characters to lower case because this would make them difficult to interpret


    complete3names <- names(complete3)
    complete3namesb <- gsub("\\(\\)", "", complete3names)
    complete3namesc <- gsub("-","", complete3namesb)
    complete3namesd <- gsub("std", "sd", complete3namesc)
  
    names(complete3) <- complete3namesd
  
    
# Save final data set locally as .txt
  
  ## Set working directory as needed for your file system
    getwd()
    ### setwd(your working directory)
    getwd()
  
  ## Create a sub-directory for the data
  
    if (!file.exists("tidy_data")) {
      dir.create("tidy_data")
    }
  
  ## Save table
  
    write.table(complete3, file = "tidy_data/accelerometerTidy.txt", row.names = FALSE)
  
  
# Create a second tidy data set with the average of each variable for each activity and each subject.

    averages <- complete3 %>%
                group_by(subject, activity) %>%
                summarise_each(funs(mean))
    
    ## I have retained a table structure that contains multiple measurement variables per row.
    ## This is because each measurement measures a different aspect of the same activity
    ## That is, they all of the measurements in a row relate to the same observation.
    ## Retaining this structure is a best-fit with the tidy data principle of one observation per row.
    
    
  ## Rename measurement variables with the suffix: "avg" so that they do not duplicate the variable names 
  ## in the accelerometerTidy.csv table
    
    averagesnames <- names(averages[3:68])
    averagesnames2 <- paste(averagesnames, "avg", sep = "")
    averagesnames3 <- (c("subject", "activity", averagesnames2))
    
    names(averages) <- averagesnames3
    
    
# Save second data set
  
    write.table(averages, file = "tidy_data/accelerometerAverages.txt", row.names = FALSE)
    