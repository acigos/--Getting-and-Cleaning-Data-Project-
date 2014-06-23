#Getting and Cleaning Data Course Project

Introduction
------------
This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization.
What follows first are my notes on the original data.

About the raw data
------------------

The features (561 of them) are unlabeled and can be found in the x_test.txt. 
The activity labels are in the y_test.txt file.
The test subjects are in the subject_test.txt file.

The same holds for the training set


This file describes how run_analysis.R script works
---------------------------------------------------

1. Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Rename the folder with "datos".

2. run_analysis.R most be in the working directory.
3. open the file (analysis.R") in RStudio
4. Run the scrip, you will see the codes needs o clean the data, this generate two files in the current working directory:
	* notidyDat.txt: It contains 10299 obs and 68 variables
	* widerun_analysis.txt: this is de tidy one, it contains 180 obs and 68 variables
5. Finally, run: read.table("./widerun_analysis.txt) in Rstudio



© Alexander Valdez 2014
