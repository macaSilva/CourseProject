#Plot1

test <- read.table("/Users/Maca/Downloads/household_power_consumption.txt", sep=";", header = T)
dim(test)
head(test)
test$GAP <- as.numeric(as.character(test$Global_active_power))
png("Plot1.png")
hist(test$GAP, xlab = "Global Active Power (kilowatts)", main=( "Global Active Power"), col="red")
dev.off()
