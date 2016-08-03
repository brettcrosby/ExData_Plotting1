# ------------------------------------------------------
#    Exploratory Data Analysis - Week One Assignment
#                     Plot 4
# ------------------------------------------------------

# Set the working directory for the project
setwd("~/../git/Coursera/ExpDataAnalysis/ExData_Plotting1")

# Source the file containing the helper functions
source("helperFunctions.R")

# Use the helper function to download the file if it hasn't already been downloaded
# and create a filtered data set for only the relevant days.
DownloadAndPrepareData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

# --------- Plot 4 -----------
fd <- ReadInFilteredData()

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(fd$DateTime, fd$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(fd$DateTime, fd$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(fd$DateTime, fd$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(fd$DateTime, fd$Sub_metering_2, type="l", col="red")
lines(fd$DateTime, fd$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(fd$DateTime, fd$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()
