##Assumption: data set has been downloaded and extracted to data folder  under current working directory
# Read train/test data to data frame
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#Combind train/test to one data set - "total"
y_total <- rbind(y_test, y_train)
X_total <- rbind(X_test, X_train)
subject_total <- rbind(subject_test, subject_train)

#read features.txt to get features names
features <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- c("VOrder", "VName")

#set names for total data and add Subject/Activity columns
names(X_total) <- features$VName
names(y_total) <- c("Activity")
names(subject_total) <- c("Subject")

# complete data set - step 1 requirement
data <- cbind(subject_total, y_total, X_total)

##Step 2 - Extract only measurements on mean and standard deviation
cols <- grep("std|mean", names(data), ignore.case=TRUE)
data1 <- data[,cols]
data1$Subject <- data$Subject
data1$Activity <- data$Activity

##Step 3 Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("Activity", "Label"))
data1$Activity <- activity_labels[data1$Activity, "Label"]

##Step 4
#replace () with empty string, also replace ( or ) or hyphen - with .
#for . that's at the end of strings, we simply remove it
names(data1) <- gsub("()", "", names(data1), fixed=TRUE)
names(data1) <- gsub("[\\(\\),-]", ".", names(data1))
names(data1) <- gsub("\\.$", "", names(data1))

##Step 5 
# use dplyr and group_by function to group data by Subject and Activity and calculate the average
library(dplyr)
data2 <- group_by(data1, Subject, Activity)
tidydata <- summarise(data2, "Average" = mean(tBodyAcc.mean.X:angle.Z.gravityMean))
write.table(tidydata, "./tidydata.txt", row.name=FALSE, quote=FALSE)


