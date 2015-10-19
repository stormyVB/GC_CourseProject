---
title: "README.md"
author: "SV"
date: "October 18, 2015"
output: html_document
---

This README.md file accompanies run_analysis.R and CodeBook.md for JH Getting and Cleaning Data Course Project, 2015.  

-------------
  ## Uses fitness data collected from accelerometers: Samsung Galaxy S smartphone.
  ##---------------------------------------------
  ##  1. Assumes data files are text files located in working directory
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
  ##  5.  Follows these instructions as given in assignment:
  ##    a.  Merges the training and the test sets to create one data set.
  ##    b.  Extracts only the measurements on the mean and standard deviation for each measurement. 
  ##    c.  Uses descriptive activity names to name the activities in the data set
  ##    d.  Appropriately labels the data set with descriptive variable names. 
  ##    e.  From the data set in step 4(d), creates a second, independent tidy data set 
  ##        with the average of each variable for each activity and each subject.
  ##---------------------------------------------------------------------------------
  
  