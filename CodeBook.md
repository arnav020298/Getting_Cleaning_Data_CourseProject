# CodeBook run_analysis.R


This CodeBook explains the variables and process used in the run_analysis.R script that produced the TidyData.txt file



##  Information about the variables


    features <- features.txt : 561 rows, 2 columns

 "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ."

    activities <- activity_labels.txt : 6 rows, 2 columns

 "Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The file lists Class labels with their activity name taken during the corresponding measurements"

    sTest <- test/subject_test.txt : 2947 rows, 1 column

 "Data of the 30% of 30 volunteers within an age bracket of 19-48 years, performing the test"

    x_test <- test/X_test.txt : 2947 rows, 561 column

 "Test features measurments data set"

    y_test <- test/y_test.txt : 2947 rows, 1 column

 "Test activity code data set"

    sTrain <- test/subject_train.txt : 7352 rows, 1 column

 "Data of the 70% of 30 volunteers within an age bracket of 19-48 years, performing the train"

    x_train <- test/X_train.txt : 7352 rows, 561 columns

 "Train features measurments data set"

    y_train <- test/y_train.txt : 7352 rows, 1 column

 "Train activity code data set"



##  Information about the summary choices


According to the requirements, the data included extracts only of the measurements on the mean and standard deviation for each measurement.

    msd: 10299 rows, 88 columns.

Created from the data set that merged training and test sets data, by selection of the variables subject, activity and the data of measurements on the mean and standard deviation for each measurement.

## Information about the experimental study design

1. Load required packages
        
       library(dplyr)
   
2. Download data from the ulr source

    Data is downloaded from the url and the .zip files are extracted to the folder  UCI HAR Dataset. 

       download.file(...)
       unzip(...)

3. Reading Data from the files
   
    Data is assigned to each variable according to the "Information about the variables" part.
       
       varible <- read.table(...)
       
4. Merging the training and the test sets to create one data set.

    Variables x, y and subjects are created by binding data from training and test.
    
       x <- rbind(x_train, x_test) : 10299 rows, 561 columns
       y <- rbind(y_train, y_test) : 10299 rows, 1 column
       subjects <- rbind(sTrain, sTest) : 10299 rows, 1 column
       
    A new Data set called Data is created by binding subjects, x and y.

       Data <- cbind (subjects, x, y) : 10299 rows, 563 columns
      
5. Extracts only the measurements on the mean and standard deviation for each measurement.
      
    A new data set called msd is created by selecting mean and standard deviation as states in "Information about the summary choices" part.
    
       msd <- select(Data, subject, activity, contains(c("mean","std"))) : 10299 rows, 88 columns
      
6. Uses descriptive activity names to name the activities in the data set.

    Activity class column (number) of the msd is  replaced with the corresponding activity (letters) located in the  second column of the activities variable.

7. Appropriately labels the data set with descriptive variable names.

    The data labels are reassigned with the appropiate descriptive variable name, for each of the variables, using gsub function.
    
       names(msd) <- gsub("inappropiate","appropiate", names(msd))

8. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

    A file called TidyData.txt is created by grouping the msd data by subject and activity, and sumarizing the means of each variable.
    
       TidyData <- msd %>% group_by(subject, activity) %>% summarise_all(funs(mean)) : 180 columns, 88 rows
       
       write.table(TidyData, "TidyData.txt", row.name=FALSE)