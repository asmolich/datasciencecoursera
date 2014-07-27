# Usage
The script `run_analysis.R`
- downloads the data from
  [UCI Machine Learning Repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
    * [Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
- merges the training and test sets to create one data set 
- replaces `activity` values in the dataset with descriptive activity names
- extracts only the measurements (features) on the mean and standard deviation
  for each measurement
- appropriateddly labels the columns with descriptive names
- creates a second, independent tidy dataset with an average of each variable
  for each each activity and each subject. In other words, same type of
  measurements for a particular subject and activity are averaged into one value
  and the tidy data set contains these mean values only. The processed tidy data
  set is also exported as txt file in csv format.

# Run
Run `source("run_analysis.R")`. It will generate two new files `tidy-UCI-HAR-dataset.txt` and `tidy-UCI-HAR-avgs-dataset.txt` in your working directory.

