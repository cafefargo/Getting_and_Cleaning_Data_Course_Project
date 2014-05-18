Getting_and_Cleaning_Data_Course_Project
========================================

~ Study Design

* The information below was taken from the Course Project description:
*     https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions

* The data used for this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
* The data description is available at the site where the data was obtained:
*     http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
  
* Data used for the project was obtained from here:
*     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
* Code Book

* It pretties up the column labels, removes "()-," characters, sets relevant labels (Mean for mean and Std for standard deviation)
* to CamelCase, and makes the names human readable.

* Examples of how the column labels have been changed in the tidy.txt data set from the raw date to make them more readable:

* Original Name           New Name
* tBodyAcc-mean()-X       tBodyAccelerationMeanX
* tBodyAcc-mean()-Y       tBodyAccelerationMeanY
* tBodyAcc-mean()-Z       tBodyAccelerationMeanZ
* tBodyAcc-std()-X        tBodyAccelerationStandardDeviationX
* etc                     etc
 
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
* Subject - the subject number - there are 30 total subjects
* ActivityLabel - the type of activity (e.g. WALKING, WALKING_UPSTAIRS, etc)
* The rest of the columns represent the average for that particular variable.  These columns represent all the columns from the
* raw data thad had "mean" or "std" in their names.

* The list of variables:

* "Subject" "ActivityLabel" "tBodyAccelerationMeanX" "tBodyAccelerationMeanY" "tBodyAccelerationMeanZ" "tGravityAccelerationMeanX"
* "tGravityAccelerationMeanY" "tGravityAccelerationMeanZ" "tBodyAccelerationJerkMeanX" "tBodyAccelerationJerkMeanY"
* "tBodyAccelerationJerkMeanZ" "tBodyGyroscopeMeanX" "tBodyGyroscopeMeanY" "tBodyGyroscopeMeanZ" "tBodyGyroscopeJerkMeanX"
* "tBodyGyroscopeJerkMeanY" "tBodyGyroscopeJerkMeanZ" "tBodyAccelerationMagnitudeMean" "tGravityAccelerationMagnitudeMean"
* "tBodyAccelerationJerkMagnitudeMean" "tBodyGyroscopeMagnitudeMean" "tBodyGyroscopeJerkMagnitudeMean" "fBodyAccelerationMeanX"
* "fBodyAccelerationMeanY" "fBodyAccelerationMeanZ" "fBodyAccelerationMeanFrequencyX" "fBodyAccelerationMeanFrequencyY"
* "fBodyAccelerationMeanFrequencyZ" "fBodyAccelerationJerkMeanX" "fBodyAccelerationJerkMeanY" "fBodyAccelerationJerkMeanZ"
* "fBodyAccelerationJerkMeanFrequencyX" "fBodyAccelerationJerkMeanFrequencyY" "fBodyAccelerationJerkMeanFrequencyZ"
* "fBodyGyroscopeMeanX" "fBodyGyroscopeMeanY" "fBodyGyroscopeMeanZ" "fBodyGyroscopeMeanFrequencyX" "fBodyGyroscopeMeanFrequencyY"
* "fBodyGyroscopeMeanFrequencyZ" "fBodyAccelerationMagnitudeMean" "fBodyAccelerationMagnitudeMeanFrequency"
* "fBodyBodyAccelerationJerkMagnitudeMean" "fBodyBodyAccelerationJerkMagnitudeMeanFrequency" "fBodyBodyGyroscopeMagnitudeMean"
* "fBodyBodyGyroscopeMagnitudeMeanFrequency" "fBodyBodyGyroscopeJerkMagnitudeMean" "fBodyBodyGyroscopeJerkMagnitudeMeanFrequency"
* "AngletBodyAccelerationMeanGravity" "AngletBodyAccelerationJerkMeanGravityMean" "AngletBodyGyroscopeMeanGravityMean"
* "AngletBodyGyroscopeJerkMeanGravityMean" "AngleXGravityMean" "AngleYGravityMean" "AngleZGravityMean"
* "tBodyAccelerationStandardDeviationX" "tBodyAccelerationStandardDeviationY" "tBodyAccelerationStandardDeviationZ"
* "tGravityAccelerationStandardDeviationX" "tGravityAccelerationStandardDeviationY" "tGravityAccelerationStandardDeviationZ"
* "tBodyAccelerationJerkStandardDeviationX" "tBodyAccelerationJerkStandardDeviationY" "tBodyAccelerationJerkStandardDeviationZ"
* "tBodyGyroscopeStandardDeviationX" "tBodyGyroscopeStandardDeviationY" "tBodyGyroscopeStandardDeviationZ"
* "tBodyGyroscopeJerkStandardDeviationX" "tBodyGyroscopeJerkStandardDeviationY" "tBodyGyroscopeJerkStandardDeviationZ"
* "tBodyAccelerationMagnitudeStandardDeviation" "tGravityAccelerationMagnitudeStandardDeviation"
* "tBodyAccelerationJerkMagnitudeStandardDeviation" "tBodyGyroscopeMagnitudeStandardDeviation"
* "tBodyGyroscopeJerkMagnitudeStandardDeviation" "fBodyAccelerationStandardDeviationX" "fBodyAccelerationStandardDeviationY"
* "fBodyAccelerationStandardDeviationZ" "fBodyAccelerationJerkStandardDeviationX" "fBodyAccelerationJerkStandardDeviationY"
* "fBodyAccelerationJerkStandardDeviationZ" "fBodyGyroscopeStandardDeviationX" "fBodyGyroscopeStandardDeviationY"
* "fBodyGyroscopeStandardDeviationZ" "fBodyAccelerationMagnitudeStandardDeviation"
* "fBodyBodyAccelerationJerkMagnitudeStandardDeviation" "fBodyBodyGyroscopeMagnitudeStandardDeviation"
* "fBodyBodyGyroscopeJerkMagnitudeStandardDeviation"

* This description below of the data was taken from the features_info.txt file included with the raw data.

* The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

* Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

* Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

* These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
angle(): Angle between two vectors.

* Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

