library(tidyverse)

mydata<-read.csv("vgSales(Cleaned).csv")
mydata
#mydata<-filter(mydata,Year!="N/A")
#mydata<-filter(mydata,Publisher!="N/A" ||"Unknown")
library(ggplot2)
library(dplyr)
mydata<-mutate(mydata, Year_Group=NA)

a<-c('1980','1981','1982','1983','1984', '1985', '1986', '1987', '1988', '1989')
b<-c('1990','1991','1992','1993','1994', '1995', '1996', '1997', '1998', '1999')
c<-c('2000','2001','2002','2003','2004', '2005', '2006', '2007', '2008', '2009')
d<-c('2010','2011','2012','2013','2014', '2015', '2016', '2017', '2018', '2019')
e<-c('2020')

#a<-mydata[c(`Year` >= '1980' & `Year` <= '1989')]

#a<-c(mydata$Year >= '1980' & mydata$Year <='1989')
#b<-c('mydata$Year >= 1990 & mydata$Year <=1999')
#c<-c('mydata$Year >= 2000 & mydata$Year <= 2009')
#d<-c('mydata$Year >= 2010 & mydata$Year <= 2019')
#e<-c('mydata$Year >= 2020')

mydata$Year<-as.character(as.numeric(mydata$Year))

#mydata$yeargroup <- ifelse(mydata$Year %in% a, "a")
mydata$Year_Group<-ifelse(mydata$Year %in% a,"1980-1989",ifelse(mydata$Year %in% b,"1990-1999",ifelse(mydata$Year %in% c,"2000-2009",ifelse(mydata$Year %in% d,"2010-2019",ifelse(mydata$Year %in% e,"2020", "Unknown")))))

bp<-ggplot(mydata,aes(x=Year_Group,y=Global_Sales,fill=Year_Group))+geom_boxplot()
bp
bp+ylim(0,5)+labs(fill="Year Group")+ggtitle("Global Sales By Year Group") 

