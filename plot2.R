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

# Plotting 02: Global Active Power Plot
plot(subPowerData$datetimeb, subPowerData$Global_active_power, 
     type="l", ylab="Global Active Power (Kilowatts)", xlab="")

# Make PNG file
png(file="plot2.png", width=480, height=480, units="px", bg="white")
plot(subPowerData$datetimeb, subPowerData$Global_active_power, 
     type="l", ylab="Global Active Power (Kilowatts)", xlab="")
dev.off()
