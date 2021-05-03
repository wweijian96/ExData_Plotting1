#reading data
setwd("C:/your_working_directory")
data = read.csv("household_power_consumption.txt", header = T, sep = ";",
                na.strings = "?", 
                colClasses = c("character", "character", "numeric",
                "numeric", "numeric", "numeric", "numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
newdata = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#plot 1
par(mfrow = c(1,1))
hist(newdata$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

#save plot
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
