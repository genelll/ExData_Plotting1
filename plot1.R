#
#plot1.R
#

#DATA:
#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss
#Global_active_power: household global minute-averaged active power (in kilowatt)
#Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#Voltage: minute-averaged voltage (in volt)
#Global_intensity: household global minute-averaged current intensity (in ampere)
#Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

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
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power", ylab="Frequency", col="Red")
#
#screen to PNG
#
dev.copy(png, file="plot1.png", height=480, width=480);dev.off()




