CODE BOOK for tidydata.txt 
Subject : identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
	1..30
Activity: activities the subject performs. Values range
	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING

The rest of columns values come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'.XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
'.mean' is used to denoted the average mean of the signals when subject carries out the specified activity
'.std' is used to denoted the average standard deviation of the signals when subject carries out the specified activity


tBodyAcc.XYZ.mean (standard gravity units “g”)
tGravityAcc.XYZ.mean (standard gravity units “g”)
tBodyAccJerk.XYZ.mean (standard gravity units “g”)
tBodyGyro.XYZ.mean (units: radians/second)
tBodyGyroJerk.XYZ.mean (units: radians/second)
tBodyAccMag.mean (standard gravity units “g”)
tGravityAccMag.mean (standard gravity units “g”)
tBodyAccJerkMag.mean (standard gravity units “g”)
tBodyGyroMag.mean  (units: radians/second)
tBodyGyroJerkMag.mean (units: radians/second)
fBodyAcc.XYZ.mean (standard gravity units “g”)
fBodyAccJerk.XYZ.mean (standard gravity units “g”)
fBodyGyro.XYZ.mean (units: radians/second)
fBodyAccMag.mean (standard gravity units “g”)
fBodyAccJerkMag.mean (standard gravity units “g”)
fBodyGyroMag.mean (units: radians/second)
fBodyGyroJerkMag.mean (units: radians/second)

tBodyAcc.XYZ.std (standard gravity units “g”)
tGravityAcc.XYZ.std (standard gravity units “g”)
tBodyAccJerk.XYZ.std (standard gravity units “g”)
tBodyGyro.XYZ.std (units: radians/second)
tBodyGyroJerk.XYZ.std (units: radians/second)
tBodyAccMag.std (standard gravity units “g”)
tGravityAccMag.std (standard gravity units “g”)
tBodyAccJerkMag.std (standard gravity units “g”)
tBodyGyroMag.std (units: radians/second)
tBodyGyroJerkMag.std (units: radians/second)
fBodyAcc.XYZ.std (standard gravity units “g”)
fBodyAccJerk.XYZ.std (standard gravity units “g”)
fBodyGyro.XYZ.std  (units: radians/second)
fBodyAccMag.std (standard gravity units “g”)
fBodyAccJerkMag.std (standard gravity units “g”)
fBodyGyroMag.std (units: radians/second)
fBodyGyroJerkMag.std (units: radians/second)


Additional vectors obtained by averaging the signals in a signal window sample.
Units: radians
angle.tBodyAccMean.gravity
angle.tBodyAccJerkMean.gravityMean
angle.tBodyGyroMean.gravityMean
angle.tBodyGyroJerkMean.gravityMean
angle.XYZ.gravityMean               




