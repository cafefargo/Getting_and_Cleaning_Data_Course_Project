Getting_and_Cleaning_Data_Course_Project
========================================

## Project Purpose

 Program Name: run_analysis.R
 
 Output file: tidy.txt
 
 It merges the training and the test sets to create one data set.
 It extracts only the measurements on the mean and standard deviation for each measurement.
 It uses descriptive activity names to name the activities in the data set.
 It appropriately labels the data set with descriptive activity names. 
 It creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How it works

Unzip the getdata-projectfiles-UCI HAR Dataset.zip data set.

The "Inertial Signals" folder was ignored and no data was used from there.

The following files must be in the current working directory:
*      subject_test.txt
*      X_test.txt
*      y_test.txt
*      subject_train.txt
*      X_train.txt
*      y_train.txt
*      activity_labels.txt
*      features.txt
     
This script reads in the above files.

It pretties up the column labels, removes "()-," characters, sets relevant labels (Mean for mean and Std for standard deviation) to CamelCase, and makes the names human readable.

It creates a unified data set from the 8 input files.
 
* It combines the prettied up "features" column names with the data for "test" and "train" so that the data will have column names.
* It sets the column names for the "Subject" vector for "test" and "train".
* It sets the column names for the "ActivityNumber" vector for "test" and "train".
* It combines the "ActivityNumber" column to the "Subject" data set for "test" and "train".
* It maps the activity labels to the activity numbers for "test" and "train" so the activies are human readable, not just numbers.
* It binds the actual data with the activity for each of "test" and "train".
* It binds the "test" and "train" data sets together to create one large data set.
* It subsets the data to get only those columns for mean and for Standard Deviation 
* It orders the data by subject, by activity.
* It builds a data set, tidy.set, for each subject and activity, with the average for each of the Mean and Standard Deviation Features.
 

## Output from the script
It writes the tidy.txt data set to the current working directory.
