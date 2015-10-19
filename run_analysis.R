run_analysis <- function() {
  ##Getting and Cleaning Data - Course Project --JH 2015
  ## Uses fitness data collected from accelerometers: Samsung Galaxy S smartphone.
  ##---------------------------------------------
  ##  1. Assumes data files are all located in working directory
  ##    (If files are elsewhere, update train_dir, test_dir, and feature_dir.)  
  ##    subject_test.txt
  ##    subject_train.txt
  ##    X_test.txt 
  ##    X_train.txt
  ##    y_test.txt
  ##    y_train.txt
  ##    activity_labels.txt
  ##    features.txt
  ##
  ##  2.  Assumes dplyr is already installed and loaded
  ##  3.  Output is written as a txt file to working directory
  ##  4.  Output is a tidy data set
  ##
  ##  5.  Follows these instructions as given in assighment:
  ##    a.  Merges the training and the test sets to create one data set.
  ##    b.  Extracts only the measurements on the mean and standard deviation for each measurement. 
  ##    c.  Uses descriptive activity names to name the activities in the data set
  ##    d.  Appropriately labels the data set with descriptive variable names. 
  ##    e.  From the data set in step 4(d), creates a second, independent tidy data set 
  ##        with the average of each variable for each activity and each subject.
  ##---------------------------------------------------------------------------------
  
  ##Load the data (change these if data in other directories)
  test_dir<-getwd()
  train_dir<-getwd()
  feature_dir<-getwd()

  sub_test<-read.table(paste(test_dir,"/subject_test.txt", sep=""))
  X_test<-read.table(paste(test_dir,"/X_test.txt", sep=""))
  y_test<-read.table(paste(test_dir,"/y_test.txt", sep=""))

  sub_train<-read.table(paste(train_dir,"/subject_train.txt", sep=""))
  X_train<-read.table(paste(train_dir,"/X_train.txt", sep=""))
  y_train<-read.table(paste(train_dir,"/y_train.txt", sep=""))

  feature_names<-read.table(paste(feature_dir,"/features.txt", sep=""))
  act_label<-read.table(paste(feature_dir,"/activity_labels.txt", sep=""))

  ##Label the columns with names from features.txt file  
  names(X_test)<-feature_names$V2
  names(X_train)<-feature_names$V2
  names(y_test)<-"Activity_ID"
  names(y_train)<-"Activity_ID"
  names(sub_test)<-"Subj_ID"
  names(sub_train)<-"Subj_ID"

  ##Combine the data into a single table
  sub_data<-rbind(sub_test,sub_train)
  X_data<-rbind(X_test,X_train)
  y_data<-rbind(y_test,y_train)
  all_data<-cbind(sub_data,y_data, X_data)

  ##Convert this table to dplyr table
  dtb<-tbl_dt(all_data)

  ##Append Activity labels based on Activity_ID, from activity_labels.txt file
  temp_act<-act_label[dtb$Activity_ID,]
  dtb<-mutate(dtb,Activity=temp_act$V2)

  ##Select only those columns that include "mean" or "std"  
  ##(Include Subj_ID and Activity)
  dtb2<-select(dtb, Subj_ID, Activity, contains("mean", ignore.case=TRUE), contains("std", ignore.case=TRUE))

  ##Group by Activity and then by subject, 
  ##find mean of each measurement by this grouping
  ##Arrange output by Activity, then by subject
  by_activity<-group_by(dtb2,Activity, Subj_ID)
  data_means<-summarize_each(by_activity, funs(mean))
  by_activity_then_subj<-arrange(data_means,Activity, Subj_ID)

  ##Write the output to a file in working directory
  write.table(by_activity_then_subj,file="GCProject_Tidy.txt")
  
  ##Return output
  by_activity_then_subj
}


