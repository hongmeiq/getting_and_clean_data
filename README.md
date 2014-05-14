## Getting and Cleaning Data Course Project
This GIT repository includes the following files:
  * CodeBook.md
  * README.md
  * run_analysis.R

### run_analysis.R
This R code is designed to clean the /UCI HAR Dataset data set, to prepare tidy data that can be used for later analysis.
run_analysis.R performs the following transformation to the /UCI HAR Dataset data set:
  * Merges the training and the test sets in the /UCI HAR Dataset folder
  * Provide the merged data sets descriptive column names
    * The first 2 columns names are subject and activity, rest of the columns are derived from features.txt files
    * Takes the second column from features.txt; lowercase all characters and remove any non-alphanumeric characters (such as "-", ",", "(", ")")
      * tBodyAcc-mean()-X is transformed to tbodyaccmeanx
  * Relabel the numeric activity values to the descriptive activity names
    * activity names are available in the activity_labels.txt second column
  * Subset the merged data sets to extract variables to do with mean and standard deviation
    * reason to pick the subset: pick any column contains keyword "mean" or "std"
  * Create a final dataset with the average of each variable for each activity and each subject, save it as output.txt

### How to run run_analysis.R
  * Download getdata_projectfiles_UCI HAR Dataset.zip from this url: 
    * https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  * Unzip the downloaded file to extract the /UCI HAR Dataset folder
  * Place run_analysis.R on the same working directory that contains the /UCI HAR Dataset folder
  * Execute run_analysis.R
  * The above R script outputs an output.txt file to the current working directory
  
### output.txt
This file contains the following file headers:
"subject","activity","tbodyaccmeanx","tbodyaccmeany","tbodyaccmeanz","tbodyaccstdx","tbodyaccstdy","tbodyaccstdz","tgravityaccmeanx","tgravityaccmeany","tgravityaccmeanz","tgravityaccstdx","tgravityaccstdy","tgravityaccstdz","tbodyaccjerkmeanx","tbodyaccjerkmeany","tbodyaccjerkmeanz","tbodyaccjerkstdx","tbodyaccjerkstdy","tbodyaccjerkstdz","tbodygyromeanx","tbodygyromeany","tbodygyromeanz","tbodygyrostdx","tbodygyrostdy","tbodygyrostdz","tbodygyrojerkmeanx","tbodygyrojerkmeany","tbodygyrojerkmeanz","tbodygyrojerkstdx","tbodygyrojerkstdy","tbodygyrojerkstdz","tbodyaccmagmean","tbodyaccmagstd","tgravityaccmagmean","tgravityaccmagstd","tbodyaccjerkmagmean","tbodyaccjerkmagstd","tbodygyromagmean","tbodygyromagstd","tbodygyrojerkmagmean","tbodygyrojerkmagstd","fbodyaccmeanx","fbodyaccmeany","fbodyaccmeanz","fbodyaccstdx","fbodyaccstdy","fbodyaccstdz","fbodyaccmeanfreqx","fbodyaccmeanfreqy","fbodyaccmeanfreqz","fbodyaccjerkmeanx","fbodyaccjerkmeany","fbodyaccjerkmeanz","fbodyaccjerkstdx","fbodyaccjerkstdy","fbodyaccjerkstdz","fbodyaccjerkmeanfreqx","fbodyaccjerkmeanfreqy","fbodyaccjerkmeanfreqz","fbodygyromeanx","fbodygyromeany","fbodygyromeanz","fbodygyrostdx","fbodygyrostdy","fbodygyrostdz","fbodygyromeanfreqx","fbodygyromeanfreqy","fbodygyromeanfreqz","fbodyaccmagmean","fbodyaccmagstd","fbodyaccmagmeanfreq","fbodybodyaccjerkmagmean","fbodybodyaccjerkmagstd","fbodybodyaccjerkmagmeanfreq","fbodybodygyromagmean","fbodybodygyromagstd","fbodybodygyromagmeanfreq","fbodybodygyrojerkmagmean","fbodybodygyrojerkmagstd","fbodybodygyrojerkmagmeanfreq"

More details of each varialble are available in the CodeBook.md