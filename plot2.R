# plot2: Project 1 EDA Coursera -- plot2
# Read data re: Electric Power Consumption
# for dates Feb 1 and 2 2007
# Time-series line plot of Global Active Power daily by minute
# 
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

# Convert dates and times from course discussion help
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$timetemp <- paste(mydata$Date, mydata$Time)
mydata$Time <- strptime(mydata$timetemp, format = "%Y-%m-%d %H:%M:%S")

# Now create plot 2

dev.new(width=480, height=480)
y<-mydata$Global_active_power
x<-mydata$Time

plot(x,y,type="l",xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()




