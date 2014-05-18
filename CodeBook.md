Getting_and_Cleaning_Data_Course_Project
========================================

* Study Design
* 
* The information below was taken from the Course Project description:
*     https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions
* The data used for this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
* The data description is available at the site where the data was obtained:
*     http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
*   
* Data used for the project was obtained from here:
*     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*   
*
*
* Code Book
*
* It pretties up the column labels, removes "()-," characters, sets relevant labels (Mean for mean and Std for standard deviation)
* to CamelCase, and makes the names human readable.
* 
* Examples of how the column labels have been changed in the tidy.txt data set to make them more readable:
* 
* Original Name           New Name
* tBodyAcc-mean()-X       tBodyAccelerationMeanX
* tBodyAcc-mean()-Y       tBodyAccelerationMeanY
* tBodyAcc-mean()-Z       tBodyAccelerationMeanZ
* tBodyAcc-std()-X        tBodyAccelerationStandardDeviationX
* ...                     ...
*
* The activity numbers are mapped to the activity labels (i.e. 1 maps to WALKING, 2 maps to WALKING_UPSTAIRS, etc)
* Activity Number     Activity Label
*       1             WALKING
*       2             WALKING_UPSTAIRS
*       3             WALKING_DOWNSTAIRS
*       4             SITTING
*       5             STANDING
*       6             LAYING
* 
* The columns in the output file, tidy.txt are as follows:
* Subject - the subject number
* ActivityLabel - the type of activity (e.g. WALKING, WALKING_UPSTAIRS, etc)
* The rest of the columns represent the average for that particular variable.  These columns represent all the columns from the
* raw data thad had "mean" or "std" in their names.
