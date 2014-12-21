coursera-getdata-016-project
============================

Project for Coursera Getting and Cleaning Data

Running run_analysis() from run_analysis.R will do the following : 
- Read files from a folder called UCI HAR Dataset/
- Merge the training and the test sets to create one data set (with rbind)
- Retrieve the names of columns from feature.txt and add them to the merged data
- Subset only the columns which contain the names « mean » or « std » (thanks to the grep command)
- Use Y_train.txt, Y_test.txt and activity_labels.txt to add a new column to the data frame, indicating an Activity label
- Use subject_train.txt and subject_test.txt to add a new column which indicates the Subject ID for each row
- Create and return a tidy data set with the average of each variable for each activity and each subject.
