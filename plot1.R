# Read Data
Pow_Data<-read.delim('household_power_consumption.txt',header = TRUE,sep=";", stringsAsFactors=FALSE, dec=".")
#head(Pow_Data)

#subset Data to for 1st 2 days in Feb 2007
New_Data <- Pow_Data[Pow_Data$Date %in% c("1/2/2007","2/2/2007"),]

#Change Global_active_power to numeric
New_Data$Global_active_power <- as.numeric(New_Data$Global_active_power)

#Create histogram for Global_active_power and save plot as png file

png("plot1.png", width=480, height=480)
hist(New_Data$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off()

