power <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE, header=TRUE, na.strings="?")
power$DateTime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subset <- power[as.Date(power$DateTime) >= as.Date("2007-02-01", "%Y-%m-%d") & as.Date(power$DateTime) < as.Date("2007-02-03", "%Y-%m-%d"), ]

png("plot1.png", width=480, height=480, units="px")
hist(subset$Global_active_power, main='Global Active Power', col='red', ylab='Frequency', xlab='Global Active Power (kilowatts)')
dev.off()
