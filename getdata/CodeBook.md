# Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age 
bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial 
linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The 
experiments have been video-recorded to label the data manually. The obtained dataset 
has been randomly partitioned into two sets, where 70% of the volunteers was selected 
for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap 
(128 readings/window). The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency 
components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and frequency 
domain.

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
