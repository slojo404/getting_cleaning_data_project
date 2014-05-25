The data, per course instruction, was pulled from here
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

but it appears the original source of the data is from here
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

Further, additional background about the data can be found here
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

What follows is information about how the original data was transformed into the 
resulting tidy.txt dataset as well as a description of the data and associated 
variables.

Original Data Quick Overview

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
 * Base data from which additional features described in features_info.txt are derived from.
* ./UCI HAR Dataset/test/subject_test.txt
 * Orderered list of subject ids corresponding to the rows of data in X_test.txt and y_test.txt
* ./UCI HAR Dataset/test/X_test.txt
 * Values for feature vector
* ./UCI HAR Dataset/test/y_test.txt
 * Classification of activty
* ./UCI HAR Dataset/train
 * 70% subset of data that can be used for training
* ./UCI HAR Dataset/train/Inertial Signals
* ./UCI HAR Dataset/train/subject_train.txt
* ./UCI HAR Dataset/train/X_train.txt
* ./UCI HAR Dataset/train/y_train.txt

