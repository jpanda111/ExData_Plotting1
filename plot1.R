##JH-EDA-WW1
library(data.table)
data<-fread("household_power_consumption.txt",header=TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-subset(data, Date == "2007-2-2"|Date=="2007-2-1")
hist(data$Global_active_power,main="Global Active Power",ylim = range(0,1200),col="red",xlab="Global Active Power (kilowatts)" )
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()