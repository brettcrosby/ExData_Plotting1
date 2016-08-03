# ------------------------------------------------------
#    Exploratory Data Analysis - Week One Assignment
#                     Plot 1
# ------------------------------------------------------

# Set the working directory for the project
setwd("~/../git/Coursera/ExpDataAnalysis/ExData_Plotting1")

# Source the file containing the helper functions
source("helperFunctions.R")

# Use the helper function to download the file if it hasn't already been downloaded
# and create a filtered data set for only the relevant days.
DownloadAndPrepareData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

# Read in the filtered data set
fd <- ReadInFilteredData()

# ------ Create Plot 1 --------
png("plot1.png", width = 480, height = 480)
hist(fd$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
