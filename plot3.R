data <- read.table("../household_power_consumption.txt", skip=66637, nrows=2880, sep=";")
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 
png(file="plot3.png",width=480,height=480)
plot(data$DateTime, data$Sub_metering_1, type="n", ylab="Global Active Power (kilowatts)", xlab="")
legend_labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend_colors <- c("black", "red", "blue")
legend("topright", legend = legend_labels, col = legend_colors, lty = 1, bg = "transparent", box.col = "transparent", cex = 0.95)
lines(data$DateTime, data$Sub_metering_1 )
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
dev.off()


