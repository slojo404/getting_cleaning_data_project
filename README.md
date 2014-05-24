getting_cleaning_data_project
=============================

Project for coursera course getting and cleaning data

Script assumes it is being run in a directory where the 
UCI HAR Dataset has been extracted into a subfolder named 
"UCI HAR Dataset".

To run simply invoke

Rscript run_analysis.R

or if on windows

rscript.exe run_analysis.R

The script will traverse the directories, load the needed
data and export a summary "tidy" dataset called tidy.txt into
the directory where the script is run.

A file CodeBook.md is included which describes
the variables, data and transformations performed
during the cleanup process.
