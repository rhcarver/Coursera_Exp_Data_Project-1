# plot3: Project 1 EDA Coursera -- plot3
# Read data re: Electric Power Consumption
# for dates Feb 1 and 2 2007
# 3 overlaid time-series line plot of sub-metering daily by minute
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

# Now create plot 3

dev.new(width=480, height=480)
y1 <- mydata$Sub_metering_1
y2 <- mydata$Sub_metering_2
y3 <- mydata$Sub_metering_3
x<-mydata$Time

plot(x,y1,type="l",xlab="",ylab="Energy sub metering")
lines(x,y2,type="l", col="red")
lines(x,y3,type="l", col="blue")
legend("topright",lty="solid",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()




