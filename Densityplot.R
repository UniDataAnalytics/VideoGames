library(tidyverse)

mydata<-read.csv("vgSales(Cleaned).csv")
mydata
library(ggplot2)
library(dplyr)
mydata<-mutate(mydata, Year_Group=NA)

#dp<-ggplot(mydata,aes(x=NA_Sales))+geom_density(color="darkblue",fill="lightblue")+stat_density(adjust=1)
#dpnormal<-ggplot(mydata,aes(x=NA_Sales))+geom_density()+stat_density(bw=1)
dpnormal<-ggplot(mydata,aes(x=NA_Sales))+geom_density(color="darkblue",fill="lightblue",bw=1)#change the bw for the bandwidth
#dp+xlim(0,10)+ylim(0,2)
dpnormal+scale_x_continuous(trans = 'log10')+ggtitle("Density For Global Sales") 
#change x axis in algorithm scale

