Tidied Data from the Human Activity Recognition Using Smartphones Dataset
=====================================================================================

This document describes the variables, data, and transformations carried out on the Human Activity Recognition Using Smartphones Dataset, to create two new datasets:
accelerometerTidy.txt
accelerometerAverages.txt

Only the accelerometerAverages dataset has been submitted in fulfillment of the course requirements, as the accelerometerTidy dataset is not asked for. Both datasets are described below.


Study Design
============
The Human Activity Recognition Using Smartphones Dataset v1.0 has been sourced from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (download date: Wed Jan 20 12:08:48 2016). This dataset was published by:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, Anguita et al. captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. They partitioned the dataset into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The measurement variables in this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (prefix 'f' to indicate frequency domain signals).


Code Book
=========

accelerometerTidy dataset (not submitted for for the course project)
=========================
This dataset collates data from the test and training datasets of the Human Activity Recognition Using Smartphones v1.0 Dataset, so that this table includes data from all 30 volunteers. Descriptive activity names were sourced from the activity_labels.txt file, and measurement variable names from the features.txt file. Only the mean and standard deviation measurements are included (these are the variables containing the strings "mean()" and "std()"). Measurements of the median absolute deviation, maximum and minumum values, signal magnitude area, energy, interquartile range, signal entropy, autorregresion and correlation coefficients, frequency indices, weighted averages, skewness, kurtosis, frequency interval energy, and angle are not included.

accelerometerTidy variables
===========================
subject: unique identifier for each of the 30 participants. Levels 1:30.
activity: description of the activity that the subject undertook. Factor variable with 6 levels: walking, walking_upstairs, walking_downstairs, sitting, standing, laying.

The following measurement variables were derived as described under 'Study Design' above, and were normalized and bounded within [-1,1] by Anguita et al. (hence no units).

tBodyAccmeanX: mean value of the body linear acceleration, direction X 
tBodyAccmeanY: mean value of the body linear acceleration, direction Y 
tBodyAccmeanZ: mean value of the body linear acceleration, direction Z 
tBodyAccsdX: standard deviation of the body linear acceleration, direction X
tBodyAccsdY: standard deviation of the body linear acceleration, direction Y
tBodyAccsdZ: standard deviation of the body linear acceleration, direction Z
tGravityAccmeanX: mean value of the gravity acceleration, direction X
tGravityAccmeanY: mean value of the gravity acceleration, direction Y
tGravityAccmeanZ: mean value of the gravity acceleration, direction Z
tGravityAccsdX: standard deviation of the gravity acceleration, direction X
tGravityAccsdY: standard deviation of the gravity acceleration, direction Y
tGravityAccsdZ: standard deviation of the gravity acceleration, direction Z
tBodyAccJerkmeanX: mean value of the jerk body acceleration signal, direction X
tBodyAccJerkmeanY: mean value of the jerk body acceleration signal, direction Y
tBodyAccJerkmeanZ: mean value of the jerk body acceleration signal, direction Z
tBodyAccJerksdX: standard deviation of the jerk body acceleration signal, direction X
tBodyAccJerksdY: standard deviation of the jerk body acceleration signal, direction Y
tBodyAccJerksdZ: standard deviation of the jerk body acceleration signal, direction Z
tBodyGyromeanX: mean value of the angular velocity, direction X
tBodyGyromeanY: mean value of the angular velocity, direction Y
tBodyGyromeanZ: mean value of the angular velocity, direction Z
tBodyGyrosdX: standard deviation of the angular velocity, direction X
tBodyGyrosdY: standard deviation of the angular velocity, direction Y
tBodyGyrosdZ: standard deviation of the angular velocity, direction Z
tBodyGyroJerkmeanX: mean value of the jerk angular velocity signal, direction X
tBodyGyroJerkmeanY: mean value of the jerk angular velocity signal, direction Y
tBodyGyroJerkmeanZ: mean value of the jerk angular velocity signal, direction Z
tBodyGyroJerksdX: standard deviation of the jerk angular velocity signal, direction X
tBodyGyroJerksdY: standard deviation of the jerk angular velocity signal, direction Y
tBodyGyroJerksdZ: standard deviation of the jerk angular velocity signal, direction Z
tBodyAccMagmean: mean value of the magnitude of the body linear acceleration three dimensional signals
tBodyAccMagsd: standard deviation of the magnitude of the body linear acceleration three dimensional signals
tGravityAccMagmean: mean value of the magnitude of the gravity acceleration three dimensional signals
tGravityAccMagsd: standard deviation of the magnitude of the gravity acceleration three dimensional signals
tBodyAccJerkMagmean: mean value of the magnitude of the jerk body acceleration three dimensional signals
tBodyAccJerkMagsd: standard deviation of the magnitude of the jerk body acceleration three dimensional signals
tBodyGyroMagmean: mean value of the magnitude of the angular velocity three dimensional signals
tBodyGyroMagsd: standard deviation of the magnitude of the angular velocity three dimensional signals
tBodyGyroJerkMagmean: mean value of the magnitude of the jerk angular velocity three dimensional signals
tBodyGyroJerkMagsd: standard deviation of the magnitude of the jerk angular velocity three dimensional signals
fBodyAccmeanX: FFT of tBodyAccmeanX
fBodyAccmeanY: FFT of tBodyAccmeanY
fBodyAccmeanZ: FFT of tBodyAccmeanZ
fBodyAccsdX: FFT of tBodyAccsdX
fBodyAccsdY: FFT of tBodyAccsdY
fBodyAccsdZ: FFT of tBodyAccsdZ
fBodyAccJerkmeanX: FFT of tBodyAccJerkmeanX
fBodyAccJerkmeanY: FFT of tBodyAccJerkmeanY
fBodyAccJerkmeanZ: FFT of tBodyAccJerkmeanZ
fBodyAccJerksdX: FFT of tBodyAccJerksdX
fBodyAccJerksdY: FFT of tBodyAccJerksdY
fBodyAccJerksdZ: FFT of tBodyAccJerksdY
fBodyGyromeanX: FFT of tBodyGyromeanX
fBodyGyromeanY: FFT of tBodyGyromeanY
fBodyGyromeanZ: FFT of tBodyGyromeanZ
fBodyGyrosdX: FFT of tBodyGyrosdX
fBodyGyrosdY: FFT of tBodyGyrosdY
fBodyGyrosdZ: FFT of tBodyGyrosdZ
fBodyAccMagmean: FFT of tBodyAccMagmean
fBodyAccMagsd: FFT of tBodyAccMagsd
fBodyBodyAccJerkMagmean: FFT of tBodyAccJerkMagmean
fBodyBodyAccJerkMagsd: FFT of tBodyAccJerkMagsd
fBodyBodyGyroMagmean: FFT of tBodyGyroMagmean
fBodyBodyGyroMagsd: FFT of tBodyGyroMagsd
fBodyBodyGyroJerkMagmean: FFT of tBodyGyroJerkMagmean
fBodyBodyGyroJerkMagsd: FFT of tBodyGyroJerkMagmean


accelerometerAverages dataset (submitted for the course project)
=============================

This dataset is derived from the accelerometerTidy dataset. While the accelerometerTidy dataset records each subject performing each actiivity multiple times, this dataset averages the measurement variables for each activity and subject. So there are 180 rows corresponding to the average measurements for each of the 30 subjects across each of the six activities.

accelerometerAverages variables
===========================
subject: unique identifier for each of the 30 participants. Levels 1:30.
activity: description of the activity that the subject undertook. Factor variable with 6 levels: walking, walking_upstairs, walking_downstairs, sitting, standing, laying.

The following measurement variables correspond to those in the accelerometerTidy table, except that they are the average values for each activity and subject, and they have been differentiated by applying the suffix "avg" to each variable name. tBodyAccmeanX, etcetera, is defined as described for the accelerometerTidy table.

tBodyAccmeanXavg
tBodyAccmeanYavg
tBodyAccmeanZavg
tBodyAccsdXavg
tBodyAccsdYavg
tBodyAccsdZavg
tGravityAccmeanXavg
tGravityAccmeanYavg
tGravityAccmeanZavg
tGravityAccsdXavg
tGravityAccsdYavg
tGravityAccsdZavg
tBodyAccJerkmeanXavg
tBodyAccJerkmeanYavg
tBodyAccJerkmeanZavg
tBodyAccJerksdXavg
tBodyAccJerksdYavg
tBodyAccJerksdZavg
tBodyGyromeanXavg
tBodyGyromeanYavg
tBodyGyromeanZavg
tBodyGyrosdXavg
tBodyGyrosdYavg
tBodyGyrosdZavg
tBodyGyroJerkmeanXavg
tBodyGyroJerkmeanYavg
tBodyGyroJerkmeanZavg
tBodyGyroJerksdXavg
tBodyGyroJerksdYavg
tBodyGyroJerksdZavg
tBodyAccMagmeanavg
tBodyAccMagsdavg
tGravityAccMagmeanavg
tGravityAccMagsdavg
tBodyAccJerkMagmeanavg
tBodyAccJerkMagsdavg
tBodyGyroMagmeanavg
tBodyGyroMagsdavg
tBodyGyroJerkMagmeanavg
tBodyGyroJerkMagsdavg
fBodyAccmeanXavg
fBodyAccmeanYavg
fBodyAccmeanZavg
fBodyAccsdXavg
fBodyAccsdYavg
fBodyAccsdZavg
fBodyAccJerkmeanXavg
fBodyAccJerkmeanYavg
fBodyAccJerkmeanZavg
fBodyAccJerksdXavg
fBodyAccJerksdYavg
fBodyAccJerksdZavg
fBodyGyromeanXavg
fBodyGyromeanYavg
fBodyGyromeanZavg
fBodyGyrosdXavg"
fBodyGyrosdYavg
fBodyGyrosdZavg
fBodyAccMagmeanavg
fBodyAccMagsdavg
fBodyBodyAccJerkMagmeanavg
fBodyBodyAccJerkMagsdavg
fBodyBodyGyroMagmeanavg
fBodyBodyGyroMagsdavg
fBodyBodyGyroJerkMagmeanavg
fBodyBodyGyroJerkMagsdavg