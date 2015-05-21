library(mosaic)
## read test data into R
  #reading subjects of test
  subtest=read.file("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",header=F)
  #reading activity of test
  ytest=read.file("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt",header=F)
  #reading measurement of test
  a=read.file("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",header=F)
  #column combine of  test data
  test=cbind(subtest,ytest,a)
## Read train data into R
  subtrain=read.file("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",header=F)
  xtrain=read.file("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",header=F)
  ytrain=read.file("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt",header=F)
  train=cbind(subtrain,ytrain,xtrain)
## row combine to get the whole data set
  whole=rbind(test,train)
#set whole data with descriptive names
feature=read.file("~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt",header=F,stringsAsFactor=F)
f=feature$V2
f=c("subject","activity",f)
names(whole)=f
# giving activity with descriptive names
whole$activity=factor(whole$activity,level=c(1:6),labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

col=grep("mean|std",f)
col=c(1,2,col)
wanted=whole[,col]
library(reshape2)
wanted$subject=factor(wanted$subject)
mydata=melt(wanted,id=c("subject","activity"))
Avg=dcast(mydata,subject+activity~variable,mean)
deviation=dcast(mydata,subject+activity~variable,sd)
