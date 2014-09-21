url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,dest="C:/Users/Alex/Documents/RStatistics/project.zip")
date()
setwd("C:/Users/Alex/Documents/RStatistics/UCI HAR Dataset")

#Read in test data
xtest <- read.table("X_test.txt")
#Read in training data
xtrain <- read.table("X_train.txt")

#Combine test and training data sets
merged_data <- rbind(xtest,xtrain)

#Read in features (variable names) and add them to merged data
features <- read.table("features.txt")
names(merged_data) <- features$V2

#change variable names based on tidy data principles
names(merged_data) <- tolower(names(merged_data))
names(merged_data) <- gsub("-","",names(merged_data))

#subset of data with mean and std variables
new_data <- merged_data[ ,grep("mean",names(merged_data))]
new_data1 <- merged_data[ ,grep("std",names(merged_data))]
compactdata <- cbind(new_data,new_data1)

#read in labels for the two data sets - the number corresponds to the exercise
trainlabels <- read.table("y_train.txt")
testlabels <- read.table("y_test.txt")

#combine the test and training labels and use descriptive labels
labels <- rbind(testlabels,trainlabels)
names(labels) <- "exercise"
compactdata1 <- cbind(compactdata,labels)
compactdata1$exercise[compactdata1$exercise==1]<- "walking"
compactdata1$exercise[compactdata1$exercise==2]<- "walking upstairs"
compactdata1$exercise[compactdata1$exercise==3]<- "walking downstairs"
compactdata1$exercise[compactdata1$exercise==4]<- "sitting"
compactdata1$exercise[compactdata1$exercise==5]<- "standing"
compactdata1$exercise[compactdata1$exercise==6]<- "laying"

subjecttest <- read.table("subject_test.txt")  
subjecttrain <- read.table("subject_train.txt")
subject <- rbind(subjecttest,subjecttrain)

compactdata1 <- cbind(compactdata1,subject)
names(compactdata1)[88]<- "person"

library(dplyr)
compactdata2 <- group_by(compactdata1,person,exercise)
compactdata3 <- summarise_each(compactdata2,funs(mean))
write.table(compactdata3,file="tidydata.txt",row.name=FALSE)

