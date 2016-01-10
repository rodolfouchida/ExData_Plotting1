hugedata <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

hugedata$Date <- as.character(hugedata$Date)

hugedata$Date <- as.Date(hugedata$Date, "%d/%m/%Y")

data <- subset(hugedata, Date >= "2007-02-01" & Date<="2007-02-02")

datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 

plot(data$Global_active_power ~ data$Datetime, type = "l" , ylab = "Global Active Power (Killowatts)", xlab = "")

dev.copy(png, file= "plot2.png",height=480, width=480)

dev.off()