## Load required packages
library(dplyr)

##Data download from:
#Human Activity Recognition Using Smartphones Dataset
#Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
#Smartlab - Non Linear Complex Systems Laboratory
#DITEN - Universit‡ degli Studi di Genova.
#Via Opera Pia 11A, I-16145, Genoa, Italy.
#activityrecognition@smartlab.ws
##www.smartlab.ws

Url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('./UCI HAR Dataset.zip'))
  {
    download.file(Url,'./UCI HAR Dataset.zip', mode = 'wb')
    unzip("UCI HAR Dataset.zip", exdir = getwd())
}

## Data from all files of interest is read

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","variables"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("class","activity"))
sTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/x_test.txt", col.names = features$variables)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
sTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/x_train.txt", col.names = features$variables)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")

## 1. Merges the training and the test sets to create one data set.
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subjects <- rbind(sTrain, sTest)
Data <- cbind (subjects, x, y)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
msd <- select(Data, subject, activity, contains(c("mean","std")))

## 3. Uses descriptive activity names to name the activities in the data set
msd$activity <- activities[msd$activity,2]

## 4. Appropriately labels the data set with descriptive variable names.
names(msd) <- gsub("Acc","Accelerometer", names(msd))
names(msd) <- gsub("Gyro","Gyroscope", names(msd))
names(msd) <- gsub("BodyBody","Body", names(msd))
names(msd) <- gsub("Mag","Magnitude", names(msd))
names(msd) <- gsub("^t","Time", names(msd))
names(msd) <- gsub("^f","Frecuency", names(msd))
names(msd) <- gsub("tBody","TimeBody", names(msd))
names(msd) <- gsub("-mean()","Mean", names(msd))
names(msd) <- gsub("-std()","Std", names(msd))
names(msd) <- gsub("-freq()","Frequency", names(msd))
names(msd) <- gsub("angle","Angle", names(msd))
names(msd) <- gsub("gravity","Gravity", names(msd))
names(msd) <- gsub("-","_", names(msd))

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
TidyData <- msd %>%
   group_by(subject, activity) %>%
   summarise_all(funs(mean))
write.table(TidyData, "TidyData.txt", row.name=FALSE)
View(TidyData)