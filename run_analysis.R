## Getting and Cleaning Data Course Project, January 2016
## data set information at
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
## 30 volunteers
## age 19-48 years
## six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
## embedded accelerometer and gyroscope
## 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz
## data has been labelled manually
## dataset has been randomly divided
##     70% of volunteers -> training data
##     30% of volunteers -> test data
## Attribute Information, for each record in the dataset it is provided: 
## - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
## - Triaxial Angular velocity from the gyroscope. 
## - A 561-feature vector with time and frequency domain variables. (X_test, X_train)
## - Its activity label. (y_test, y_train)
## - An identifier of the subject who carried out the experiment. (subject_test, subject_train)

par(family="sans");
library(dplyr);
library(ggplot2);

## read the data into R objects
wd <- "~/Documents/Coursera/data-cleaning";
if(!file.exists(wd)){print("Error: working diretory does not exist"); return}
setwd(wd);

filenames <- c('activity_labels', 'features', 'subject_test',
                 'X_test', 'y_test', 'subject_train', 'X_train', 'y_train');

## store the full (relative) path for each filename
activity_labels <- "./data/UCI HAR Dataset/activity_labels.txt";
features <- "./data/UCI HAR Dataset/features.txt";
subject_test <- "./data/UCI HAR Dataset/test/subject_test.txt";
X_test <- "./data/UCI HAR Dataset/test/X_test.txt";
y_test <- "./data/UCI HAR Dataset/test/y_test.txt";
subject_train <- "./data/UCI HAR Dataset/train/subject_train.txt";
X_train <- "./data/UCI HAR Dataset/train/X_train.txt";
y_train <- "./data/UCI HAR Dataset/train/y_train.txt";

## How many rows in each file?
for (filename in filenames) {
        print(filename);
        if(is.null(get0(paste0(filename, '.rowcount')))) {
                con <- file(description=get(filename));
                assign(paste0(filename, '.rowcount'), length(readLines(con)));
                close(con);
        }
        print(get(paste0(filename, '.rowcount')));
        readline("press return to continue ...");
}

## the "activity_labels" file has 6 rows
## the "features" file has 561 rows
## the three "test" files have 2947 rows
## the three "train" files have 7352 rows

## these are not huge row counts so no worries on sizing
## file size of X_test is 26.5 MB
## file size of X_train is 66 MB
## the other files are all much smaller

## file structure
## activity_labels - two columns separated by a single space
##    - activity_label ID (integer)
##    - activity_label name (string)
## features - two columns separated by a single space
##    - feature ID (integer)
##    - feature name (string)
## subject_test/train - one column
##    - subject ID (integer)
## X_test/train - 561 columns, positive and negative floats in exponential notation
## separated by single space, it seems there are two spaces at the beginning of each line
##    - the 561 columns are described by the 561 feature names listed in the feature file
## y_test/train - one column
##    - activity_label ID (integer)

## read all the files using read.table:
for (filename in filenames) {
        print(filename);
        if(is.null(get0(paste0(filename, '.df')))) {
                assign(paste0(filename, '.df'), read.table(file=get(filename)));
        }
        print(dim(get(paste0(filename, '.df'))));
        readline("press return to continue ...");
}
## all files loaded with the expected dim() values
## activity_labels 6 2
## features 561 2
## subject_test 2947 1
## X_test 2947 561
## y_test 2947 1
## subject_train 7352 1
## X_train 7352 561
## y_train 7352 1

## rbind() will work to merge the distinct "test" and "train" datasets into one set
print("subject");
## add a vector to subject_test and subject_train to identify "test" or "training" volunteer
if(dim(subject_test.df)[2]==1) {subject_test.df <- data.frame(subject_test.df, V2='test')};
if(dim(subject_train.df)[2]==1) {subject_train.df <- data.frame(subject_train.df, V2='train')};

## merge subject_test and subject_train vertically using rbind(), then add column names
subject <- rbind(subject_test.df, subject_train.df);
names(subject) <- c('subjectID', 'testTrain');
print(dim(subject));
readline("press return to continue ...");

print("X");
## merge X_test and X_train vertically using rbind(), then add column names
X <- rbind(X_test.df, X_train.df);
names(X) <- features.df[,2];
print(dim(X));
readline("press return to continue ...");
## NOTE: length(unique(names(X))) does not match length(names(X)), 477 vs 561, names are not unique!

print("y");
## merge y_test and y_train vertically using rbind()
## then add a column for the activity name using merge()
## then add column names
y <- rbind(y_test.df, y_train.df);
y <- merge(y, activity_labels.df, by="V1");
names(y) <- c('activityID', 'activityName');
print(dim(y));
readline("press return to continue ...");

print("HARfullset");
## merge X, y, and subjects horizontally using data.frame()
## this might not be that helpful or necessary but seems to be what the instructions ask for (?)
HARfullset <- data.frame(X, y, subject);
print(dim(HARfullset));
readline("press return to continue ...");

print("HARsubset");
## extract from HARfullset just the essential columns
## the XYZ total body acceleration means and standard deviations are in the first 6 positions
## select also the last four columns (562-565)
HARsubset <- HARfullset[, c(1:6, 562:565)];
print(dim(HARsubset));
readline("press return to continue ...");

## the first six columns in HARsubset should probably be set as numeric and the last four as factors
for (i in 1:6) {
        HARsubset[,i] <- as.numeric(HARsubset[,i]);
}
for (i in 7:10) {
        HARsubset[,i] <- factor(HARsubset[,i]);
}

## the first six column names could be made shorter
names(HARsubset) <- sub("tBody", "", names(HARsubset));
names(HARsubset) <- gsub("[/.]+", "_", names(HARsubset));

print("HARsummary");
## SUMMARIZE BY ACTIVITY AND SUBJECT (in bold because this is the last task!)
HARsummary <- summarize(group_by(HARsubset, activityName, subjectID),
        Acc_mean_X = mean(Acc_mean_X), Acc_mean_Y = mean(Acc_mean_Y), Acc_mean_Z = mean(Acc_mean_Z),
        Acc_std_X = mean(Acc_std_X), Acc_std_Y = mean(Acc_std_Y), Acc_std_Z = mean(Acc_std_Z));
print(dim(HARsummary));
readline("press return to continue ...");

## dim(HARsummary) is only 35 8, 35 seems low for distint combinations of activity and subject
## a weakness of the data that for most subjects there is data for only one activity?

write.table(HARsummary, file="HARsummary.txt", row.names=FALSE);

end