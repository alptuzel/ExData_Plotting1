
## read data with proper column classes
consumption_data_3 <- read.table(unz("consumption.zip", "household_power_consumption.txt"),
                                 header=T, sep=";", na.strings="?",
                                 colClasses = c("character","character", "numeric",
                                                "numeric", "numeric",
                                                "numeric", "numeric","numeric", "numeric"))

# convert date column
consumption_data_3$Date <- dmy(consumption_data_3$Date)

## filter data for only 2 days in february
consumption_feb_1_2 <- filter(consumption_data_3, Date==dmy("01-02-2007") | Date==dmy("02-02-2007"))

## closes and cleans screen device
##dev.off()

## creates the plot. First open png screen device

png(filename="plot1.png", width = 480, height=480)

with(consumption_feb_1_2, hist(Global_active_power, col="red", 
                               xlab = "Global Active Power (kilowatts)" ,
                               main="Global Active Power"))

## Closes screen device to write to the file

dev.off()




