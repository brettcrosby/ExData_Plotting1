## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set".


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data

The code in this project is split into a number of files:
<ul>
<li>plot1.R, plot2.R, plot3.R, plot4.R</li>
<li>helperFunctions.R</li>
</ul>

The <b>helperFunctions</b> file contains functions that achieve the following:
<ul>
<li>Check for the existence of the DataSet file in the system.</li>
<li>If the file doesn't exist, it is downloaded and saved</li>
<li>Once downloaded, the DataSet file is extracted to a text file format.</li>
<li>The extracted file is loaded into R and then subset to the relevant dates (1/2/2007 and 2/2/2007)</li>
<li>A column is added to the subset data which is the concatenation of the Date and Time columns in POSIXct format</li>
<li>This Filtered data is saved in the system as FilteredData.txt</li>
</ul>

Once the FilteredData.txt file is created it is then used in the plotting process.


## Making Plots

Each plot is created using the numbered plot files (plot[1:4].R)  

Each file sources the helperFunctions.R file, loads in the FilteredData.txt file using the colClasses attribute to ensure each column is classed correctly. Plots are then created using this data and output to the png() device.
