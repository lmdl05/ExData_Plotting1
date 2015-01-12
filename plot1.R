#Extract Data
goodData <- read.table("../household_power_consumption.txt", skip=66637, nrows=2880, sep=";")
colnames(goodData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Set the file
png(file="plot1.png",width=480,height=480)

#Base Plot
hist(goodData[,3], col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#close dev
dev.off()
