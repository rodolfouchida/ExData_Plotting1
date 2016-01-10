hugedata <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

hugedata$Date <- as.character(hugedata$Date)

hugedata$Date <- as.Date(hugedata$Date, "%d/%m/%Y")

data <- subset(hugedata, Date >= "2007-02-01" & Date<="2007-02-02")

datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 


par(mfrow = c(2,2))

plot(data$Global_active_power ~ data$Datetime, type = "l" , ylab = "Global Active Power (Killowatts)", xlab = "")

plot(data$Voltage ~ data$Datetime , type = "l" , ylab = "Voltage" , xlab = "Datetime")

plot(data$Sub_metering_1 ~ data$Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$Datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$Datetime, col='Blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red" , "blue"), lty =1, lwd =2, cex = 0.5, text.width = strwidth("700"), bty = "n")
plot(data$Global_reactive_power ~ data$Datetime , type = "l" , ylab = "Global reactive power" , xlab = "Datetime")

dev.copy(png, file= "plot4.png",height=480, width=480)

dev.off()








