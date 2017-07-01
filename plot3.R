# Read Data
Pow_Data<-read.delim('household_power_consumption.txt',header = TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
#head(Pow_Data)

#subset Data to for 1st 2 days in Feb 2007
New_Data <- Pow_Data[Pow_Data$Date %in% c("1/2/2007","2/2/2007"),]

#combine Date and Time
New_Data$DateTime <- strptime(paste(New_Data$Date,New_Data$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
#head(New_Data$DateTime)

#Change Sub_metering_* to numeric
New_Data$Sub_metering_1 <- as.numeric(New_Data$Sub_metering_1)
New_Data$Sub_metering_2 <- as.numeric(New_Data$Sub_metering_2)
New_Data$Sub_metering_3 <- as.numeric(New_Data$Sub_metering_3)


#Create plot DateTime against Sub_metering_* and save as png
png("plot3.png", width=480, height=480)
plot(New_Data$DateTime,New_Data$Sub_metering_1,type = "l", xlab=" ", ylab = "Energy sub metering")
lines(New_Data$DateTime,New_Data$Sub_metering_2,type = "l",col="red")
lines(New_Data$DateTime,New_Data$Sub_metering_3,type = "l",col="blue")
legend("topright",lty = 1,lwd=2 ,col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
