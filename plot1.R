#
# Read the data
#

tmp<-read.csv('household_power_consumption.txt',header=TRUE,sep=';',nrows=1)
data<-read.csv('household_power_consumption.txt', header=FALSE, sep=';', na.string='?', skip=66637, nrows=2880)
colnames(data)<-colnames(tmp)
rm(tmp)

#
# Plot the graph and save to png file
#

png('plot1.png', width=480, height=480)
hist(data$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red1')
dev.off()
