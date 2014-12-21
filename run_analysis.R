run_analysis <- function()
{
     library(dplyr)
     
     ## Merges the training and the test sets to create one data set.
     df1 <- read.table("UCI HAR Dataset/train/X_train.txt")
     df2 <- read.table("UCI HAR Dataset/test/X_test.txt")
     merged_df <- rbind(df1, df2)
    
     ## Retrieves the names of columns of the dataset from feature.txt
     names <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
     names <- names[,2]
     colnames(merged_df) <- names
     
     ## Extracts only the measurements on the mean and standard deviation for each measurement. 
     okcol <- sort(c(grep("mean", names), grep("std", names)))
     subset_data <- merged_df[,okcol]
     colnames(subset_data) <- names[okcol]
     
    ##Uses descriptive activity names to name the activities in the data set
    act1 <- read.table("UCI HAR Dataset/train/Y_train.txt")
    act2 <- read.table("UCI HAR Dataset/test/Y_test.txt")
    merged_act <- rbind(act1, act2)    
    activities <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
    subset_data$Activity = activities[merged_act[,1],2]
    
     ##adding subject id
     sub1 <- read.table("UCI HAR Dataset/train/subject_train.txt")
     sub2 <- read.table("UCI HAR Dataset/test/subject_test.txt")
    merged_sub <- rbind(sub1, sub2)
    subset_data$Subject = merged_sub[,1]
     
    ##Appropriately labels the data set with descriptive variable names. 
    colnames(subset_data) <- make.names(colnames(subset_data))
    
    ##From the data set in step 4, creates a second, independent tidy data set 
    ##with the average of each variable for each activity and each subject.
    tidy <- tbl_df(subset_data)
    tidy <- group_by(tidy, Subject, Activity)
    summarise_each(tidy, funs(mean))
    
}