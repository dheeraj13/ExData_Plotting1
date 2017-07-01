# Read Data
Pow_Data<-read.delim('household_power_consumption.txt',header = TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
#head(Pow_Data)

#subset Data to for 1st 2 days in Feb 2007
New_Data <- Pow_Data[Pow_Data$Date %in% c("1/2/2007","2/2/2007"),]

#combine Date and Time
New_Data$DateTime <- strptime(paste(New_Data$Date,New_Data$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
#head(New_Data$DateTime)

#Change Global_active_power to numeric
New_Data$Global_active_power <- as.numeric(New_Data$Global_active_power)

#Change Global_reactive_power to numeric
New_Data$Global_reactive_power <- as.numeric(New_Data$Global_reactive_power)

#Change Voltage to numeric
New_Data$Voltage <- as.numeric(New_Data$Voltage)

#Change Sub_metering_* to numeric
New_Data$Sub_metering_1 <- as.numeric(New_Data$Sub_metering_1)
New_Data$Sub_metering_2 <- as.numeric(New_Data$Sub_metering_2)
New_Data$Sub_metering_3 <- as.numeric(New_Data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#Create plot DateTime against Global_active_power
plot(New_Data$DateTime,New_Data$Global_active_power,type = "l", xlab=" ", ylab = "Global Active Power")

#Create plot DateTime against VoltAGE
plot(New_Data$DateTime,New_Data$Voltage,type = "l", xlab="datetime", ylab = "Voltage")

#Create plot DateTime against Sub_metering_*
plot(New_Data$DateTime,New_Data$Sub_metering_1,type = "l", xlab=" ", ylab = "Energy sub metering")
lines(New_Data$DateTime,New_Data$Sub_metering_2,type = "l",col="red")
lines(New_Data$DateTime,New_Data$Sub_metering_3,type = "l",col="blue")
legend("topright",lty = 1,lwd=1 ,col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

#Create plot DateTime against Global_reactive_power
plot(New_Data$DateTime,New_Data$Global_reactive_power,type = "l", xlab="datetime", ylab = "Global_reactive_power")

dev.off()



