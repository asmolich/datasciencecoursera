# Introduction

The script `run_analysis.R`
- downloads the data from
  [UCI Machine Learning Repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  [Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
- merges the training and test sets to create one data set 
- replaces `activity` values in the dataset with descriptive activity names
- extracts only the measurements (features) on the mean and standard deviation
  for each measurement
- appropriateddly labels the columns with descriptive names
- creates a second, independent tidy dataset with an average of each variable
  for each each activity and each subject. In other words, same type of
  measurements for a particular subject and activity are averaged into one value
  and the tidy data set contains these mean values only. The processed tidy data
  set is also exported as csv file.
  
# The original data set

The original data set is split into training and test sets (70% and 30%,
respectively) where each partition is also split into three files that contain
- measurements from the accelerometer and gyroscope
- activity label
- identifier of the subject

# Getting and cleaning data

If the data is not already available in the `data` directory, it is downloaded
from UCI repository.

The first step of the preprocessing is to merge the training and test
sets. Two sets combined, there are 10,299 instances where each
instance contains 561 features (560 measurements and subject identifier). After
the merge operation the resulting data, the table contains 562 columns (560
measurements, subject identifier and activity label).

After the merge operation, mean and standard deviation features are extracted
for further processing. 

Next, the activity labels are replaced with descriptive activity names, defined
in `activity_labels.txt` in the original data folder.

The final step creates a tidy data set with the average of each variable for
each activity and each subject. 
The tidy data set is exported to `tidy-UCI-HAR-dataset.txt` where the first row
is the header containing the names for each column.
The tidy data set is exported to `tidy-UCI-HAR-avgs-dataset.txt` where the first
row is the header containing the names for each column.

# Resulting set of features 
*               tBodyAcc-mean()-X
*               tBodyAcc-mean()-Y
*               tBodyAcc-mean()-Z
*                tBodyAcc-std()-X
*                tBodyAcc-std()-Y
*                tBodyAcc-std()-Z
*            tGravityAcc-mean()-X
*            tGravityAcc-mean()-Y
*            tGravityAcc-mean()-Z
*             tGravityAcc-std()-X
*             tGravityAcc-std()-Y
*             tGravityAcc-std()-Z
*           tBodyAccJerk-mean()-X
*           tBodyAccJerk-mean()-Y
*           tBodyAccJerk-mean()-Z
*            tBodyAccJerk-std()-X
*            tBodyAccJerk-std()-Y
*            tBodyAccJerk-std()-Z
*              tBodyGyro-mean()-X
*              tBodyGyro-mean()-Y
*              tBodyGyro-mean()-Z
*               tBodyGyro-std()-X
*               tBodyGyro-std()-Y
*               tBodyGyro-std()-Z
*          tBodyGyroJerk-mean()-X
*          tBodyGyroJerk-mean()-Y
*          tBodyGyroJerk-mean()-Z
*           tBodyGyroJerk-std()-X
*           tBodyGyroJerk-std()-Y
*           tBodyGyroJerk-std()-Z
*              tBodyAccMag-mean()
*               tBodyAccMag-std()
*           tGravityAccMag-mean()
*            tGravityAccMag-std()
*          tBodyAccJerkMag-mean()
*           tBodyAccJerkMag-std()
*             tBodyGyroMag-mean()
*              tBodyGyroMag-std()
*         tBodyGyroJerkMag-mean()
*          tBodyGyroJerkMag-std()
*               fBodyAcc-mean()-X
*               fBodyAcc-mean()-Y
*               fBodyAcc-mean()-Z
*                fBodyAcc-std()-X
*                fBodyAcc-std()-Y
*                fBodyAcc-std()-Z
*           fBodyAcc-meanFreq()-X
*           fBodyAcc-meanFreq()-Y
*           fBodyAcc-meanFreq()-Z
*           fBodyAccJerk-mean()-X
*           fBodyAccJerk-mean()-Y
*           fBodyAccJerk-mean()-Z
*            fBodyAccJerk-std()-X
*            fBodyAccJerk-std()-Y
*            fBodyAccJerk-std()-Z
*       fBodyAccJerk-meanFreq()-X
*       fBodyAccJerk-meanFreq()-Y
*       fBodyAccJerk-meanFreq()-Z
*              fBodyGyro-mean()-X
*              fBodyGyro-mean()-Y
*              fBodyGyro-mean()-Z
*               fBodyGyro-std()-X
*               fBodyGyro-std()-Y
*               fBodyGyro-std()-Z
*          fBodyGyro-meanFreq()-X
*          fBodyGyro-meanFreq()-Y
*          fBodyGyro-meanFreq()-Z
*              fBodyAccMag-mean()
*               fBodyAccMag-std()
*          fBodyAccMag-meanFreq()
*      fBodyBodyAccJerkMag-mean()
*       fBodyBodyAccJerkMag-std()
*  fBodyBodyAccJerkMag-meanFreq()
*         fBodyBodyGyroMag-mean()
*          fBodyBodyGyroMag-std()
*     fBodyBodyGyroMag-meanFreq()
*     fBodyBodyGyroJerkMag-mean()
*      fBodyBodyGyroJerkMag-std()
* fBodyBodyGyroJerkMag-meanFreq()
