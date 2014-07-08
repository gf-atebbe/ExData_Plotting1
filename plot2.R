power <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE, header=TRUE, na.strings="?")
power$DateTime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subset <- power[as.Date(power$DateTime) >= as.Date("2007-02-01", "%Y-%m-%d") & as.Date(power$DateTime) < as.Date("2007-02-03", "%Y-%m-%d"), ]

png("plot2.png", width=480, height=480, units="px")
plot(subset$DateTime, subset$Global_active_power, main='', col='black', ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()
