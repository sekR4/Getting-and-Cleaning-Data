#########################################################################################
#                                                                                       #
# Coursera: Getting and Cleaning Data Course Project                                    #
#                                                                                       #
# Human Activity Recognition Using Smartphones Data Set                                 #
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   #
#                                                                                       #
# Contributed by:                                                                       #
# Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.   #
# Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly        #
# Support Vector Machine. International Workshop of Ambient Assisted Living             #
# (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012                                        #
# ------------------------------------------------------------------------------------- #
# This script shows the process of getting and working with the data set                #
# and making it tidy for later analysis.                                                #
#                                                                                       #
# Author: Sebastian Kraus @ Chung-Ang University, Seoul                                 #                              #
#                                                                                       #
#########################################################################################

# 1. DOWNLOADING ------------------------------------------------------------------------
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "dta.zip", method = "auto")
unzip("dta.zip")

# 2. READING ----------------------------------------------------------------------------
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features        <- read.table("UCI HAR Dataset/features.txt")

train_subject   <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_set       <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels    <- read.table("UCI HAR Dataset/train/y_train.txt")

colnames(train_subject) <- "subject"
colnames(train_set)     <- features$V2
colnames(train_labels)  <- "activity"

test_subject    <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_set        <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels     <- read.table("UCI HAR Dataset/test/y_test.txt")

colnames(test_subject) <- "subject"
colnames(test_set)     <- features$V2
colnames(test_labels)  <- "activity"

# 3. MERGING TRAINING AND TEST SET ------------------------------------------------------
train_df  <- cbind(train_labels, train_set, train_subject)
test_df   <- cbind(test_labels, test_set, test_subject)
all_df    <- rbind(train_df, test_df)

# 4. EXTRACTING MEAN AND STANDARD DEVIATION ----------
measurements_logic <- colnames(all_df)
measurements_logic <- grepl("activity", measurements_logic, ignore.case = TRUE) | 
  grepl("subject", measurements_logic, ignore.case = TRUE) | 
  grepl("mean", measurements_logic, ignore.case = TRUE) &
  !grepl("meanFreq()", measurements_logic, ignore.case = TRUE) &
  !grepl("angle", measurements_logic, ignore.case = TRUE)| 
  grepl("standard", measurements_logic, ignore.case = TRUE) |
  grepl("std", measurements_logic, ignore.case = TRUE)
  
measurements_data <- all_df[measurements_logic == TRUE]

# 5. DESCRIPTIVE NAMES FOR ACTIVITIES AND LABELS ----------------------------------------
library(qdap)

from1  <- c("^t", "Acc", "-std()", "-mean()", "^f", "Gyro")
from2  <- c("Mag", "BodyBody", "Body", "Gravity", "Jerk")
to1    <- c("Time.", "Accelerometer.", "SD", "MEAN", "FRQ.", "Gyroscope.") 
to2    <- c("Magnitude.", "Body.", "Body.", "Gravity.", "Jerk.") 

names(measurements_data) <- mgsub(pattern = from1,replacement = to1, names(measurements_data))
names(measurements_data) <- mgsub(pattern = from2,replacement = to2, names(measurements_data))
names(measurements_data) <- gsub("^f", "FRQ.", names(measurements_data))
names(measurements_data) <- gsub("^t", "Time.", names(measurements_data))

# 6. TIDYING THE DATA --------------------------------------------------------------------
library(reshape2)
m_data_melt <- melt(measurements_data, id = c("subject", "activity"))
m_data_cl   <- dcast(m_data_melt, subject + activity ~ variable, mean)
write.table(x = m_data_cl,file = "tidy_measurements.txt",quote = FALSE, row.names = FALSE)