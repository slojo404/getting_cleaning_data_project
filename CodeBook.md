# CodeBook

### Source of Data
The data, per course instruction, was pulled from here
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

but it appears the original source of the data is from here
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

### Additional Background on Data and Research
Further, additional background about the data can be found here
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### CodeBook Summary
What follows is information about how the original data was transformed into the 
resulting tidy.txt dataset as well as a description of the data and associated 
variables.

### Original Data Quick Overview

* ./UCI HAR Dataset
* ./UCI HAR Dataset/activity_labels.txt  
 * Mapping between activity number and label ie 1 = WALKING
* ./UCI HAR Dataset/features.txt
 * List of all feature names
* ./UCI HAR Dataset/features_info.txt
 * Description of features and how they are derived from source accelerometer/gyro data.
* ./UCI HAR Dataset/README.txt
 * Overview of data and research
* ./UCI HAR Dataset/test
 * 30% subset of data that can be used for testing
* ./UCI HAR Dataset/test/Inertial Signals
 * Base data from which additional features described in features_info.txt are derived from.  We ignore this data since we can create our goal subset tidy dataset from the values in X alone.
* ./UCI HAR Dataset/test/subject_test.txt
 * Orderered list of subject ids corresponding to the rows of data in X_test.txt and y_test.txt
* ./UCI HAR Dataset/test/X_test.txt
 * Values for feature vector
* ./UCI HAR Dataset/test/y_test.txt
 * Classification of activty
* ./UCI HAR Dataset/train
 * 70% subset of data that can be used for training file descriptions are the same as those given for the testing section
* ./UCI HAR Dataset/train/Inertial Signals
* ./UCI HAR Dataset/train/subject_train.txt
* ./UCI HAR Dataset/train/X_train.txt
* ./UCI HAR Dataset/train/y_train.txt

### Transformation Overview
1. Read in high level meta data from features.txt and activity_labels.txt
 1. Since we want to collect only the subset of the features, described in the project description as only those features corresponding to mean or std measurements, we first filter the list of features such that we know the column location of all features that meet that criteria. 
2. Merge subject, X and Y data into one cohesive dataframe for both test and train data.
 1. There are an identical number of rows for each file and they are ordered such that the first line of data in each file corresponds to the first line of data in each of the other files.
 2. We read in the files into separate data frames, being careful to only read in the features we want from the X data given the column locations we discovered earlier,
 3. Update the column of activity codes we obtained from y, to activity labels, using the mapping we aquired from reading in activity_labels.txt 
 4. We then merge the three separate data frames into one.
 5. From the cohesive dataframes we have for test and train, merge them into one data frame with all data.
 6. Group data by subject and activity summarizing the data as the mean of each feature.
 7. Sort dataframe by subject activity.
 8. Export dataframe to tidy.txt
