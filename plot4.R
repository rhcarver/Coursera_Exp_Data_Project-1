# plot4: Project 1 EDA Coursera -- plot4
# Read data re: Electric Power Consumption
# for dates Feb 1 and 2 2007
# 2 x 2 array of small graphs, including plots 2 & 3 plus two additional
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

# Set up 2 row-2 colum 'canvas'

dev.new(width=480, height=480)
par(mfrow = c(2,2))
# Now create plot 4
# r1, c1 is previous plot 2
with(mydata, {
  y<-mydata$Global_active_power
  x<-mydata$Time
  plot(x,y,type="l",xlab="", ylab="Global Active Power (kilowatts)")
 
# r1, c2
  
  plot(x, type="l", mydata$Voltage, xlab="datetime")
  
# r2, c1
  y1 <- mydata$Sub_metering_1
  y2 <- mydata$Sub_metering_2
  y3 <- mydata$Sub_metering_3
  
  
  plot(x,y1,type="l",xlab="",ylab="Energy sub metering")
  lines(x,y2,type="l", col="red")
  lines(x,y3,type="l", col="blue")
  legend("topright",lty="solid",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#r2, c2  

  plot(x, mydata$Global_reactive_power, type="l", xlab="datetime")
})

dev.copy(png, file="plot4.png")
dev.off()




