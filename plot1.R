createPlot1<-function(){
    ## Download only needed one time, so commented out download an d unzip after first use
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","consumption.zip")
    unzip("consumption.zip")
    
    library(data.table)
    consumption <-fread("household_power_consumption.txt", na.string="?")
    c<- consumption[Date=="1/2/2007" | Date=="2/2/2007"]
    hist(c$Global_active_power,main="Global Active Power", col="red",xlab="Global Active Power(kilowatts)")
}