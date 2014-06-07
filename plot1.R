##Exploratory Data Analysis
#Project 1

#This project focuses on the Electric Power Consumption data from the UC Irvine 
# Machine Learning Repository -> "http://archive.ics.uci.edu/ml/"
# __Description: 
# Measurements of electric power consumption in one household with 
# a one-minute sampling rate over a period of almost 4 years. Different 
# electrical quantities and some sub-metering values are available.

# __Variables:
# @Date: Date in format dd/mm/yyyy

# @Time: time in format hh:mm:ss

# @Global_active_power: household global minute-averaged active power (in kilowatt)

# @Global_reactive_power: household global minute-averaged reactive power (in kilowatt)

# @Voltage: minute-averaged voltage (in volt)

# @Global_intensity: household global minute-averaged current intensity (in ampere)

# @Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
# It corresponds to the kitchen, containing mainly a dishwasher, an oven and a 
# microwave (hot plates are not electric but gas powered).

# @Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
# It corresponds to the laundry room, containing a washing-machine, a 
# tumble-drier, a refrigerator and a light.

# @Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
# It corresponds to an electric water-heater and an air-conditioner.

#Reading Data In
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setwd("C:/Users/RheumUser/Documents/ProgR/data")
download.file(url, destfile = "./electricpower.zip")
unzip("./electricpower.zip",exdir="power")
list.files("C:/Users/RheumUser/Documents/ProgR/data/power")
dateDownloaded <- date()
dateDownloaded
setwd("C:/Users/RheumUser/Documents/ProgR/data/power")

power <- read.table("household_power_consumption.txt", head = 1, sep = ";", na.strings = "?", 
                    nrows = 2075259, colClasses = c("character", "character", "numeric", 
                                                    "numeric", "numeric", "numeric",
                                                    "numeric", "numeric", "numeric"),
                    strip.white = TRUE)
sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
sub$datetime <- do.call(paste, c(sub[c("Date","Time")], sep = " "))
sub$datetime <- strptime(sub$datetime,"%d/%m/%Y %H:%M:%S")
sub$Date <- strptime(sub$Date,"%d/%m/%Y")
sub$Time <- strptime(sub$Time,"%H:%M:%S")

#Have dataset call "sub" that only includes the dates of interest and has
#one datetime variable.

#1 histogram
png(file = "plot1.png") #open PNG device
par(mfrow = c(1,1))
hist(sub$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col = "orangered1")

# Copy the plot to file
dev.off() #close PNG device