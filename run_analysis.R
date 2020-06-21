library(dplyr)

### Merge the training and the test sets to create one data set

# Load features
features <- read.table("features.txt", sep = "", header = FALSE)
featurename <- features$V2

# Load training set
training <- read.table("X_train.txt", sep = "", header = FALSE)
# Load training labels
traininglabel <- read.table("y_train.txt", sep = "", header = FALSE)
# Load training subject
trainingsubject <- read.table("subject_train.txt", sep = "", header = FALSE)
# Merge training sets
trainingsets <- cbind(trainingsubject, traininglabel, training)
# Rename training sets
columnnames <- c("Subject", "Activity", featurename)
colnames(trainingsets) <- columnnames

# Load test set
test <- read.table("X_test.txt", sep = "", header = FALSE)
# Load test labels
testlabel <- read.table("y_test.txt", sep = "", header = FALSE)
# Load test subject
testsubject <- read.table("subject_test.txt", sep = "", header = FALSE)
# Merge test sets
testsets <- cbind(testsubject, testlabel, test)
# Rename test sets
colnames(testsets) <- columnnames

# Merge training and test datasets
all <- rbind(trainingsets, testsets)


### Extract only the measurements on the mean and standard deviation for each measurement
# Extract featurenames containing "mean" and "std"
mean <- grep("mean", featurename, value = TRUE)
std <- grep("std", featurename, value = TRUE)
meanstd <- c(mean, std)
# Select columns with "Subject", "Activity" and those with mean and std
meanstddf <- select(all, "Subject", "Activity", all_of(meanstd))

### Use discriptive activity names to name the activities in the data set 
# Load activity label
activitylabel <- read.table("activity_labels.txt", sep = "", header = FALSE)
activityname <- activitylabel$V2
meanstddf$Activity <- factor(meanstddf$Activity, 
                 labels = activityname)

### Appropriately label the dataset with descriptive variable names
#  Already done before merging the dataset

### Create a second, independent tidy data set with the average of each variable for each 
   # activity and each subject

by_meanstddf <- group_by(meanstddf, Subject, Activity)
meandf <- by_meanstddf %>% summarize_all("mean")
write.table(meandf, file = "tidydata.txt", row.name=FALSE)

