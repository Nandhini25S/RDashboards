pas.to=read.csv(file="C:/Users/Nandhini Sivakumar/Downloads/pas_to_in.csv")
colnames(pas.to)<-c("region","2015-1","2015-2","2015-3","2015-4","2016-1","2016-2","2016-3","2016-4","2017-1","2017-2","2017-3","2017-4","2018-1","2018-2","2018-3","2018-4","2019-1")
rownames(pas.to)<-c("INDIAN","AFRICAN","EUROPEAN","GULF","NORTH AMERICAN","REST OF ASIA")
pas.to<-as.data.frame(pas.to)
pas.to<-pas.to[,-1]
#print(pas.to)

cs=colSums(pas.to)/100000
cst=ts(cs,start=1,frequency = 4)
#print(cst)
holt.w.cst=HoltWinters(cst)
plot(holt.w.cst)

rs=rowSums(pas.to)/100000

plot(cs,type="o",at=1:17,labels=c("2015-1","2015-2","2015-3","2015-4","2016-1","2016-2","2016-3","2016-4","2017-1","2017-2","2017-3","2017-4","2018-1","2018-2","2018-3","2018-4","2019-1"),ylab="PASSENGERS",xlab="QUARTERS",col="red")
title(main="PASSENGERS TO INDIA [2015(1)-2019(1)]",col.main="blue",font.main=10)

colours=c("#99FFFF","#33CCFF","#6699FF","#0066FF","#3399FF","#000066")
pie(rs,col=colours,lab=round(rs))
legend(1.7,0.5,c("INDIAN","AFRICAN","EUROPEAN","GULF","NORTH AMERICAN","REST OF ASIA"),cex=0.5,fill=colours)
title(main="TOTAL PASSENGERS CARRIED (BY REGIONS) 2015(1)-2019(1)] (in lakhs)")
