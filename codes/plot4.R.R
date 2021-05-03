#reading data
setwd("C:/your_working_directory")
data = read.csv("household_power_consumption.txt", header = T, sep = ";",
                na.strings = "?", 
                colClasses = c("character", "character", "numeric",
                "numeric", "numeric", "numeric", "numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
newdata = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#plot 4
par(mfrow = c(2,2))

plot(newdata$Global_active_power, type = "line", xaxt = "n", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1, 1400, 2880), labels = c("Thu", "Fri", "Sat"))

plot(newdata$Voltage, type = "line", xaxt = "n", 
     xlab = "datetime", ylab = "Voltage")
axis(1, at = c(1, 1400, 2880), labels = c("Thu", "Fri", "Sat"))

plot(newdata$Sub_metering_1, type = "line", xaxt = "n",
     col = "black", xlab = "", ylab = "Energy sub metering")
lines(newdata$Sub_metering_2, col = "red")
lines(newdata$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=c(0.3, 0.3, 0.3), y.intersp = 0.1, cex = 0.4,
       col=c("black","red","blue"))
axis(1, at = c(1, 1400, 2880), labels = c("Thu", "Fri", "Sat"))

plot(newdata$Global_reactive_power, type = "line", xaxt = "n", 
     xlab = "datetime", ylab = "Global_reactive_power")
axis(1, at = c(1, 1400, 2880), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

