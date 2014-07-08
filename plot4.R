power <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE, header=TRUE, na.strings="?")
power$DateTime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subset <- power[as.Date(power$DateTime) >= as.Date("2007-02-01", "%Y-%m-%d") & as.Date(power$DateTime) < as.Date("2007-02-03", "%Y-%m-%d"), ]

png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(subset$DateTime, subset$Global_active_power, main='', col='black', ylab='Global Active Power (kilowatts)', xlab='', type='l')

plot(subset$DateTime, subset$Voltage, main='', col='black', ylab='Voltage', xlab='datetime', type='l')

plot(subset$DateTime, subset$Sub_metering_1, main='', ylab='Energy sub metering', xlab='', type='l', col='black')
lines(subset$DateTime, subset$Sub_metering_2, col='red')
lines(subset$DateTime, subset$Sub_metering_3, col='blue')
legend("topright", inset=.05, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c('black', 'red', 'blue'), lwd=1)

plot(subset$DateTime, subset$Global_reactive_power, main='', col='black', ylab='Global_reactive_power', xlab='datetime', type='l')

dev.off()
