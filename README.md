Getting And Cleaning Data - Course Project - Creating Tidy Data
======================

Assuptions - 

All the following files should be directly available in the working directory -
- activity_labels.txt
- features.txt
- subject_test.txt
- subject_train.txt
- X_test.txt
- Y_test.txt
- X_train.txt
- Y_train.txt

Procedure to run the code - 

- Download run_analysis.R file in the working directory
- load the R file using source("run_analysis")
- execute the function getTidyFile() to produce the tidy file named as "tidyfile.txt" in the working directory.
- the file is CSV file but has an extension of .txt as Coursera does not allow uploading .CSV files.


Script Logic - 

- First read the file X_test.txt (activity data) and Y_test.txt (activity labels) and subject_test.txt (subject data)
- Using a function getActivity() create a vector for the activity description
- cbind subject, activity label, activity description and activity data in a single data frame
- repeat the above steps for th train data as well
- rbind test and train data to create a single Data frame
- give the above data frame headings
- get the indices where 'mean' or 'std' is being used
- subset the data frame using the indices
- melt and dcast the subsetted data using reshape2 package to create final tidy data frame
- write the data frame as file in the working directory









