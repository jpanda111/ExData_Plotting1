library(data.table)
data<-fread("household_power_consumption.txt",header=TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-subset(data, Date == "2007-2-2"|Date=="2007-2-1")
DateTime<-as.POSIXct(paste(data$Date,data$Time))
DateTime<-setNames(DateTime,"DateTime")
data<-cbind(DateTime,data)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~DateTime, type="l",ylab="Global Active Power", xlab="")
  plot(Voltage~DateTime,type="l",ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~DateTime,type="l",ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime,col="Red")
  lines(Sub_metering_3~DateTime,col="Blue")
  legend("topright",text.font=22,xjust = 1,y.intersp = 0.5,cex = 0.7,lwd=c(1,1,1),bty = "n",col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power~DateTime,type="l", ylab = "Global_reactive_power", xlab="datetime")
})
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
