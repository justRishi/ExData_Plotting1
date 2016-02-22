## Download only needed one time, so you can comment out download and unzip after first use
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","consumption.zip")
unzip("consumption.zip")

##library(data.table) data.table doesn't work with strptime, switched back to data.frame
#consumption <-fread("household_power_consumption.txt", na.string="?")


consumption <-read.csv2("household_power_consumption.txt", na.string="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),dec=".")


c<- subset(consumption,Date=="1/2/2007" | Date=="2/2/2007")
c$Time<-strptime(paste(c$Date,c$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
c$Date<-as.Date(c$Date,"%d/%m/%Y")

#480  is default but well for the reviewers ;)
png("plot3.png",width=480, height=480)
yrange<-range(c(c$Sub_metering_1,c$Sub_metering_2,c$Sub_metering_3))
plot(c$Time,c$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering",ylim=yrange)
par(new=T)
plot(c$Time,c$Sub_metering_2, type="l",xlab="",ylab="Energy sub metering",ylim=yrange,col="red")
par(new=T)
plot(c$Time,c$Sub_metering_3, type="l",xlab="",ylab="Energy sub metering",ylim=yrange,col="blue")
legend("topright",pch="__", col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()