library(data.table)

path <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
destination <- '.\\data\\Week1\\data_project1.zip'
download.file(url=path, destfile=destination, method='curl')
unzip(zipfile=destination, exdir='.\\data\\Week1\\data_project1')
data <- fread('.\\data\\Week1\\data_project1\\household_power_consumption.txt', na.strings='?', data.table=FALSE)

data_small <- data[data$Date %in% c('1/2/2007','2/2/2007'),]
data_small$DateTime <- strptime(paste(data_small$Date, data_small$Time, sep='-'), format='%d/%m/%Y-%H:%M:%S')

png(filename='.\\Results\\plot3.png', width=480, height=480)
plot.default(x=data_small$DateTime, y=data_small$Sub_metering_1, type='l', col='gray', ylab='Energy Sub metering', xlab='')
lines(x=data_small$DateTime, y=data_small$Sub_metering_2, col='red')
lines(x=data_small$DateTime, y=data_small$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('gray', 'red', 'blue'), lty=c(1,1,1))
dev.off()


