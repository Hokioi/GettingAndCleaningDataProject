
Tidied Data from the Human Activity Recognition Using Smartphones Dataset
=========================================================================

This work comprises my course project for: Getting and Cleaning Data, by Johns Hopkins University on Coursera. 

This project used the Human Activity Recognition Using Smartphones Dataset v1.0, which was sourced from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (download date: Wed Jan 20 12:08:48 2016).
Human Activity Recognition Using Smartphones Dataset v1.0 reference:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


The following data tidying and transformation steps were taken:
===============================================================
The training and test sets were merged to create one data set.
For accelerometer and gyroscope measurement, only the columns containing the mean and standard deviations were extracted.
Descriptive activity names were applied to activities in the data set.
The dataset was labelled with descriptive variable names.
A second, independent tidy data set with the average of each variable for each activity and each subject was created.


There are 3 files in this repository, as follows.
=================================================

'README.md' (this document): explains how the scripts work and how the files in this repository are connected

'CodeBook.md': Describes:
The original data source, its study design and measurement methods.
The accelerometerTidy dataset, its data, variables, and transformations used.
The accelerometerAverages dataset, its data, variables, and transformations used.

'run_analysis.R': R script that was used to:
Download the original dataset
Create the tidied dataset: accelerometerTidy.txt
Create the averages dataset: accelerometerAverages.txt
This script is commented with:
Descriptions of what the different sections of code do.
Some of the justifications for certain choices about how the data was cleaned in accordance with tidy data principles.


The following dataset was submitted via the Coursera website for the course project
===================================================================================

'accelerometerAverages.txt':  data table collated and tidied data derived from the Human Activity Recognition Using Smartphones Dataset v1.0. For each subject and each activity, it averages the measurement variables. The data, variables, and data transformations are described in CodeBook.md.

An intermediate dataset, 'accelerometerTidy.txt', from which 'accelerometerAverages.txt' was derived, is also created using the 'run_analysis.R' script, but it has not been submitted as it was not required for the course project.

