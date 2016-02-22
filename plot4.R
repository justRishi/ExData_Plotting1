c<- subset(consumption,Date=="1/2/2007" | Date=="2/2/2007")
c$Time<-strptime(paste(c$Date,c$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
c$Date<-as.Date(c$Date,"%d/%m/%Y")

#480  is default but well for the reviewers ;)
png("plot4.png",width=480, height=480)
par(mfrow=c(2,2))

#plot1
plot(c$Time,c$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")

#plot2
plot(c$Time,c$Voltage,type="l",ylab="Voltage",xlab="datetime")

#plot3
yrange<-range(c(c$Sub_metering_1,c$Sub_metering_2,c$Sub_metering_3))
plot(c$Time,c$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering",ylim=yrange)
par(new=T)
plot(c$Time,c$Sub_metering_2, type="l",xlab="",ylab="Energy sub metering",ylim=yrange,col="red")
par(new=T)
plot(c$Time,c$Sub_metering_3, type="l",xlab="",ylab="Energy sub metering",ylim=yrange,col="blue")
legend("topright",pch="__", col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
plot(c$Time,c$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()
    