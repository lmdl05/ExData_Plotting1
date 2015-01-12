#Extract Data
data <- read.table("../household_power_consumption.txt", skip=66637, nrows=2880, sep=";")
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

#Set the file
png(file="plot2.png",width=480,height=480)

#Base Plot
plot(data$DateTime, data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$DateTime, data$Global_active_power, )

#Close dev
dev.off()

