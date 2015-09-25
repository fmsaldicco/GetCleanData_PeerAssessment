#####
##### File Name:   run_analysis.R
##### Last Edited: 24 Sep 2015
##### Author:      Flavio Massimo Saldicco
##### Purpose:     This is the script for Peer Assessment developed
#####              in the context of the Getting and Cleaning Data Course
#####              of Johns Hopkins Bloomberg School of Public Health,
#####              hosted on the Coursera platform.
#####              

################################
##### DOWNLOAD DATA FILE - START
################################
##### The following lines (up to the DOWNLOAD DATA FILE - END
##### comment) are only needed to download and unzip the file
##### assignment data files. These lines do not need
##### to be executed if the data files have already
##### been downloaded and unzipped manually.

#set working directory (Note: change it appropriately)
setwd("C:/Users/FlavioMassimo/Desktop/Getting and Cleaning")

#download the data file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "dataset.zip", mode = "wb")
list.files(".")

#unzip the data file into the "UCI HAR Dataset" folder
unzip("dataset.zip")
##############################
##### DOWNLOAD DATA FILE - END
##############################

#############################
##### PERFORM TRANSFORMATIONS
#############################
#set working directory to the "UCI HAR Dataset" one
#Note: change it appropriately!
setwd("C:/Users/FlavioMassimo/Desktop/Getting and Cleaning/UCI HAR Dataset")

#read lookup table with the activity descriptions
act_text <- read.table("activity_labels.txt", header=FALSE, col.names=c("act_code", "act_descr"))
#read the lookup table with the variables descriptions
feat_text <- read.table("features.txt", header=FALSE, col.names=c("feat_code", "feat_descr"))

##### In this phase a tidy test data set is created
#read the subject test data
tstSub <- read.table("test/subject_test.txt", header=FALSE, col.names=c("sub_code"))
#read the activity (code) test data 
tstAct <- read.table("test/y_test.txt", header=FALSE, col.names=c("act_code"))
#read the test data
tstDat <- read.table("test/X_test.txt", header=FALSE)

#start bulding the tidy test data set
#1) bind columns subject and activity code
tstComplete <- cbind(tstSub, tstAct)

#plyr library is needed for next "join" command
#Note: package plyr must be installed beforehand!
library(plyr)

#2) add column activity description (step 3 of the assignment)
tstComplete <- join(tstComplete, act_text, by="act_code")

#3) add data columns
tstComplete <- cbind(tstComplete, tstDat)

#now change the column names (step 4 of the assignment)
colnames(tstComplete) <- c("sub_code", "act_code", "act_descr", as.character(feat_text$feat_descr))

##### At this point we have a tidy data set of the test data called tstComplete;
##### the same transformations are now applied to the train data set.

##### In this phase a tidy train data set is created
#read the subject train data
trnSub <- read.table("train/subject_train.txt", header=FALSE, col.names=c("sub_code"))
#read the activity (code) train data 
trnAct <- read.table("train/y_train.txt", header=FALSE, col.names=c("act_code"))
#read the train data
trnDat <- read.table("train/X_train.txt", header=FALSE)

#start bulding the tidy train data set
#1) bind columns subject and activity code
trnComplete <- cbind(trnSub, trnAct)

#2) add column activity description (step 3 of the assignment)
trnComplete <- join(trnComplete, act_text, by="act_code")

#3) add data columns
trnComplete <- cbind(trnComplete, trnDat)

#now change the column names (step 4 of the assignment)
colnames(trnComplete) <- c("sub_code", "act_code", "act_descr", as.character(feat_text$feat_descr))

##### At this point we also have a tidy data set of the train data called trnComplete.

##### Let's now merge the test and train data sets (tstComplete and trnComplete)
##### into the final consolidated data set (step 1 of the assignment).
finalDS <- rbind(tstComplete, trnComplete)

#now we need to remove all columns which are not a mean nor a
#standard deviation, based on the column name (step 2 of the assignment)
for(i in 564:4) {
    if(grepl("mean|std", colnames(finalDS[i])) == FALSE) {
        finalDS[i] <- NULL
    }
}

#the "meanFreq" columns are retained from the previous loop,
#but they are not "mean" in a strict sense,
#so now they are also eliminated
for(i in 82:4) {
    if(grepl("meanFreq", colnames(finalDS[i])) == TRUE) {
        finalDS[i] <- NULL
    }
}

##### Eventually, we get a tidy and full data set including test
##### and train data, ready to be used to derive a new data set
##### which summarises data (step 5 of the assignment).

#dplyr library is needed for next "group_by/summarise" commands
#Note: package dplyr must be installed beforehand!
library("dplyr")

#create a new data set, grouped by subject and activity, where each
#column is the mean() of the column itself
sumDS <- finalDS %>% group_by(sub_code, act_descr) %>% summarise_each(funs(mean))

#write the new data set into a file for uploading onto Coursera
write.table(sumDS, "sumDS.txt", row.names=FALSE)





