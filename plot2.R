#plot2.R

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
plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power", xlab="")
#
#screen to PNG
#
dev.copy(png, file="~/data/plot2.png", height=480, width=480);dev.off()

