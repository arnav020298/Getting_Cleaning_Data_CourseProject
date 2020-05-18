# Getting_Cleaning_Data_CourseProject
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.

The repository includes the instructions for running the analysis of the Human Activity recongnition dataset. 

##  DataSet

Human Activity Recognition Using Smartphones Dataset-Version 1.0

Author: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Affiliation: Smartlab - Non Linear Complex Systems Laboratory. DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

More info: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Set url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##  Files

1. run_analysis.R.  This file contains the script for:
   
    1.1. Load required packages
   
    1.2. Download data from the ulr source
   
    1.3. Reading Data from the files
   
    1.4. Completing the assignment:
    
       1.4.1. Merges the training and the test sets to create one data set.
      
       1.4.2. Extracts only the measurements on the mean and standard deviation for each measurement.
      
       1.4.3. Uses descriptive activity names to name the activities in the data set.

       1.4.4. Appropriately labels the data set with descriptive variable names.

       1.4.5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

2. TidyData.txt. This file is the result from running the analysis with file 1. 

3. CodeBook.md. This file describes the variables, the data, and any transformations or work performed to clean up the data, during the analysis with file 1 and obtention of file 2.