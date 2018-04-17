setwd("~/priya/DataScience- Courseera/workstation/explodata")

# Plot 2

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
Sys.setlocale("LC_TIME", "C")
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))

data1$datetime <- as.POSIXct(paste(data1$Date, data1$Time))

dev.copy(png, file="plot2.png", height=480, width=480)

plot(data1$datetime,data1$Global_active_power,  xlab="",ylab="Global Active Power (kilowatts)",type="l")
 dev.off()