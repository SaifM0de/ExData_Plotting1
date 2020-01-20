library(dplyr)
data <- read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub <- data %>% filter(Date == '2007-02-01' | Date == '2007-02-02')
png('plot1.png')
with(sub, hist(as.numeric(Global_active_power), col = 'red', xlab = 'Global Active Power (kilowatts)', 
               main = 'Global Active Power'))
dev.off()
