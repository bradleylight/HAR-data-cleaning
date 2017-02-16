# Codebook
## HAR-data-cleaning
### Human Activity Recognition Data Cleaning Course Project

Purpose: Create a clean subset of HAR in a data frame _HARsubset_

Description of the HARsubset data frame:

| Column Name | Type | Values |
| ----------- | ---- | ------ |
| <86 mean and std columns>  | numeric | normalized and bounded within [-1,1] |
| activityID | factor | 1:6 |
| activityName | factor | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |
| subjectID | factor | 1:30 |
| testTrain | factor | test, train |

Full List of Column Names and Descriptions:

| Name | Description |
| ----------- | ------------------ |
| tBodyAcc.mean...X |             t=time domain, body, Linear Acceleration, mean, in the X direction |
| tBodyAcc.mean...Y |             t=time domain, body, Linear Acceleration, mean, in the Y direction |
| tBodyAcc.mean...Z|             t=time domain, body, Linear Acceleration, mean, in the Z direction|
| tBodyAcc.std...X|              t=time domain, body, Linear Acceleration, standard deviation, in the X direction|
| tBodyAcc.std...Y|              t=time domain, body, Linear Acceleration, standard deviation, in the Y direction|
| tBodyAcc.std...Z|              t=time domain, body, Linear Acceleration, standard deviation, in the Z direction|
| tGravityAcc.mean...X|          t=time domain, gravity, Linear Acceleration, mean, in the X direction|
| tGravityAcc.mean...Y|          ...|
| tGravityAcc.mean...Z||
| tGravityAcc.std...X||
| tGravityAcc.std...Y||
| tGravityAcc.std...Z||
| tBodyAccJerk.mean...X|         Jerk signal|
| tBodyAccJerk.mean...Y||
| tBodyAccJerk.mean...Z||
| tBodyAccJerk.std...X||
| tBodyAccJerk.std...Y||
| tBodyAccJerk.std...Z||
| tBodyGyro.mean...X|            Angular Acceleration|
| tBodyGyro.mean...Y|            ...|
| tBodyGyro.mean...Z||
| tBodyGyro.std...X||
| tBodyGyro.std...Y||
| tBodyGyro.std...Z||
| tBodyGyroJerk.mean...X||
| tBodyGyroJerk.mean...Y||
| tBodyGyroJerk.mean...Z||
| tBodyGyroJerk.std...X||
| tBodyGyroJerk.std...Y||
| tBodyGyroJerk.std...Z||
| tBodyAccMag.mean..|            Magnitude|
| tBodyAccMag.std..||
| tGravityAccMag.mean..||
| tGravityAccMag.std..||
| tBodyAccJerkMag.mean..||
| tBodyAccJerkMag.std..||
| tBodyGyroMag.mean..||
| tBodyGyroMag.std..||
| tBodyGyroJerkMag.mean..||
| tBodyGyroJerkMag.std..||
| fBodyAcc.mean...X|             frequency domain, body, Linear Acceleration, mean, in the X direction|
| fBodyAcc.mean...Y|             ...|
| fBodyAcc.mean...Z||
| fBodyAcc.std...X||
| fBodyAcc.std...Y||
| fBodyAcc.std...Z||
| fBodyAcc.meanFreq...X|         mean frequency|
| fBodyAcc.meanFreq...Y||
| fBodyAcc.meanFreq...Z||
| fBodyAccJerk.mean...X||
| fBodyAccJerk.mean...Y||
| fBodyAccJerk.mean...Z||
| fBodyAccJerk.std...X||
| fBodyAccJerk.std...Y||
| fBodyAccJerk.std...Z||
| fBodyAccJerk.meanFreq...X||
| fBodyAccJerk.meanFreq...Y||
| fBodyAccJerk.meanFreq...Z||
| fBodyGyro.mean...X||
| fBodyGyro.mean...Y||
| fBodyGyro.mean...Z||
| fBodyGyro.std...X||
| fBodyGyro.std...Y||
| fBodyGyro.std...Z||
| fBodyGyro.meanFreq...X||
| fBodyGyro.meanFreq...Y||
| fBodyGyro.meanFreq...Z||
| fBodyAccMag.mean..||
| fBodyAccMag.std..||
| fBodyAccMag.meanFreq..||
| fBodyBodyAccJerkMag.mean..||
| fBodyBodyAccJerkMag.std..||
| fBodyBodyAccJerkMag.meanFreq..||
| fBodyBodyGyroMag.mean..||
| fBodyBodyGyroMag.std..||
| fBodyBodyGyroMag.meanFreq..||
| fBodyBodyGyroJerkMag.mean..||
| fBodyBodyGyroJerkMag.std..||
| fBodyBodyGyroJerkMag.meanFreq..||
| angle.tBodyAccMean.gravity.||
| angle.tBodyAccJerkMean..gravityMean.||
| angle.tBodyGyroMean.gravityMean.||
| angle.tBodyGyroJerkMean.gravityMean.||
| angle.X.gravityMean.||
| angle.Y.gravityMean.||
| angle.Z.gravityMean.||
| activityID|                    integer ID for the activity|
| activityName|                  name of the activity|
| subjectID|                     integer ID for the subject|
| testTrain|                     the group "test" or "training" to which volunteers were randomly placed|

END
