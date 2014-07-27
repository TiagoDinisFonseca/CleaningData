CLEANING DATA PROJECT
==========

## Purpose

This is part of the coursera Getting and Cleaning Data course.
The main purpose is to learn how to get and clean data as indicated by its name.

The original data, called Human Activity Recognition Using Smartphones Dataset, was the result of an experience taken in Smartlab, DITEN, Università degli Studi di Genova, read their README.txt file for more informations.
In summary, in order to detect the activity of a user by the smartphone accelerometer and gyroscope data, a large experience was conducted with 30 individuals and 6 different activities: walking, walking upstairs, walking downstairs, sitting, astanding and laying.

A lot of measurements were taken and pre-processed. In order to be moreusable, here we collect this information and we process it further to get a more, hopefully, usable data.


## Files

The project contains the following files:
* README.md, this file with an explanation of the project
* CodeBook.md, with a complete list of computed variables and an explanation how were they computed
* run_analysis.R, the script used to produce the tidy data
* tidy_data.txt, a tab separated file (with header) conatining the result of the script, that is, the information of the general project summarized and labelled


## Instructions

This is a R script, and therefore, it should be run on R:
* source("run_anylisis.R")
Notice that you should be on the same folder of the script.

Moreover, this work was done in linux, and therefore paths are adapted to it, please modify paths if not well adapted to your OS. The script will try to find the data on the current path according the following structure:
* train/
** subject_train.txt
** y_train.txt
** X_train.txt
* test/
** subject_test.txt
** y_test.txt
** X_test.txt
* activity_labels.txt
* features.txt
You can modify the general path by modifying the variable path.


## About the choice of variables to present

It was asked to pick every variable repesenting a mean or a standard deviation, this is vague, and therefore there was a choice, which the reader can disagree. 
Three choices are easy on the script:
1. All variables with mean or std on the name, including angles between mean vectors
2. All variabkes with mean or std on the name, excluding meanFreq and angles between mean vectors
3. The main measurements, mean and std

The second is the preferred choice, you can alter if you want.


## Labels

The activities labels are the ones given by the authors of the study, as there is no gain on altering them.
The measurements labels are also as close as possible as the original ones, there was just some cosmetics treatment.
