dataPower <- as.data.frame(read.table("household_power_consumption.txt", header=TRUE, sep=";"))
head(dataPower, n=2); dim(dataPower)

#sapply(dataPower, mode) #Check data type for all data columns.
sapply(dataPower, class) #Check data class for all data columns.
#str(dataPower)

datetime <- paste0(dataPower$Date, " ", dataPower$Time) #concatenate Date and Time variables
datetime2 <- strptime(datetime, "%d/%m/%Y %H:%M:%S"); datetime2; class(datetime2) #change the datetime variable into date() format
datetime3 <- as.Date(datetime2); class(datetime3); datetime3 # change the data format to date() format

dataPower$datetime <- datetime3 # add a datetime variable (date type) to data frame.
head(dataPower)

#subset data for Feb 2007.
subPowerData <- subset(dataPower, datetime >= '2007-02-01' & datetime <= '2007-02-02') 
head(subPowerData); tail(subPowerData) #check first 5 and last 5 data for Feb 2007 data.
dim(subPowerData)

#transform data type
str(subPowerData)
subPowerData$Global_active_power <- as.numeric(as.character(subPowerData$Global_active_power)) 
subPowerData$Global_reactive_power <- as.numeric(as.character(subPowerData$Global_reactive_power)) 
subPowerData$Voltage <- as.numeric(as.character(subPowerData$Voltage)) 
subPowerData$Global_intensity <- as.numeric(as.character(subPowerData$Global_intensity)) 
subPowerData$Sub_metering_1 <- as.numeric(as.character(subPowerData$Sub_metering_1)) 
subPowerData$Sub_metering_2 <- as.numeric(as.character(subPowerData$Sub_metering_2)) 

str(subPowerData) #check data types 

## Draw historgram - starts
par(mfrow=c(1,1))
hist(subPowerData$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
## Draw historgram - endss


## Create PNG file - starts
png(file="plot1.png", width=480, height=480, units="px", bg="white")
hist(subPowerData$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
## Create PNG file - ends