getwd()

setwd("C:\Users\Amy\Desktop\Coursera Anal Graphics\exdata-data-household_power_consumption")


##read in data noting data is separated by ';' and make all the fields factors 
mydata = read.table("household_power_consumption.txt", header = TRUE,
                  sep = ";", na.strings = "?", stringsAsFactors = FALSE)


##convert field Date to date format
mydata$DateTime <- paste(mydata$Date, mydata$Time)
mydata$Date <- as.Date(mydata$Date, format =  "%d/%m/%Y")
mydata$DateTime2 <- strptime(mydata$DateTime, format = "%d/%m/%Y%H:%M:%S")
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)
mydata$Global_reactive_power <- as.numeric(mydata$Global_reactive_power)
mydata$Voltage <- as.numeric(mydata$Voltage)
mydata$Global_intensity <- as.numeric(mydata$Global_intensity)
mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)



##subset on specific dates
mydata2 <- subset(mydata, Date == "2007-02-01" | Date == "2007-02-02" )

##PLOT 2: line graph
plot( mydata2$DateTime2, mydata2$Global_active_power, type ="l",
xlab = "", ylab = "Global Active Power (kilowatts)" )

dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()

