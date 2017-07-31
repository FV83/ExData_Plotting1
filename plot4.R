# load data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="./rawData.zip")
df <- read.table(unz("rawData.zip", "household_power_consumption.txt"),
                 header = T, sep=";", na.strings = "?")

# arrange data
df2 <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df2$DateTime <- strptime(paste0(df2$Date,df2$Time),"%d/%m/%Y %H:%M:%S")

# create graph
par(mfrow=c(2,2))
#1
plot(df2$DateTime,df2$Global_active_power, xlab="", type="line", ylab = "Global Active Power")
#2
plot(df2$DateTime,df2$Voltage, xlab="datetime", type="line", ylab = "Voltage")
#3
plot(df2$DateTime,df2$Sub_metering_1, type="n",xlab = "",ylab="Energy sub metering")
lines(df2$DateTime,df2$Sub_metering_1, col="black")
lines(df2$DateTime,df2$Sub_metering_2, col="red")
lines(df2$DateTime,df2$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")
#4
plot(df2$DateTime,df2$Global_reactive_power, xlab="datetime", type="line", ylab = "Global_reactive_power")


# save graph
dev.copy(device = png, filename = 'plot4.png', width = 480, height = 480)
dev.off()
