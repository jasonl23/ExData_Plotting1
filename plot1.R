## read in the data from working directory

projectdata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)

## convert date formats

projectdata$Date <- as.Date(projectdata$Date, format="%d/%m/%Y")

## getting data from feb 1 and 2

df <- projectdata[(projectdata$Date=="2007-02-01") | (projectdata$Date=="2007-02-02"),]

## reformating active power variable

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

## histogram plot

hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

## output plot to png file

dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()






