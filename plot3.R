## check and set working directory 

getwd()
setwd("C:/Users/Yongju/Documents/R/Practice")

## load the data
data<-read.table("household_power_consumption.txt",skip=1,sep=";")

## check and change variable names
names(data)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(data)

## quick review for data and convert the date variable to Date class
str(data)
head(data)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")


## subset the data according to an instruction

new_data <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
table(new_data$Date) ## check Date variable of new_data
str(new_data)

new_data$Time <- strptime(paste(new_data$Date, new_data$Time), "%Y-%m-%d %H:%M:%S")


## calling the basic plot function

plot(new_data$Time,new_data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(new_data,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(new_data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(new_data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.7)



#copying to png
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
