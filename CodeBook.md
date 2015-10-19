---
title: "CodeBook.md"
author: "SV"
date: "October 18, 2015"
output: html_document
---

This is a markdown document for JH Getting and Cleaning Data, 2015, Course Project.  It accompanies the code run_analysis.R

This project is Uses fitness data collected from accelerometers: Samsung Galaxy S smartphone.  Variables from several individual files are combined into a single raw data set.  

Raw data: two cohorts of data ("train"" and "test""); text files for each cohort contain the data. There are 10299 observations total, 2947 in the "test" cohort and there rest in the "train" cohort.
  These two files contain the subject ID numbers.
  ##    subject_test.txt
  ##    subject_train.txt
  These two files contain 561 variables related to body position, acceleration, angle, jerk, gravity,     etc, as   measured in the x,y,z dimensions.  Some of these are means.  Some are stds.
  ##    X_test.txt 
  ##    X_train.txt
  These two files contain the Activity ID number, from 1-6, to indicate what the subject was doing
  when the measurements were taken.
  ##    y_test.txt
  ##    y_train.txt
  This file matches the Activity ID number with the Activity Description, for example, "Walking", "Standing", "Laying", etc.
  ##    activity_labels.txt
  This file contains the names of all the feature categories for the data in the X files.
  ##    features.txt
  

Processed data: 
  Data from all txt files is loaded.  The function assumes all of these are in the working directory.  
  Each txt file is loaded as a table into its own variable.
    sub_test
    X_test
    y_test
    sub_train
    X_train
    y_train
    feature_names
    act_label
  
  These are then combined into a singe data table using cbind and rbind.  Columns and Activity are    
  labeled based on the information from the "features.txt" and "activity_labels.txt" files.  
    all_data
  
  Data table is converted into the dplyr data table format.  
    dtb
    
  A subset of the data is extracted that includes only "mean" and "std" data, the subj_Id, and Activity.
    dtb2
  
  This is then grouped by Activity and then by Subject.  
    by_activity
  
  The means of each category are calculated.  
    data_means
    
  The output is a tidy dataset sorted by Activity and then by Subject, showing these means for each 
  category. This is written to a txt file using write.table.  It is also returned as the output of the
  function
    by_activity_then_subj



