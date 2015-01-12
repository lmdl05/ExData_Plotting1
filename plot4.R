#Extract Data
data <- read.table("../household_power_consumption.txt", skip=66637, nrows=2880, sep=";")
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

#Set the file
png(file="plot4.png",width=480,height=480)

#define rows and columns of plots
par(mfrow=c(2,2))

#Global Active Power (kilowatts)
plot(data$DateTime, data$Global_active_power, type="n", ylab="Global Active Power", xlab="")
lines(data$DateTime, data$Global_active_power )

#Voltage
plot(data$DateTime, data$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(data$DateTime, data$Voltage )

#Energy sub metering
plot(data$DateTime, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
legend_labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend_colors <- c("black", "red", "blue")
legend("topright", legend = legend_labels, col = legend_colors, lty = 1, bg = "transparent", box.col = "transparent", cex = 0.95)
lines(data$DateTime, data$Sub_metering_1 )
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")

#Global Active Power
plot(data$DateTime, data$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(data$DateTime, data$Global_reactive_power )

#close dev
dev.off()



