dataPower <- as.data.frame(read.table("household_power_consumption.txt", header=TRUE, sep=";"))
head(dataPower, n=2); dim(dataPower)

datetime <- paste0(dataPower$Date, " ", dataPower$Time) #concatenate Date and Time variables
datetime2 <- strptime(datetime, "%d/%m/%Y %H:%M:%S"); datetime2; class(datetime2) #change the datetime variable into date() format
datetime3 <- as.Date(datetime2); class(datetime3); datetime3 # change the data format to date() format

dataPower$datetime <- datetime3 # add a datetime variable (date type) to data frame.
dataPower$datetimeb <- datetime2 # add a datetimeb varialbe (POSIXct type data) to data frame.
head(dataPower); str(dataPower)

#subset data for Feb 2007.
subPowerData <- subset(dataPower, datetime >= '2007-02-01' & datetime <= '2007-02-02') 
#head(subPowerData); tail(subPowerData); dim(subPowerData)

#transform data types
subPowerData$Global_active_power <- as.numeric(as.character(subPowerData$Global_active_power)) 
subPowerData$Global_reactive_power <- as.numeric(as.character(subPowerData$Global_reactive_power)) 
subPowerData$Voltage <- as.numeric(as.character(subPowerData$Voltage)) 
subPowerData$Global_intensity <- as.numeric(as.character(subPowerData$Global_intensity)) 
subPowerData$Sub_metering_1 <- as.numeric(as.character(subPowerData$Sub_metering_1)) 
subPowerData$Sub_metering_2 <- as.numeric(as.character(subPowerData$Sub_metering_2)) 
subPowerData$Sub_metering_3 <- as.numeric(as.character(subPowerData$Sub_metering_3)) 
#str(subPowerData) #check data types 


################ Plotting on the Screen ##################
par(mfrow=c(2,2))
plot(subPowerData$datetimeb, subPowerData$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="")

plot(subPowerData$datetimeb, subPowerData$Voltage, type="l", col="black", ylab="Voltage", xlab="Data Time")

plot(subPowerData$datetimeb, subPowerData$Sub_metering_1, type="l", col="black", ylab="Energy Sub-Metering", xlab="")
lines(subPowerData$datetimeb, subPowerData$Sub_metering_2, type="l", col="red")
lines(subPowerData$datetimeb, subPowerData$Sub_metering_3, type="l", col="blue")
legend("topright", pch="--", col=c("black", "red", "blue"), legend=c("Sub-Metering-1", "Sub-Metering-2", "Sub-Metering-3"), cex=0.4, pt.cex=0.2)

plot(subPowerData$datetimeb, subPowerData$Global_reactive_power, type="l", col="black", ylab="Global Reactive Power", xlab="Data Time")

############## Create PNG file #########################
png(file="plot4.png", width=480, height=480, units="px", bg="white")
par(mfrow=c(2,2))
plot(subPowerData$datetimeb, subPowerData$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="")

plot(subPowerData$datetimeb, subPowerData$Voltage, type="l", col="black", ylab="Voltage", xlab="Data Time")

plot(subPowerData$datetimeb, subPowerData$Sub_metering_1, type="l", col="black", ylab="Energy Sub-Metering", xlab="")
lines(subPowerData$datetimeb, subPowerData$Sub_metering_2, type="l", col="red")
lines(subPowerData$datetimeb, subPowerData$Sub_metering_3, type="l", col="blue")
legend("topright", pch="--", col=c("black", "red", "blue"), legend=c("Sub-Metering-1", "Sub-Metering-2", "Sub-Metering-3"), cex=0.4, pt.cex=0.2)

plot(subPowerData$datetimeb, subPowerData$Global_reactive_power, type="l", col="black", ylab="Global Reactive Power", xlab="Data Time")

dev.off()
