=====================================================================================
This document describes the steps to deduce the tidydata from run_analysis.R and the provided data set UCI HAR Dataset
@Author: Tracy Pham
=====================================================================================
Step 1: Merges the training and the test sets to create one data set.
=====================================================================================

*** Read provided dataset to data frame. Same steps are applied for both train/test dataset
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

*** Use rbind to merge the data
y_total <- rbind(y_test, y_train)
X_total <- rbind(X_test, X_train)
subject_total <- rbind(subject_test, subject_train)

*** Retrieve column names from features.txt and assign to the merged data set. Also append Subject/Activity columns using cbind
features <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- c("VOrder", "VName")
names(X_total) <- features$VName
names(y_total) <- c("Activity")
names(subject_total) <- c("Subject")

data <- cbind(subject_total, y_total, X_total)

=====================================================================================
Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
=====================================================================================
Find the columns that has "mean" or "std" (Case insensitive) and extract them
cols <- grep("std|mean", names(data), ignore.case=TRUE)
data1 <- data[,cols]
data1$Subject <- data$Subject
data1$Activity <- data$Activity

=====================================================================================
Step 3: Uses descriptive activity names to name the activities in the data set
=====================================================================================
Activity Name is displayed in activity_labels.
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("Activity", "Label"))
data1$Activity <- activity_labels[data1$Activity, "Label"]

=====================================================================================
Step 4: Appropriately labels the data set with descriptive variable names. 
=====================================================================================
Need to format column names according to Goolge R Style Format
replace () with empty string, also replace ( or ) or hyphen - with .
for . that's at the end of strings, we simply remove it
names(data1) <- gsub("()", "", names(data1), fixed=TRUE)
names(data1) <- gsub("[\\(\\),-]", ".", names(data1))
names(data1) <- gsub("\\.$", "", names(data1))

=====================================================================================
Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
=====================================================================================
Use dplyr and group_by to group the data based on Subject and Activity and calculate the average

library(dplyr)
data2 <- group_by(data1, Subject, Activity)
tidydata <- summarise(data2, "Average" = mean(tBodyAcc.mean.X:angle.Z.gravityMean))
write.table(tidydata, "./tidydata.txt", row.name=FALSE, quote=FALSE)


