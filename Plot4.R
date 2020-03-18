#this is the script to create "Plot4.png"

#this sets the wd and contains "household_power_consumption.txt", if used, then the output will be in that direcorty, otherwise current wd
#setwd("C:/Users/Maarten/Documents/coursera/r_wd/coursera4_1_assignment/")

#make plot 2*2, row filled
par(mfcol=c(2,2))

#make a dataframe with subsetted rows, general use
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
myData[,7]<-as.numeric(myData[,7])
myData[,8]<-as.numeric(myData[,8])
myData[,9]<-as.numeric(myData[,9])

#start creating file
#png(file = "plot4.png", width = 480, height = 480)

#create upper left plot
with(myData, plot(strptime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

#create lower left plot
with(myData, plot(strptime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(myData$strptime, myData$Sub_metering_2, col="red")
lines(myData$strptime, myData$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#create upper right plot
with(myData, plot(strptime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

#create lower right plot
with(myData, plot(strptime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

#copy plot to file
dev.copy(png, file = "plot4.png", width = 480, height = 480) 
dev.off()