This codebook explains the run_analysis.R script, all the variables and the transformations made that meets all the requirements of the course project.

Step 1: Set the working directory as "UCI HAR Dataset" location and load the necessary packages. (data.table and dplyr)

Step 2: Read the test files and create dataframes.
	
	a) test_subject_ids => A number between 1 to 30 that specifies the ids of the volunteers selected for generating the test data.
			       It is read from the file "./test/subject_test.txt". (2947 rows, 1 column)
	b) test_observations => A 561-feature vector with time and frequency domain variables for each subject and activity performed. 
				It is read from the file "./test/X_test.txt". (2947 rows, 561 columns)
	c) test_activity_ids => A number between 1 to 6 representing one of the 6 activities performed by the subject. 
				It is read from the file "./test/y_test.txt". (2947 rows, 1 column)

Step 3: Read the train files and create dataframes.
	
	a) train_subject_ids => A number between 1 to 30 that specifies the ids of the volunteers selected for generating the training data.
			       It is read from the file "./train/subject_train.txt". (7352 rows, 1 column)
	b) train_observations => A 561-feature vector with time and frequency domain variables for each subject and activity performed. 
				It is read from the file "./train/X_train.txt". (7352 rows, 561 columns)
	c) train_activity_ids => A number between 1 to 6 representing one of the 6 activities performed by the subject. 
				It is read from the file "./train/y_train.txt". (7352 rows, 1 column)

Step 4: Merge the test and training datasets.
	
	a) subject_ids => Merging test_subject_ids and train_subject_ids. (10299 rows, 1 column)
	b) observations => Merging test_observations and train_observations. (10299 rows, 561 columns)
	c) activity_ids => Merging test_activity_ids and train_activity_ids. (10299 rows, 1 column)

Step 5: Read the features and activities.

	a) features => A list of 561 features measured by the device read from "features.txt". (second column of the file) (character vector of length 561).
	b) activities => A table of activity ids and labels read from "activity_labels.txt". (6 rows, 2 columns)

Step 6: Make the feature names more descriptive by replacing "t" and "f" by "Time" and "Freq" respectively, "Acc" and "Gyro" by "Accelerometer" and "Gyrometer" respectively and replace 		"hyphen" with "underscore". Also "BodyBody" is replaced by simply "Body".

Step 7: Give the variables appropriate and descriptive names.
	
	a) names of observations dataset => features in the features list.
	b) name of subject_ids variable => "subject_ids".
	c) name of activity_ids variable => "activity".

Step 8: Extract the features that measure mean or standard deviation and the respective observations.

	required_features => (character vector of length 66).
	required_obs => (10299 rows, 66 columns).

Step 9: Merge subject_ids, activity_ids and observations datasets to form a data frame df1.
	 
	df1 => (10299 rows, 68 columns).

Step 10: Substitute the activity labels for activity_ids to make the output readable.

Step 11: Arrange the data frame in the order of subject_ids from 1 to 30 => tidy_df.

Step 12: Group the data frame by subject_ids and activities and find the average of each variable for each activity and each subject.
 	 
	 grouped_tidy_df => (180 rows, 68 columns).

Step 13: Write the final tidy output to a text file "tidy_data.txt".




