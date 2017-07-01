# Read Data
Pow_Data<-read.delim('household_power_consumption.txt',header = TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
#head(Pow_Data)

#subset Data to for 1st 2 days in Feb 2007
New_Data <- Pow_Data[Pow_Data$Date %in% c("1/2/2007","2/2/2007"),]

#Change Global_active_power to numeric
New_Data$Global_active_power <- as.numeric(New_Data$Global_active_power)

#combine Date and Time
New_Data$DateTime <- strptime(paste(New_Data$Date,New_Data$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
#head(New_Data$DateTime)

#Create plot DateTime against Global_active_power and save as png

png("plot2.png", width=480, height=480)
plot(New_Data$DateTime,New_Data$Global_active_power,type = "l", xlab=" ", ylab = "Global Active Power (kilowatts)")
dev.off()

