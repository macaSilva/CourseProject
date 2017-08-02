#Plot3
t <- read.table("/Users/Maca/Downloads/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
t$Date <- as.Date(t$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
t <- t[complete.cases(t),]

## Combine Date and Time column
dateTime <- paste(t$Date, t$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
t <- t[ ,!(names(t) %in% c("Date","Time"))]

## Add DateTime column
t <- cbind(dateTime, t)

## Format dateTime Column
t$dateTime <- as.POSIXct(dateTime)

png("Plot3.png")
plot(t$dateTime,t$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(t$dateTime,t$Sub_metering_2, type="l", col="red")
lines(t$dateTime,t$Sub_metering_3, type = "l", col="blue")
legend( "topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col=c("black","red", "blue"), lty=1:2, cex=0.8)
dev.off()