The purpose of this project is to prepare a tidy data set that can be used for later analysis.  Here is the description of the original dataset:

======================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.



Here are the steps I took to clean the original data set
======================================

1.	Load files 'train/X_train.txt', 'train/y_train.txt', 'train/subject_train.txt', 'features.txt’ into R.

2.	Merge 'train/subject_train.txt', 'train/y_train.txt', 'train/X_train.txt' into one training data set named “trainingsets”, with the first column being the subject number, the second column being activity, and the rest columns being features of the measurements. 
3.	Label “trainingsets” with descriptive variable names: column 1: “Subject”, column 2 : “Activity”, the rest columns: the feature vector in file 'features.txt’.   

4.	Load files 'test/X_test.txt', 'test/y_test.txt', 'test/subject_test.txt' into R.

5.	Merge 'test/subject_test.txt', 'test/y_test.txt', 'test/X_test.txt' into one test data set named “testsets”, with the first column being the subject number, the second column being activity, and the rest columns being features of the measurements. 

6.	Label “testsets” with descriptive variable names: column 1: “Subject”, column2 : “Activity”, the rest columns: the feature vector in file 'features.txt’.   

7.	Merge the “trainingsets” and the “testsets” to create one dataset called “all”.  

8.	Extracts only the measurements on the mean and standard deviation for each measurement:

-	Extract featurenames containing "mean" and "std" from feature vector in file 'features.txt’. 
-	Create a new dataframe named “meanstddf” containing columns with "Subject", "Activity" and those measurements on the mean and standard deviation. 
9.	Uses descriptive activity names to name the activities in the data set
-	Load file "activity_labels.txt" into R. 
-	Transform the variable “Activity” in dataframe “meanstddf” to factor variable and label the factors with the activity names in file "activity_labels.txt". 
10.	After taking the above steps, I got a clean dataset “meanstddf”, which was appropriately labeled with descriptive variable names. 
11.	 From the clean dataset “meanstddf”, I created a second, independent tidy data set named “meandf”, which contains the average of each variable for each activity and each subject.
