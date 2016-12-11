### Original Data
This data is from experiments carried out on a group of 30 volunteers within the age bracket of 19-48 years.  The activities
were broken into six different categories (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). 
Each subject was wearing a Samsung Galaxy s II smartphone on their waist.  The signals were used to estimate variables
of the feature vector for each pattern.  [Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
is the original data set.

### Variables from signals collected ('-XYZ' indicates a collection for each the x,y and z axis)

+ tBodyAcc-XYZ
+ tGravityAcc-XYZ
+ tBodyAccJerk-XYZ
+ tBodyGyro-XYZ
+ tBodyGyroJerk-XYZ
+ tBodyAccMag
+ tGravityAccMag
+ tBodyAccJerkMag
+ tBodyGyroMag
+ tBodyGyroJerkMag
+ fBodyAcc-XYZ
+ fBodyAccJerk-XYZ
+ fBodyGyro-XYZ
+ fBodyAccMag
+ fBodyAccJerkMag
+ fBodyGyroMag
+ fBodyGyroJerkMag

### These are the set of variables that were estimated from these signals:

+ mean(): Mean value
+ std(): Standard deviation
+ mad(): Median absolute deviation 
+ max(): Largest value in array
+ min(): Smallest value in array
+ sma(): Signal magnitude area
+ energy(): Energy measure. Sum of the squares divided by the number of values. 
+ iqr(): Interquartile range 
+ entropy(): Signal entropy
+ arCoeff(): Autorregresion coefficients with Burg order equal to 4
+ correlation(): correlation coefficient between two signals
+ maxInds(): index of the frequency component with largest magnitude
+ meanFreq(): Weighted average of the frequency components to obtain a mean frequency
+ skewness(): skewness of the frequency domain signal 
+ kurtosis(): kurtosis of the frequency domain signal 
+ bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
+ angle(): Angle between to vectors

These combined to create 561 variables in the original data set.

### The Measurements that Were Kept for the Tidy Data Set
+ Mean(): Mean value
+ std(): Standard deviation

### Transformations to original Data
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average..
   of each variable for each activity and each subject.

### Steps Used to Transform Data in the run_analysis.R file
1. Download zipped data, unzip, and read required .txt files into data frames
2. Add names to activities from activity labels.
3. Combine test and train data
4. Create clearer variable names and take those names from features and apply to data frame of values
5. Subset data to include only measurements of mean and std
6. Add the variables containing subject and activity to the data
7. Aggregate data by subject and activity using the mean function.








