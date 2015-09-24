# GetCleanData_PeerAssessment
This is the repository for the Getting and Cleaning Data course from Johns Hopkins Bloomberg School of Public Health, hosted on the Coursera platform.

The complete code has been included in one script called run_analysis.R.

The initial lines, marked "DOWNLOAD DATA FILE - START", up to "DOWNLOAD DATA FILE - END" shall only be executed if the data set has to be downloaded from the Internet. If the data set has already been downloaded and unzipped, they can be ignored.

The approach used is based on the creation of two tidy data sets, one for the test observations, and another for the train observations. Therefore, the merge of the two data sets was only performed at the end of the analysis. The rationale for doing that is that it might be useful for other analyses to have two tidy data sets, one referred to the test and the other to the train data.

The script pseudo code is as follows:

1) the lookup tables for the activity labels and features text are loaded.
2) the subject identifiers, the activites code and the measures are loaded for the test data in 3 separate data frames.
3) the subject identifiers and activities code are merged together in a new test data frame.
4) the activity description column is added to the new test data frame.
5) the measures are added to the new test data frame.
6) the column names for the measures are modified in the new test data frame, by taking it from the features text.
7) steps 2 to 6 are repeated for the train data set.
8) the newly created test and train data sets are merged into a new data frame.
9) all the measures (columns) not containing a mean or a standard deviation are removed from the new data frame created at 8).
10) the data frame is grouped by subject and activity description, then summarised applying the mean() function to each measure.
11) the data frame is written to a file.

The summarised data set contains (30 subject * 6 activities) = 180 observations.
The columns are 69 i.e., subject code, activity description, activity code, plus 66 mean() related to the measures (features).

