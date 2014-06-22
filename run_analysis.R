
rm(list = ls())
#Step 1. Merges the training and the test sets to create one data set
#setting working directory and files
setwd("/home/alexander/Escritorio/Data_Scientist_Speciality/Getting and Cleaning Data/Course Project/UCI HAR Dataset/")
Xtest<- read.table("./test/X_test.txt") #2947 obs. 561 variables
Xtestlabel<- read.table("./test/subject_test.txt")
Xtestactivity<- read.table("./test/y_test.txt")

Xtrain<- read.table("./train/X_train.txt") # 7352 obs. 561 variables
Xtrainlabel<- read.table("./train/subject_train.txt")
Xtrainactivity<- read.table("./train/y_train.txt")
joinData<- rbind(Xtest, Xtrain) #10299 obs. 561 variables
# Step2. Extracts only the measurements on the mean and standard 
# Select columns
feature<- read.table("./features.txt")
feature[,2] <- as.vector(feature[,2])
namevariables<- c(feature[,2])

names(joinData) <- namevariables
c<- grep("-mean\\(\\)|-std\\(\\)", names(joinData))
for (i in 1:66){
        joinDatadf<- joinData[,c]
        renamevariables<- c(names(joinData[,c]))
} #10299 obs. 66 variables
names(joinDatadf) <- gsub("-", "", names(joinDatadf)) #remove "-" in column names
names(joinDatadf) <- tolower(gsub("-", "", names(joinDatadf))) #small letters
names(joinDatadf) <- gsub("mean", "Mean", names(joinDatadf)) #capital letter M
names(joinDatadf) <- gsub("std", "Std", names(joinDatadf)) #capital leter S

#Step 3- 4.Uses descriptive activity names to name the activities in the data set
activity<- read.table("./activity_labels.txt")
activity[,2]<- tolower(gsub("_", "", activity[,2]))

joinLabels<- rbind(Xtestlabel, Xtrainlabel)#10299 ob. 1 variable
xactivity<- rbind(Xtestactivity, Xtrainactivity)
names(joinLabels)<- c("id")
names(xactivity)<- "activity"
joinDat<- cbind(joinLabels, xactivity, joinDatadf) 
joinDat[,2]<- as.factor(joinDat[,2])
levels(joinDat[,2])<- c("walking", "walkingupstairs", "walkingdownstairs", 
                        "sitting", "standing", "laying") #names activities

#saving the first dataset, no tidy
write.table(joinData, file = "notidyDat.txt") #10299 obs. 68 variables

#Step 5. Creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject.  
longjoinDat<- melt(joinDat, id = c("id", "activity")) #679734 obs. 4 variables
widejoinDat<- dcast(longjoinDat, id + activity ~ variable, mean) #180 obs. 68 variables

# saving the second dataset
write.table(widejoinDat, file = "widerun_analysis.txt")
