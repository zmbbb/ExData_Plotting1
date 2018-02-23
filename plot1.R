# Course 04 - Exploratory Data Analysis
# Week 1 Assignment
#
# R script for creating plot 1.
#
# Author: Andreas Renner
# Date: 2018-02-23


library(data.table)


# Get data
if(!file.exists(file.path("data", "household_power_consumption.txt"))) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip", mode="wb")
        unzip("household_power_consumption.zip", exdir="./data")
}


# Read complete file into data.table
f <- fread(file.path("data", "household_power_consumption.txt"), na.string="?")

# Subset data getting in-scope dates 2007-02-01 and 2007-02-02
f_inscope <- f[Date == "1/2/2007" | Date == "2/2/2007"]

# Adding Date/Time-type column
f_inscope <- f_inscope[, Datetime := .(as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))]


# Plot 1
png(filename="plot1.png", bg="transparent")
hist(f_inscope$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

