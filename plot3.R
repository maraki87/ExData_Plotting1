# I upload data and I subset it, choosing just the 2 dates I need

DATA = read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
DATAuseful = subset(DATA, DATA$Date == "1/2/2007" | DATA$Date == "2/2/2007")
View(DATAuseful)

datetime = strptime(paste(DATAuseful$Date, DATAuseful$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# I create the third required plot

png(filename = "plot3.png", width = 480, height = 480)

with(DATAuseful, {
  plot(datetime, as.numeric(DATAuseful$Sub_metering_1), type = "n", xlab = " ", ylab = "Energy Sub-metering")
  plot(datetime, as.numeric(DATAuseful$Sub_metering_1), type ="l", bg = "white", col = "black", ylab = "Energy Sub-metering")
  lines(datetime, as.numeric(DATAuseful$Sub_metering_2), type ="l", bg = "white", col = "red", ylab = "Energy Sub-metering")
  lines(datetime, as.numeric(DATAuseful$Sub_metering_3), type ="l", bg = "white", col = "blue", ylab = "Energy Sub-metering")
})

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col = c("black", "red", "blue"))
dev.off()
