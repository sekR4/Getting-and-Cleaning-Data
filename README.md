# Getting-and-Cleaning-Data
This is the Getting and Cleaning Data Course Project as a part of the Data Science Specialization on Coursera offered by the John Hopkins University.

The goal is to show the process of getting and working with a raw data set and making it tidy for later analysis.

The raw data was contributed by :
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.   Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living
(IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

With a Samsung Galaxy S II, equipped with an integrated accelerometer and a gyroscope, triaxial movements of 30 participants were measured. To get an idea how this worked you could watch this: https://www.youtube.com/watch?v=XOEN9W05_4A.
Further details can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This repo contains a script called run_analysis.R and the tidy data set “tidy_measurements.txt”. 

Sourcing “run_analysis.R” will download the data and read it into R. The data will be merged and mean as well as standard deviation will be extracted. The labels will be adjusted for better readability and a tidy data set will be created for further analysis.
