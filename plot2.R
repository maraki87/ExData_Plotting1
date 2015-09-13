# I upload data and I subset it, choosing just the 2 dates I need

DATA = read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
DATAuseful = subset(DATA, DATA$Date == "1/2/2007" | DATA$Date == "2/2/2007")
View(DATAuseful)

datetime = strptime(paste(DATAuseful$Date, DATAuseful$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# I create the second required plot

png(filename = "plot2.png", width = 480, height = 480)
with(DATAuseful, plot(datetime, as.numeric(DATAuseful$Global_active_power), pch = ".", bg = "white", col = "black", xlab = " ", ylab = "Global active power (kilowatts)"))
lines(datetime, as.numeric(DATAuseful$Global_active_power))
dev.off()
