=================
This is a modified version of the original _features.txt_ file distributed with the
UCI HAR Dataset, created to fulfil the requirements of the Getting and Cleaning
Data course Peer Assessment by Johns Hopkins Bloomberg School of Public Health on the 
Coursera platform.
Modifications made by Flavio Massimo Saldicco on 24 Sep 2015.

The original data sets have been transformed and two tidy data sets have been produced:

* tstComplete - contains the full tidy test data (2947 observations of 564 variables)
* trnComplete - contains the full tidy train data (7352 observations of 564 variables)

After merging this two data sets into a final consolidated data set:

* finalDS - contains tidy and consolidated test and train data sets (10299 observations of 69 variables)

a summarising data set has been produced:

* sumDS - contains (180 observations of 69 variables).
 
The summarising data set is derived from the consolidated one (finalDS), by applying grouping by subject code (sub_code) and activity description (act_descr); then the mean() of each measure (i.e., column) have been calculated. Note that, because of the grouping, this summarized data set only has (30 subjects * 6 activities) = 180 observations. Because only the columns containing a mean() or a standard deviation (std()) have been retained in the summarisation, the total number of columns in the summarised data set is 69 (subject code, activity description, activity code, plus 66 mean() of features).

The additional variables contained in the three above mentioned data sets are:

* sub_code - is the subject code i.e., the code of the person which the observation is related to, as derived from the "subject_test.txt" or "subject_train.txt" data files.

* act_code - is the activity code, as derived from the "y_test.txt" or "y_train.txt" data files.

* act_descr - is the activity description, as derived by looking up the activity code in the "activity_labels.txt" data file.

For a full description of the remaining variables, please refer to the rest of this document, after headline "Feature Selection".

This is the end of modifications introduced by Flavio Massimo Saldicco.
From now on, the file is the original one as distributed with the UCI HAR Dataset.
=================


Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
