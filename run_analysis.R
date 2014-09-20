# Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

setwd("F:/Coursera/Getting Cleaning Data/UCI HAR Dataset")

# 1. Merges the training and the test sets to create one data set


x11 <- read.table("train/X_train.txt")
x12 <- read.table("test/X_test.txt")
X <- rbind(x11, x12)


s11 <- read.table("train/subject_train.txt")
s12 <- read.table("test/subject_test.txt")
S <- rbind(s11, s12)


y11 <- read.table("train/y_train.txt")
y12 <- read.table("test/y_test.txt")
Y <- rbind(y11, y12)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features_names <- read.table("features.txt")
index_features <- grep("-mean\\(\\)|-std\\(\\)", features_names[, 2])
X <- X[, index_features]
names(X) <- features_names[index_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3.Uses descriptive activity names to name the activities in the data set.

activity <- read.table("activity_labels.txt")
activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))
Y[,1] = activity[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(S) <- "subject"
join <- cbind(S, Y, X)
write.table(join, "merged_data2.txt")

# 5.From the data set in step 4, creates a second, independent tidy data set
#   with the average of each variable for each activity and each subject.


uniqueSubjects = unique(S)[,1]
idSubjects = length(unique(S)[,1])
idActivities = length(activity[,1])
idCols = dim(join)[2]
finalresult = join[1:(idSubjects*idActivities), ]

r = 1
for (s in 1:idSubjects) {
  for (a in 1:idActivities) {
    finalresult[r, 1] = uniqueSubjects[s]
    finalresult[r, 2] = activity[a, 2]
    laps <- join[join$subject==s & join$activity==activity[a, 2], ]
    finalresult[r, 3:idCols] <- colMeans(laps[, 3:idCols])
    r = r+1
  }
}
write.table(finalresult, "data_averages2.txt")

