library(dplyr)
data <- read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE)
data$Time <- paste(data$Date, data$Time)
data$Time <- as.POSIXct(strptime(data$Time, format = "%d/%m/%Y %H:%M:%S"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub <- data %>% filter(Date == '2007-02-01' | Date == '2007-02-02')
png('plot3.png')
with(sub, plot(Time, as.numeric(Sub_metering_1), type = 'n', 
               xlab = '', ylab = 'Energy sub metering'))
lines(sub$Time, as.numeric(sub$Sub_metering_1))
lines(sub$Time, as.numeric(sub$Sub_metering_2), col = 'red')
lines(sub$Time, as.numeric(sub$Sub_metering_3), col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'))

dev.off()
