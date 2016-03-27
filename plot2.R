## read in data

projectdata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)

## adjust date formats

projectdata$Date <- as.Date(projectdata$Date, format="%d/%m/%Y")

## get data for feb 1 and feb 2

df <- projectdata[(projectdata$Date=="2007-02-01") | (projectdata$Date=="2007-02-02"),]

## change format of active power

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

## adjust date time format

df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

## make plot

plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
      
## output to png file

  dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()


