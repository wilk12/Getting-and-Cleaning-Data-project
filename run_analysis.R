
# download the file
#mainDir <- getwd()

#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url, "samsungdata.zip")
#ifelse(!dir.exists(file.path(mainDir, "project_files")), dir.create(file.path(mainDir, "project_files")), FALSE)
#unzip("samsungdata.zip", exdir = "./project_files")
setwd("./project_files/UCI HAR Dataset")

# Load the data from UCI HAR Dataset
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

setwd("./test")
subject_test <- read.table("subject_test.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")

setwd("..")
setwd("./train")
subject_train <- read.table("subject_train.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")

# begin merging tables to create 1 table with all information

# add the names to the activity labels
y_test$activity <- as.character(factor(y_test$V1, labels = activity_labels$V2))
y_train$activity <- as.character(factor(y_train$V1, labels = activity_labels$V2))

x_full <- rbind(x_test, x_train)
y_full <- rbind(y_test, y_train)
subject_full <- rbind(subject_test, subject_train)

# make column names that are clearer
names(subject_full) <- "subject"
features$V2 <- as.character(features$V2)
features$V2 <- gsub("[-()]+", "_", features$V2)
features$V2 <- tolower(features$V2)

# give variable of 561 columns in x files
names(x_full) <- features$V2

# Extract only the measurements on the mean and standard deviation for each measurement
x_full <- x_full[,grep("mean|std", names(x_full))]

#add activity column to data as a factor
x_full$activity <- as.factor(y_full$activity)

#add subject column to data as a factor
x_full$subject <- as.factor(subject_full$subject)

# create the tidy dataset with mean for each measurment arranged by subject and activity
tidyData <- aggregate(. ~ subject+activity, data = x_full, FUN = mean)

write.table(tidyDate, "tidy_data_set.txt", row.names = FALSE)
