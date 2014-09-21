Code Book

Original information data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Additional information:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The Script (run_analysis.R) performs the following to clean up the data:

•	Merges the training and test sets to create one data set:

    o	In X bind [train / X_train.txt, test / X_test.txt] : ("Number of Instances: 10299" and "Number of Attributes: 561")
    o	In S bind [train / subject_train.txt, test / subject_test.txt]: the result  is a 10299x1 data frame with subject Ids 
    o	Y bind [train / y_train.txt, test / y_test.txt] the result  is a 10299x1 data frame with activity Ids.

•	Reads features.txt and extracts only the value for the mean and standard deviation for each measurement. The result is a 10299x66 data frame, because only 66 out of 561 attributes have the value for mean and standard deviation.

•	Reads activity_labels.txt and assigned descriptive activity names to name the activities in the data set.

      walking
      walkingupstairs
      walkingdownstairs
      sitting
      standing
      laying


•	The next step in to assign the labels to the data set with descriptive name. 
    The labels of the attributes and activity are converted to lower case, underscores and brackets "()" are removed.
    Merges the data frame containing features (10299x66) with activity labels (10299x1) and subject.
    The result is saved as Datajoin.txt (10299x68) .The names of the attributes are similar to the following:
    
      bodyacc-mean-x/y/z 
      tbodyacc-std-x/y/z
      tgravityacc-mean-x ç/y/z
      tgravityacc-std-x/y/z 
      tbodyaccjerk-mean-x/y/z
      tbodyaccjerk-std-x/y/z
      tbodygyro-mean-x/y/z
      tbodygyro-std-x/y/z
      tbodygyrojerk-mean-x/y/z
      tbodygyrojerk-std-x/y/z
      tbodyaccmag-mean
      tbodyaccmag-std
      tgravityaccmag-mean
      tgravityaccmag-std
      tbodyaccjerkmag-mean
      tbodyaccjerkmag-std
      tbodygyromag-mean
      tbodygyromag-std
      tbodygyrojerkmag-mean
      tbodygyrojerkmag-std
      fbodyacc-mean-x/y/z
      fbodyacc-std-x/y/z
      fbodyaccjerk-mean-x/y/z
      fbodyaccjerk-std-x/y/z
      fbodygyro-mean-x/y/z
      fbodygyro-std-x/y/z
      fbodyaccmag-mean
      fbodyaccmag-std
      fbodybodyaccjerkmag-mean
      fbodybodyaccjerkmag-std
      fbodybodygyromag-mean
      fbodybodygyromag-std
      fbodybodygyrojerkmag-mean
      fbodybodygyrojerkmag-std


•	The script creates a second independent tidy data set with the average of each measurement for each activity and each subject.
  The result is saved as DataResult.txt ( 180x68 data frame):
  Subject (=30)
  Activity(6)
  and coluns form 3	to	68 are the averages for each of the 66 attribute of the mean and std.


