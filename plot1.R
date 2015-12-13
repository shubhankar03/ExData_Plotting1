yo = read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?", colClasses = c("factor","factor","numeric","numeric", "numeric","numeric","numeric","numeric","numeric"))
yo$Datetime <- strptime(paste(yo$Date,yo$Time), "%d/%m/%Y %H:%M:%S")
yoyo = subset(yo,yo$Date %in% c("1/2/2007","2/2/2007"))

windows()
hist(yoyo$Global_active_power,col = "red",xlab = "Global Active Power(kilowatts)",main = "Global Active Power")

dev.copy(png,file = "plot1.png",width = 480, height = 480)
dev.off()

