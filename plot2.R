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
# Plot the graph and save to png file
#

png('plot2.png', width=480, height=480)
plot(dt,data$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()
