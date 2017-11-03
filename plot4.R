
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


## create a new column with date time

consumption_feb_1_2_dt<-mutate(consumption_feb_1_2, Date_Time = as.character.POSIXt(paste(consumption_feb_1_2$Date ,
                                                                                          consumption_feb_1_2$Time),  
                                                                                    format="%Y-%m-%d %H:%M:%S") ) 


## closes and cleans screen device
##dev.off()

## creates the plot. First open png screen device

png(filename="plot4.png", width = 480, height=480)


## set the frame 2x2 for the 4 plots

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


## creates plot for plot 1

## plot 1

with(consumption_feb_1_2_dt, plot( as.POSIXct(Date_Time, "%Y-%m-%d %H:%M:%S") , 
                                   Global_active_power, type="l",
                                   ylab="Global Active Power (kilowatts)", xlab=""))


## creates plot for plot 2

with(consumption_feb_1_2_dt, plot( as.POSIXct(Date_Time, "%Y-%m-%d %H:%M:%S") , 
                                    Voltage, type="l",
                                   ylab="Voltage", xlab="datetime"))


## plot 2


## creates plot for plot 3




## create the plot with sub_metering_1

with(consumption_feb_1_2_dt, plot( as.POSIXct(Date_Time, "%Y-%m-%d %H:%M:%S") , 
                                   Sub_metering_1, type="l",
                                   ylab="Global Active Power (kilowatts)", xlab=""))


## add line to the plot with lines for sub_metering_2

with(consumption_feb_1_2_dt, lines( as.POSIXct(Date_Time, "%Y-%m-%d %H:%M:%S") , 
                                    Sub_metering_2, type="l",
                                    ylab="Global Active Power (kilowatts)", xlab="", col="red"))

## add line to the plot with lines for sub_metering_3

with(consumption_feb_1_2_dt, lines( as.POSIXct(Date_Time, "%Y-%m-%d %H:%M:%S") , 
                                    Sub_metering_3, type="l",
                                    ylab="Global Active Power (kilowatts)", xlab="", col="blue"))

## legend

legend("topright", pch="-----", col=c("black","red","blue"), legend=c("Sub metering 1","Sub metering 2","Sub metering 3"))

## Closes screen device to write to the file

## plot 3



## creates plot for 4

with(consumption_feb_1_2_dt, plot( as.POSIXct(Date_Time, "%Y-%m-%d %H:%M:%S") , 
                                    Global_reactive_power, type="l",
                                   ylab="Global Reactive Power (kilowatts)", xlab="datetime"))

## plot 4

dev.off()




