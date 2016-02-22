#createPlot1<-function(){
    ## Download only needed one time, so commented out download an d unzip after first use
#   download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","consumption.zip")
#    unzip("consumption.zip")
    
    #library(data.table) data.table works oddly with dates and time, switched back to data.frame
    
    #consumption <-read.csv2("household_power_consumption.txt", na.string="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),dec=".")
    c<- subset(consumption,Date=="1/2/2007" | Date=="2/2/2007")
    png("plot1.png",width=480, height=480)
    hist(c$Global_active_power,main="Global Active Power", col="red",xlab="Global Active Power(kilowatts)")
    dev.off()
    #}