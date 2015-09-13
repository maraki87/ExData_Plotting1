# I upload data and I subset it, choosing just the 2 dates I need

DATA = read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
DATAuseful = subset(DATA, DATA$Date == "1/2/2007" | DATA$Date == "2/2/2007")
View(DATAuseful)

# I create the first required plot
# to create a histogram, it is necessary that the variable is numeric, therefore I transform this variable accordingly

png(filename = "plot1.png", width = 480, height = 480)
with(DATAuseful, hist(as.numeric(DATAuseful$Global_active_power), bg = "white", col = "red", main = "Global active power", xlab = "Global active power (kilowatts)"))
dev.off()

