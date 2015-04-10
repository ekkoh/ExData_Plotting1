#
# Read the data
#

tmp<-read.csv('household_power_consumption.txt',header=TRUE,sep=';',nrows=1)
data<-read.csv('household_power_consumption.txt', header=FALSE, sep=';', na.string='?', skip=66637, nrows=2880)
colnames(data)<-colnames(tmp)
rm(tmp)

dt<-paste(data$Date, data$Time, sep=' ')
dt<-strptime(dt, "%d/%m/%Y %H:%M:%S")

#
# Plot 4 graphs on the same page
#

png('plot4.png', width=480, height=480)
par(mfcol=c(2,2))

par(mfg=c(1,1))
plot(dt,data$Global_active_power, type='l', xlab='', ylab='Global Active Power')

par(mfg=c(2,1))
plot(dt,data$Sub_metering_1, type='l',xlab='', ylab='Energy sub metering')
lines(dt,data$Sub_metering_2, col='red')
lines(dt,data$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), bty='n', lty=1)

par(mfg=c(1,2))
plot(dt,data$Voltage,xlab="date/time",ylab='Voltage', type='l', lwd=1)

par(mfg=c(2,2))
plot(dt, data$Global_reactive_power, type='l', lwd=1, xlab='date/time', ylab='Global_reactive_power')
dev.off()
