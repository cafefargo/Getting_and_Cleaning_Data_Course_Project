## run_analysis.R
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for
## each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive activity names. 
## Creates a second, independent tidy data set with the average of each
##  variable for each activity and each subject. 
##
## The "Inertial Signals" folder was ignored and no data was used from there
##
## Unzip the getdata-projectfiles-UCI HAR Dataset.zip data set.
## The following files must be in the current working directory:
##
##      subject_test.txt
##      X_test.txt
##      y_test.txt
##      subject_train.txt
##      X_train.txt
##      y_train.txt
##      activity_labels.txt
##      features.txt

##read in the "test" files
subject.test<-read.table("subject_test.txt",sep="", header=FALSE)
x.test<-read.table("X_test.txt",sep="", header=FALSE)
y.test<-read.table("y_test.txt",sep="", header=FALSE)

##read in the "train" files
subject.train<-read.table("subject_train.txt",sep="", header=FALSE)
x.train<-read.table("X_train.txt",sep="", header=FALSE)
y.train<-read.table("y_train.txt",sep="", header=FALSE)

##read in the "activity" and "features" files
activity.labels<-read.table("activity_labels.txt",header=FALSE)
features<-read.table("features.txt",sep="", header=FALSE)

##Pretty up the column labels.  Remove "()-," characters
##Set relevant labels (Mean for mean and Std for standard deviation) to
##CamelCase.  Make names human readable.
features.strip<-features
features.strip[,2]<-gsub(pattern="\\(|\\)",x=features[,2],replacement="")
features.strip[,2]<-gsub(pattern="\\-",x=features.strip[,2],replacement="")
features.strip[,2]<-gsub(pattern="mean",x=features.strip[,2],replacement="Mean")
features.strip[,2]<-gsub(pattern="\\,g",x=features.strip[,2],replacement="G")
features.strip[,2]<-gsub(pattern="std",x=features.strip[,2],replacement="Std")
features.strip[,2]<-gsub(pattern="angle",x=features.strip[,2],replacement="Angle")
features.strip[,2]<-gsub(pattern="Acc",x=features.strip[,2],replacement="Acceleration")
features.strip[,2]<-gsub(pattern="Gyro",x=features.strip[,2],replacement="Gyroscope")
features.strip[,2]<-gsub(pattern="Mag",x=features.strip[,2],replacement="Magnitude")
features.strip[,2]<-gsub(pattern="Freq",x=features.strip[,2],replacement="Frequency")
features.strip[,2]<-gsub(pattern="Std",x=features.strip[,2],replacement="StandardDeviation")
features<-features.strip

##Combine the prettied up "features" column names with the data for "test"
##and "train" so that the data will have column names
x.test.names<-x.test
colnames(x.test.names)<-as.vector(features[,2])
x.train.names<-x.train
colnames(x.train.names)<-as.vector(features[,2])

##Set the column names for the "Subject" vector for "test" and "train"
colnames(subject.test)<-c("Subject")
colnames(subject.train)<-c("Subject")

##Set the column names for the "ActivityNumber" vector for "test" and
##"train"
colnames(y.test)<-c("ActivityNumber")
colnames(y.train)<-c("ActivityNumber")

##Combine the "ActivityNumber" column to the "Subject" data set for "test"
##and "train"
subject.test.combine<-cbind(subject.test,y.test)
subject.train.combine<-cbind(subject.train,y.train)

##Get the number of columns in the combined "Subject" data set for "test"
nc<-ncol(subject.test.combine)

##map the activity labels to the activity numbers for "test"
for (i in 1:nrow(subject.test)) {
        subject.test.combine[i,nc+1]<-activity.labels[(subject.test.combine[i,2]),2]

}
colnames(subject.test.combine)[3]<-"ActivityLabel"

##map the activity labels to the activity numbers for "train"
for (i in 1:nrow(subject.train)) {
        subject.train.combine[i,nc+1]<-activity.labels[(subject.train.combine[i,2]),2]
}
colnames(subject.train.combine)[3]<-"ActivityLabel"

##Bind the actual data with the activity for each of "test" and "train"
x.test.names.activity<-cbind(x.test.names,subject.test.combine)
x.train.names.activity<-cbind(x.train.names,subject.train.combine)

##Bind the "test" and "train" data sets together to create one large data
##set
x.test.train<-rbind(x.test.names.activity,x.train.names.activity)

##Get only those columns for "Mean" for mean and "Std" for Standard
##Deviation
mean_cols<-grep("Mean",colnames(x.test.train))
std_cols<-grep("StandardDeviation",colnames(x.test.train))

##Combine the "Mean", "Std", "Subject", "ActivityNumber", and
##"ActivityLabel" columns to make the subset for just "Mean" and "Std"
x.mean.std<-x.test.train[,c(mean_cols,std_cols,562,563,564)]

##order by subject, by activity
x.mean.std.order<-x.mean.std[order(x.mean.std$Subject,x.mean.std$ActivityNumber),]

##Set flag to check if first time through loop
firsttime<-1

##Loop through the Subjects
for (i in 1:30) {

##Loop through the Activities for each Subject        
        for (j in 1:6) {

##Get the subset of the data for this particular Subject & ActivityNumber                
          x.mean.sub<-x.mean.std.order[(x.mean.std.order$Subject == i & x.mean.std.order$ActivityNumber == j),] 
          
##Get the Mean (Average) of each column
          x.mean.sub.colMeans<- signif(colMeans(x.mean.sub[,1:86]),digits=8)

##Get the Subject and ActivityLabel 
          temp.row<-c(as.integer(x.mean.sub[1,87]), as.character(x.mean.sub[1,89]))

##create a row with means (average) for this subject and activity to add to
##the tidy.set          
          new.row<-c(temp.row,x.mean.sub.colMeans)

##Clean up the column names
          names(new.row)[1]<-"Subject"
          names(new.row)[2]<-"ActivityLabel"

##If this is the first time through the loop, tidy.set is set to new.row
##Else new.row is added to the bottom of tidy.set
          if (firsttime==1){
                  tidy.set<-new.row
                  firsttime<-0
                            }
          else {
                  tidy.set<-rbind(tidy.set,new.row)
          }

        }
}


##Write out the "tidy.txt" data set
write.table(tidy.set,file="tidy.txt",row.names=FALSE)
