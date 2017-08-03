# read data from 1/2/2007 to 2/2/2007
hpc<-read.csv2('household_power_consumption.txt', skip = 66636, nrows = 2880, stringsAsFactors=FALSE,
               col.names = c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3'))
hpc$Global_active_power<-as.numeric(hpc$Global_active_power)
hpc$datetime <- strptime(paste(hpc$Date,hpc$Time), format="%d/%m/%Y %H:%M:%S")

# plot sub metering on time frame
png('plot3.png', width = 480, height = 480, units = 'px')
plot(hpc$datetime, hpc$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(hpc$datetime, hpc$Sub_metering_2, col='red')
lines(hpc$datetime, hpc$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1,
       col = c('black', 'red', 'blue'))
dev.off()