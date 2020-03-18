#this is the script to create "Plot1.png"

#this sets the wd and contains "household_power_consumption.txt", if used, then the output will be in that direcorty, otherwise current wd
#setwd("C:/Users/Maarten/Documents/coursera/r_wd/coursera4_1_assignment/")

#rough estimate of memory
#rows * columns * 8byte in case of doubles
#according to instructions 2,075,259 rows and 9 columns.
#so: (1,073,741,824 bytes per Gb)
(2075259*9*8)/1073741824
# 0.139157 GB. should be fine

#quick view on file
readLines("household_power_consumption.txt")

# ;-seperated
#contains dates, times, furthermore numbers

#make a dataframe with subsetted rows
myData<-read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
#check dim
#dim(myData)
myData[,1]<-as.Date(myData$Date, format=c("%d/%m/%Y"))
myData<-myData[(myData[,1]=="2007-02-01"|myData[,1]=="2007-02-02"),]
#check dim
#dim(myData)

#adjust the columns
# myData[,2]<-strptime(myData[,2], format = c("%H:%M:%S")) it doesnt work properly
myData[,3]<-as.numeric(myData[,3])


# make the histogram
png(file = "plot1.png", width = 480, height = 480)
hist(myData[,3], col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()