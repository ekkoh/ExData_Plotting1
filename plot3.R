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
# Plot the 3 graphs and save to png file
#

png('plot3.png', width=480, height=480)

plot(dt,data$Sub_metering_1, type='l',xlab='', ylab='Energy sub metering')
lines(dt,data$Sub_metering_2, col='red')
lines(dt,data$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=1)
dev.off()
