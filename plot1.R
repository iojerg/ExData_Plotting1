##Read the dataset
require(lubridate)

set <- read.csv("household_power_consumption.txt",sep=";",header=TRUE)

##set$Date <- as.Date(set$Date,format="%d/%m/%Y")
##set$Time <- as.Date(set$Time,format="%H:%M:%S")
set$Date.Time <- strptime(paste(set$Date,set$Time),format="%d/%m/%Y %H:%M:%S")
set$Date <- as.Date(set$Date,format="%d/%m/%Y")
d1 <- set[set$Date=="2007-02-01",]
d2 <- set[set$Date=="2007-02-02",]
data <- rbind(d1,d2)
for (i in 3:9){
  data[,i] <- as.numeric(as.character(data[,i]))
}

##Plot1
png("plot1.png",width=480,height=480)
hist(data$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
