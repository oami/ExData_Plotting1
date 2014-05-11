## plot3.R

plot3 <- function(){
    ## reading data from csv format with delimiter ";" and NA's="?"
    hpc=read.csv('household_power_consumption.txt',head=T,
                 sep=";",na.strings="?",
                 colClasses=c("character","character",rep("numeric",7)))
    ## converting dates and time
    rd=strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
    hpc$Date=as.Date(rd)
    hpc$Time=rd
    ## subsetting data
    ind=which(hpc$Date>=as.Date("2007-02-01"))
    ind2=which(hpc$Date<=as.Date("2007-02-02"))
    indx=intersect(ind,ind2)
    wdata=hpc[indx,]
    ## creating PNG and creating a plot
    ## locale setting to display English days of week
    Sys.setlocale("LC_ALL", "en_US.utf8")
    png("plot3.png",width=480,height=480)
    plot(wdata$Time,wdata$Sub_metering_1,type='l',xlab="",
         ylab="Energy sub metering")
    lines(wdata$Time,wdata$Sub_metering_2,col="red")
    lines(wdata$Time,wdata$Sub_metering_3,col="blue")
    legend("topright",
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"),lty=c(1,1,1))
    dev.off()
}
