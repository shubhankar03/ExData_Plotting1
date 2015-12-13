yo = read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?", colClasses = c("factor","factor","numeric","numeric", "numeric","numeric","numeric","numeric","numeric"))
yo$Datetime <- strptime(paste(yo$Date,yo$Time), "%d/%m/%Y %H:%M:%S")
yoyo = subset(yo,yo$Date %in% c("1/2/2007","2/2/2007"))

windows()
par(mfrow = c(2,2))

#plot1
plot(yoyo$Datetime, yoyo$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

#plot2	
plot(yoyo$Datetime, yoyo$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#plot3
plot(yoyo$Datetime, yoyo$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
points(yoyo$Datetime, yoyo$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
points(yoyo$Datetime, yoyo$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#plot4
plot(yoyo$Datetime, yoyo$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.copy(png,file = "plot4.png",width = 480, height = 480)
dev.off()