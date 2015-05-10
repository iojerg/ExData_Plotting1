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



g <- gl(3,dim(data)[1])
x <- rep(data$Date.Time,3)
y <- c(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3)
png("plot3.png",width=480,height=480)
plot(x,y,type="n",xlab="",ylab="Energy sub metering")
points(x[g==1],y[g==1],col="black",type="l")
points(x[g==2],y[g==2],col="red",type="l")
points(x[g==3],y[g==3],col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col=c("black","red","blue"),lwd=1)
dev.off()
