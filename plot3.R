## read in data
projectdata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
## adjust date formats
projectdata$Date <- as.Date(projectdata$Date, format="%d/%m/%Y")
## get data for feb 1 and feb 2
df <- projectdata[(projectdata$Date=="2007-02-01") | (projectdata$Date=="2007-02-02"),]

## adjust date time formats

df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

## adjust variable formats

df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

## make plot

plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))


## output to png file

dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()