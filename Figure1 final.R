##### Map with all stations, stations done, and labels
library(mapdata)
library(mapplots)
library(maptools)


KAT<-read.csv('Locations2.csv',header=T )

windows()
## this plots the coastline as darkgrey and the "water" as lightblue if you want to change them
plot(1,1,ylim=range(KAT$Lat),
     xlim=range(KAT$Long),
     ylab=expression(paste("Latitude ("^0,'N)')),
     xlab=expression(paste("Longitude ("^0,'W)')),
     rect(par("usr")[1],par("usr")[3],par("usr")[2],par("usr")[4],col = "lightblue"))
map("worldHires",fill=T,col="darkgrey",interior= T, add=T)
map.scale(x=-124.6, y=45.5 ,relwidth = 0.15, metric = TRUE, ratio = TRUE)



points(KAT$Long5, KAT$Lat5, pch = 22, col = "black", bg = "cyan", cex=2)
points(KAT$Long7, KAT$Lat7, pch = 22, col = "black", bg = "orange", cex=1.5)
points(KAT$Long8, KAT$Lat8, pch = 21, col = "black", bg = "black", cex=2)
points(KAT$Long1, KAT$Lat1, pch = 24, col = "black", bg = "purple", cex=1)
points(KAT$Long2, KAT$Lat2, pch = 24, col = "black", bg = "pink", cex=1)
points(KAT$Long3, KAT$Lat3, pch = 24, col = "black", bg = "blue", cex=1)
points(KAT$Long4, KAT$Lat4, pch = 24, col = "black", bg = "azure", cex=1)
points(KAT$Long6, KAT$Lat6, pch = 22, col = "black", bg = "yellow", cex=1)
lines(KAT$Long6, KAT$Lat6, col = "yellow")
legend("bottomright",legend=c("Cape Falcon Fish", "Cascade Head Fish","Cape Perpetua Fish","Redfish Rocks Fish", "Reserves", "Charter range", "Newport", "Cape Foulweather"),
        pt.bg = c("purple", "pink", "blue", "azure", "cyan", "yellow","orange", "black"), cex=1, pch=c(24,24, 24, 24, 22, 22, 22, 21))











