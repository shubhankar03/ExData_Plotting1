yo = read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?", colClasses = c("factor","factor","numeric","numeric", "numeric","numeric","numeric","numeric","numeric"))
yo$Datetime <- strptime(paste(yo$Date,yo$Time), "%d/%m/%Y %H:%M:%S")
yoyo = subset(yo,yo$Date %in% c("1/2/2007","2/2/2007"))

windows()
plot(yoyo$Datetime, yoyo$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(yoyo$Datetime, yoyo$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(yoyo$Datetime, yoyo$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering",col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.copy(png,file = "plot3.png",width = 480, height = 480)
dev.off()