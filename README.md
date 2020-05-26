# Getting-and-Cleaning-Data-Week-4-Assignment

##This data was created to finish the Assignment 4. 
The purpose of the assignment is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data was collected from 30 subjects within an age bracket of 19-48 years. Each person performed six activities (walking, walking_upstairs, walwing_downstairs, sitting, standing and lying) wearing a smartphone which collected the 
3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

###Data description
The data is compartiment in different txt files, the X files corresponds to the measured of the sensors. The variable in data Y indicates the number of the activity, the name of each activity is collected in the activity_labels. 
You also have the subject of each activity and the featuches of each measurement. 

##Code
The code to get a tidy data was written based on the instruction of this assignment.
1. Read the data into R environment in the working directory 'UCI HAR Dataset'. 
2.Merges the training dataset and test dataset to create a new data set. To do that, use the function rbind. You have to bind the X data (train and test), Y data (train and test) and also subject (train and test)
3.Extracts only the measurements on the mean and standard deviation for each measurement.  Use grep command to get column indexes for variable name contains "mean" or "std" in the feature file. Conbine the vector output vector of grep command with X(trains and test) data, to extract only the measurements of mean and standard deviation. 
4.Uses descriptive activity names to name the activities in the data set.  Convert activity labels to characters create a factor with the Y dataset. bind the column of the name of the activities with the X-data
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command (%>%) to create a new tidy dataset with command group_by and summarize_each in dplyr package


