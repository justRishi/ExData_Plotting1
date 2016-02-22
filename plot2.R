#createPlot2<-function(){
    #c$Date<-as.Date(c$Date,"%d/%m/%Y")
    #c[,dt:=paste(Date,Time, sep=" ")]
#c[,dt:=paste(Date,Time, sep=" ")]
#c$dt<-as.POSIXlt(c$dt,format="%d/%m/%Y %H:%M:%S")

c<- subset(consumption,Date=="1/2/2007" | Date=="2/2/2007")
c$Time<-strptime(paste(c$Date,c$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
c$Date<-as.Date(c$Date,"%d/%m/%Y")

#480  is default but well for the reviewers ;)
png("plot2.png",width=480, height=480)
plot(c$Time,c$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()

#}