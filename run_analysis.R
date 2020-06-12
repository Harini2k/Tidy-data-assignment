##setting the current directory
setwd("~/Rprojects/UCI HAR Dataset")

##loading the package for read.table and dplyr
library(data.table)
library(dplyr)

##read test files
test_subject_ids<-read.table("./test/subject_test.txt")
test_observations<-read.table("./test/X_test.txt")
test_activity_ids<-read.table("./test/y_test.txt")

##read train files
train_subject_ids<-read.table("./train/subject_train.txt")
train_observations<-read.table("./train/X_train.txt")
train_activity_ids<-read.table("./train/y_train.txt")

##combine test and train files
subject_ids<-rbind(test_subject_ids,train_subject_ids)
observations<-rbind(test_observations,train_observations)
activity_ids<-rbind(test_activity_ids,train_activity_ids)
  
##loading features and activity labels
features<-read.table("features.txt")[,2]
activities<-read.table("activity_labels.txt")

##making the  required features names descriptive
features<-sub("^t","Time",features)
features<-sub("^f","Freq",features)
features<-sub("Acc","Accelerometer",features)
features<-sub("Gyro","Gyrometerr",features)
features<-gsub("-","_",features)
features<-sub("BodyBody","Body",features)

names(observations)<-features
names(subject_ids)<-"subject_ids"
names(activity_ids)<-"activity"

##extracting the required features (mean and std)
mean_features<-grep("mean()",features,value=TRUE,fixed=TRUE)
std_features<-grep("std",features,value=TRUE, fixed=TRUE)
required_features<-c(mean_features,std_features)

##extracting obs for mean and std
required_obs<-observations[names(observations) %in% required_features]

##creating data frame
df<-cbind(subject_ids,observations,activity_ids)

##extract mean and std rows
df1<-cbind(subject_ids,activity_ids,required_obs)

##making the activities column readable
df1$activity<-activities[df1$activity,2]

##arranging in order of subject ids
tidy_df<-arrange(df1,subject_ids)

##find the mean of each variable based on groups
grouped_tidy_df<-tidy_df %>% group_by(subject_ids,activity) %>% summarize_all(mean)

##writing the final output to a file
write.table(grouped_tidy_df,"tidy_data.txt",row.name=FALSE)
