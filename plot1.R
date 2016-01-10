hugedata <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

hugedata$Date <- as.character(hugedata$Date)

hugedata$Date <- as.Date(hugedata$Date, "%d/%m/%Y")

data <- subset(hugedata, Date >= "2007-02-01" & Date<="2007-02-02")

hist(data$Global_active_power, main = "Global Active Power", col = "Red", xlab = "Global Active Power (Killowatts)", ylab = "Frequency")

dev.copy(png, file= "plot1.png",height=480, width=480)

dev.off()