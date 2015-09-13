# I upload data and I subset it, choosing just the 2 dates I need

DATA = read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
DATAuseful = subset(DATA, DATA$Date == "1/2/2007" | DATA$Date == "2/2/2007")
View(DATAuseful)

datetime = strptime(paste(DATAuseful$Date, DATAuseful$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# I create the fourth required plot

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, as.numeric(DATAuseful$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)", cex=0.2)

plot(datetime, as.numeric(DATAuseful$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(datetime, as.numeric(DATAuseful$Sub_metering_1), type="l", ylab="Energy Sub-metering", xlab=" ")
lines(datetime, as.numeric(DATAuseful$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(DATAuseful$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, as.numeric(DATAuseful$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
