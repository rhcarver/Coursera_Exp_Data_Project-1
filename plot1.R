# plot1: Project 1 EDA Coursera -- plot1
# Read data re: Electric Power Consumption
# for dates Feb 1 and 2 2007
# Create histogam of Global Active Power
####################
#
# Set working directory
setwd("C:/Users/rcarver/Dropbox/In process/Coursera/Exploratory Data analysis/Project 1")
#
# add libraries
library(utils)
library(lattice)
# Now read in rows for the 2 days in Feb

f <- "household_power_consumption.txt"
miss <- c("?", "")
mydata <-read.table(f, header = TRUE, sep=";", na.strings=miss)

# Now subset mydata to just 2 days in Feb
mydata <- subset(mydata, Date=="1/2/2007" |Date == "2/2/2007")

# Now create plot 1
dev.new(width=480, height=480)
with(mydata, hist(Global_active_power, col="red", main="Global Active Power"))
dev.copy(png, file="plot1.png")
dev.off()

