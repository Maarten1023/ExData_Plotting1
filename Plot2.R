#this is the script to create "Plot2.png"

#this sets the wd and contains "household_power_consumption.txt", if used, then the output will be in that direcorty, otherwise current wd
#setwd("C:/Users/Maarten/Documents/coursera/r_wd/coursera4_1_assignment/")

#make a dataframe with subsetted rows
myData<-read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
myData[,1]<-as.Date(myData$Date, format=c("%d/%m/%Y"))
myData<-myData[(myData[,1]=="2007-02-01"|myData[,1]=="2007-02-02"),]
myData<-cbind(myData[], paste(myData$Date, myData$Time))
myData$`paste(myData$Date, myData$Time)`<-strptime(myData$`paste(myData$Date, myData$Time)`, "%Y-%m-%d %H:%M:%S")
colnames(myData)[10]<-c("strptime")
#myData<-cbind(myData, weekdays(myData[,10]))
#Sys.setlocale("LC_ALL","English")
#colnames(myData)[11]<-c("weekdays")
myData[,3]<-as.numeric(myData[,3])
png(file = "plot2.png", width = 480, height = 480)
with(myData, plot(strptime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()