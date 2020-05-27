## read train  data
x_train <- read.table("./train/X_train.txt", header = FALSE, sep = "", dec = ".")
y_train <- read.table("./train/Y_train.txt", header = FALSE, sep = "", dec = ".")
subject_train <- read.table("./train/subject_train.txt", header = FALSE, sep = "", dec = ".")

##read test data
x_test <- read.table("./test/X_test.txt", header = FALSE, sep = "", dec = ".")
y_test <- read.table("./test/Y_test.txt", header = FALSE, sep = "", dec = ".")
subject_test <- read.table("./test/subject_test.txt", header = FALSE, sep = "", dec = ".")
## read activity labels
activity_labels <- read.table("../UCI HAR Dataset/activity_labels.txt")
##read data description
features <- read.table("../UCI HAR Dataset/features.txt", header = FALSE, sep = "")
##1. Merges the training and the test sets to create one data set.
X_total <- rbind(x_train, x_test)
Y_total <- rbind(y_train, y_test)
subject_total <- rbind(subject_train,subject_test)

##2. Extracts only the measurements on the mean and standard deviation for each measurement.
select_var <- grep("mean|std", features[,2])
X_total_mean_std <- X_total[,select_var]

##3. Uses descriptive activity names to name the activities in the data set
colnames(Y_total) <- "activities"
activities <- factor(Y_total$activities, labels = as.character(activity_labels[,2]))

##4. Appropriately labels the data set with descriptive variable names.
total <- cbind(activities,X_total_mean_std)

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
colnames(subject_total) <- "subject"
total <- cbind(activities, subject_total, X_total_mean_std)
library(dplyr)
total_mean <- total %>% group_by(activities, subject) %>% summarise_each(funs(mean))
write.table(total_mean, file = "../UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
