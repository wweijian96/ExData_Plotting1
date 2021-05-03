#reading data
setwd("C:/your_working_directory")
data = read.csv("household_power_consumption.txt", header = T, sep = ";",
                na.strings = "?", 
                colClasses = c("character", "character", "numeric",
                "numeric", "numeric", "numeric", "numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
newdata = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#plot 3
par(mfrow = c(1,1))
plot(newdata$Sub_metering_1, type = "line", xaxt = "n",
     col = "black", xlab = "", ylab = "Energy sub metering")
lines(newdata$Sub_metering_2, col = "red")
lines(newdata$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=c(0.3, 0.3, 0.3), y.intersp = 0.5,
       col=c("black","red","blue"))
axis(1, at = c(1, 1400, 2880), labels = c("Thu", "Fri", "Sat"))

#save plot
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
