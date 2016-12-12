# tidy-data-project

The assignment was to create a tidy data set that future analyisis could be performed on. 
A further explanation of the variables is in the CodeBook.md file.  
If you run the code in the run_analysis.R file you will get the tidy data set.


## Overview of Obtaining, Cleaning and Aggregating the Data

The [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) comes in a zip file. 
Once downloaded and unzipped it produces a folder named 'UCI HAR Dataset'.  This folder also contains 2 subfolders.  Below
is a description of the files used from each folder.

#### From the 'UCI HAR Dataset' folder:
+ activity_labels.txt - This shows the names for the 6 activity levels and their corresponding number.
+ features.txt - This shows a list of all the features

#### from the 'test' subfolder:
+ subject_test.txt - List showing which subject that data came from
+ X_test.txt - Test set
+ y_test.txt - Test labels

#### fromt the 'train' subfolder:
+ subject_train.txt - List showing which subject the data came from
+ X_train.txt - Training set
+ y_train.txt - Training labels

### Combining Files to Build Data Frame with All of the Information required
When run_analysis.R is executed it assumes your working directory is the */UCI HAR Dataset directory.  All of the .txt files listed
above are read in as data frames using the data.table function in the data.table package.  Names are added to activities.  Then the
test data and training data are combined into one data set.  

###  Clean up Variable names
+ Replace any "-" or "()" symbols with an underscore "_"
+ Convert all letters to lower case
+ Names of the variables in the full data set are changed to the cleaned up names from the features.txt file.

###  Subset of Data Variables
+ Only the features using mean and standard deviation('std') measurements were included
+ 2 more variables are added
..1. The Activity
..2. The Subject Performing Activity

### Make tidy data set with the average of each variable for each activity and each subject
The aggregate command was used for this.  The data was aggregated by subject and activity using the mean function to perform this.
