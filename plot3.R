#plot3.R

#
#Read dataset:
#
dataset <- read.csv("~/data/household_power_consumption.txt", colClasses = c("character", "character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep = ";", na.strings = "?")
#
#char to Date
#
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
#
#Subset to the correct date range
#
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#
#date conversion
#
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
#
#Plot
#
with(data, {
  plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#
#screen to PNG
#
dev.copy(png, file="~/data/plot3.png", height=480, width=480);dev.off()



