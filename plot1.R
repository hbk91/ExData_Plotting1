library(data.table)

path <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
destination <- '.\\data\\Week1\\data_project1.zip'
download.file(url=path, destfile=destination, method='curl')
unzip(zipfile=destination, exdir='.\\data\\Week1\\data_project1')

data <- fread('.\\data\\Week1\\data_project1\\household_power_consumption.txt', na.strings='?', data.table=FALSE)
data_small <- data[data$Date %in% c('1/2/2007','2/2/2007'),]
data_small$Date <- as.Date(data_small$Date, format='%d/%m/%Y')

png(filename='.\\Results\\plot1.png', width=480, height=480)
hist(data_small$Global_active_power, main='Global Active Power', xlab='Global Active Power(kilowatts)', col='red')
dev.off()
