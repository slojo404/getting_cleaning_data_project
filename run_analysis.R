# load only the list of activity labels for later translation of activity codes to names
activity_labels <- read.table("./UCI HAR\ Dataset/activity_labels.txt", colClasses = c(rep("NULL", 1), rep("character", 1)))

# load only the list of feature names
feature_labels <- read.table("./UCI HAR\ Dataset/features.txt", colClasses = c(rep("NULL", 1), rep("character", 1)))

# find features with a name that ends in either mean() or std()
cols_idx <- grepl("^.+(mean\\(\\)|std\\(\\)).*$",feature_labels[,])

# we pull out the names for only the columns we intend to read in later
X_col_names <- feature_labels[which(cols_idx),]

# now that we have located which columns correspond to a mean or std feature
# we can construct a vector to use for our colClasses paremeter to read.table 
# so we only read in the columns we are interested in
cols_to_read <- ifelse(cols_idx, "numeric", "NULL")

# Construct X data

# First the train dataset
X_train <- read.table("./UCI HAR\ Dataset/train/X_train.txt", colClasses = cols_to_read)
# Then the test dataset
X_test <- read.table("./UCI HAR\ Dataset/test/X_test.txt", colClasses = cols_to_read) 
# We then combine the train and test datasets
X <- rbind(X_train,X_test)

# cleanup x column names?

# Construct Y data

# First read in train
y_train <- read.table("./UCI HAR\ Dataset/train/y_train.txt")
# Then read in test
y_test <- read.table("./UCI HAR\ Dataset/test/y_test.txt")
# We then combine the train and test datasets
y <- rbind(y_train,y_test)

# now we convert y activity codes into activity names
activities <- activity_labels[y[,1],]

# Construct subject data

# First read in train
subject_train = read.table("./UCI HAR\ Dataset/train/subject_train.txt")
# Then read in test
subject_test = read.table("./UCI HAR\ Dataset/test/subject_test.txt")
# We then combine the train and test datasets
subject <- rbind(subject_train, subject_test)

# Merge into single dataframe

# First create the vector of column names
col_names <- c("subject", "activity", X_col_names)
# "merge" via column bind into single dataframe
data <- cbind(subject, activities, X)
# set the column names
names(data) <- col_names

library(data.table)

# convert to data.table so we can leverage features to make aggregate calculations easier
dt = data.table(data)
#group data by subject and activity and calculate mean for features
tidy <- dt[, lapply(.SD, mean), by=c("subject", "activity"), .SDcols = 3:68]
# order by subject then activity
tidy <- tidy[order(tidy$subject, tidy$activity), ]
# export the tidy dataframe to a text file in the directory where the script is run.
write.table(tidy, "tidy.txt")

# playing with alternative method without using data.table

# split data into groups by subject and activity
##t <- split(data[,3:68], list(data$subject, data$activity))
# get the colMeans for each group then transpose the resulting dataframe 
# so we have rows correspond to the subject activity and columns the features
##tidy <- data.frame(t(sapply(t, colMeans)))
