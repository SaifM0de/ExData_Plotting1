library(dplyr)
data <- read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE)
data$Time <- paste(data$Date, data$Time)
data$Time <- as.POSIXct(strptime(data$Time, format = "%d/%m/%Y %H:%M:%S"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub <- data %>% filter(Date == '2007-02-01' | Date == '2007-02-02')

png('plot4.png')
par(mfcol= c(2,2))
#plot 1
with(sub, plot(Time, as.numeric(Global_active_power), type = 'n', 
               xlab = '', ylab = 'Global Active Power'))
lines(sub$Time, as.numeric(sub$Global_active_power))

#plot 2
with(sub, plot(Time, as.numeric(Sub_metering_1), type = 'n', 
               xlab = '', ylab = 'Energy sub metering'))
lines(sub$Time, as.numeric(sub$Sub_metering_1))
lines(sub$Time, as.numeric(sub$Sub_metering_2), col = 'red')
lines(sub$Time, as.numeric(sub$Sub_metering_3), col = 'blue')
legend('topright', lty = 1, bty = 'n', col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'))

#plot 3
with(sub, plot(Time, as.numeric(Voltage), type = 'l', 
               xlab = 'datetime', ylab = 'Voltage'))

#plot 4
with(sub, plot(Time, as.numeric(Global_reactive_power), type = 'l', 
               xlab = 'datetime', ylab = 'Global_reactive_power'))
dev.off()
