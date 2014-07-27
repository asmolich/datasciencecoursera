data.file <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
local.data.file <- './data/UCI_HAR_Dataset.zip'
local.data.dir <- './data/UCI HAR Dataset'
tidy.data.file <- './tidy-UCI-HAR-dataset.txt'
tidy.avgs.data.file <- './tidy-UCI-HAR-avgs-dataset.txt'

# Make sure the original data file is in the data directry, downloading
# it if needed (and allowed)
if (!file.exists("data")) {
    message("Creating data directory")
    dir.create("data")
}
if (! file.exists(local.data.file)) {
    message("Downloading data")
    download.file(data.file, destfile = local.data.file, method = 'curl')
    unzip(local.data.file, exdir="data")
}

# Fail if unzipped directory does not exist
if (! file.exists(local.data.dir)) {
    stop('Directory does not exist.')
}

# Read activity labels
acts <- read.table(paste(local.data.dir, 'activity_labels.txt', sep = '/'),
                   col.names = c('id', 'name'))

# Read feature labels
features <- read.table(paste(local.data.dir, 'features.txt', sep = '/'),
                       col.names = c('id', 'name'))

# Read the plain data files, assigning sensible column names
train.X <- read.table(paste(local.data.dir, 'train', 'X_train.txt', sep = '/'),
                      col.names = features$name)
train.y <- read.table(paste(local.data.dir, 'train', 'y_train.txt', sep = '/'),
                      col.names = c('activity'))
train.subject <- read.table(paste(local.data.dir, 'train', 'subject_train.txt',
                                  sep = '/'),
                            col.names = c('subject'))

test.X <- read.table(paste(local.data.dir, 'test', 'X_test.txt', sep = '/'),
                     col.names = features$name)
test.y <- read.table(paste(local.data.dir, 'test', 'y_test.txt', sep = '/'),
                     col.names = c('activity'))
test.subject <- read.table(paste(local.data.dir, 'test', 'subject_test.txt',
                                 sep = '/'),
                           col.names = c('subject'))

# Merge the training and test sets
X <- rbind(train.X, test.X)
y <- rbind(train.y, test.y)
subject <- rbind(train.subject, test.subject)

# Extract just the mean and SD features
# Note that this includes meanFreq()s - it's not clear whether we need those,
# but they're easy to exlude if not needed.
X <- X[, grep('mean|std', features$name)]

# Convert activity labels to meaningful names
y$activity <- acts[y$activity,]$name

# Merge partial data sets together
tidy.data.set <- cbind(subject, y, X)

# Dump the data set
write.csv(tidy.data.set, tidy.data.file)

# Compute the averages grouped by subject and activity
tidy.avgs.data.set <- aggregate(tidy.data.set[, 3:dim(tidy.data.set)[2]],
                                list(tidy.data.set$subject,
                                     tidy.data.set$activity),
                                mean)
names(tidy.avgs.data.set)[1:2] <- c('subject', 'activity')

# Dump the second data set
write.csv(tidy.avgs.data.set, tidy.avgs.data.file)