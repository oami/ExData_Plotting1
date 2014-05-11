## plot1.R

plot1 <- function(){
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
    ## creating PNG and plotting a histogram
    png("plot1.png",width=480,height=480)
    hist(wdata$Global_active_power,col="red",
         xlab="Global Active Power (kilowatts)",
         main="Global Active Power")
    dev.off()
}
