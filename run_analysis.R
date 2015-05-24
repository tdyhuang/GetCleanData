## read test data into R
#reading subjects columm into R
subtest=read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",header=F)
#reading activity column into R
ytest=read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt",header=F)
#reading measurement of test into R
a=read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",header=F)
#columns combine into test data set
test=cbind(subtest,ytest,a)
## Read train data into R (procedures as test data set)
subtrain=read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",header=F)
xtrain=read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",header=F)
ytrain=read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt",header=F)
train=cbind(subtrain,ytrain,xtrain)
## row combine test and train data set become the whole data set
whole=rbind(test,train)
#set whole data with descriptive names
feature=read.table("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt",header=F,stringsAsFactor=F)
f=feature$V2
f=c("subject","activity",f)
names(whole)=f

# giving activity value with descriptive names
label=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
whole$activity=factor(whole$activity,level=c(1:6),labels=label)

# extracted colomn of subject,activity and measurements which title names have mean and std 
col=grep("mean|std",f) # columns with names of mean or std
col=c(1,2,col) #add column 1(subject) and column 2 (activity)

#extracted all the columns we wanted
wanted=whole[,col]



