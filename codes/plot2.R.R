#reading data
setwd("C:/your_working_directory")
data = read.csv("household_power_consumption.txt", header = T, sep = ";",
                na.strings = "?", 
                colClasses = c("character", "character", "numeric",
                "numeric", "numeric", "numeric", "numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
newdata = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#plot 2
par(mfrow = c(1,1))
plot(newdata$Global_active_power, type = "line", xaxt = "n", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1, 1400, 2880), labels = c("Thu", "Fri", "Sat"))

#save plot
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
