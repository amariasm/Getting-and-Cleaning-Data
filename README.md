Getting-and-Cleaning-Data
=========================

Project processes 
=================


1 Get the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2 The data is decompressed in: 
   F: / Coursera / Getting Data Cleaning / HAR UCI Dataset 

3 The Script run_analisis.R performs the following processes: 

  3.1 Merges the training and the test sets to create one data set 

      In X bind [train / X_train.txt, test / X_test.txt] 
      In S bind [train / subject_train.txt, test / subject_test.txt] 
      Y bind [train / y_train.txt, test / y_test.txt] 

  3.2 Extracts only the measurements on the mean and standard deviation for each measurement.
  
      The average and standard deviation variables along with others are in features.txt.
      In index_features are extracted only the mean and standard deviation variables. 
      In X are selected only variables related to the mean and standard deviation and had been assigned labels
      to each variable. 

  3.3 Uses descriptive activity names to name the activities in the data set 
  
      Assign Y for each observation activity 

  3.4 Appropriately labels the data set with descriptive names 
  
     In "join" are assigned to the corresponding labels: Subject, activities, and the different variables mean and std.
  
     Exported in the working directory in the text file: merged_data2.txt. 

  3.5 From the data set in step 3.4 creates a second, independent data set with the average of each variable for each activity       and each subject.
 
     Exported in the working directory in the text file: data_averages2.txt
