##JH-EDA-WW1
library(data.table)
data<-fread("household_power_consumption.txt",header=TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-subset(data, Date == "2007-2-2"|Date=="2007-2-1")
DateTime<-as.POSIXct(paste(data$Date,data$Time))
DateTime<-setNames(DateTime,"DateTime")
data<-cbind(DateTime,data)
plot(data$Global_active_power~data$DateTime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()