library(car)
library(carData)
library(CARS)
library(ggplot2)
library(multcomp)
library(cowplot)

subadult_code$Loc <- (subadult_code$'Location 2.0')
subadult_code$Loc
LO <-factor (subadult_code$Loc, levels = c("Cape Falcon", "Cascade Head", "Newport","Cape Perpetua","Redfish Rocks"))



juvenile_code$Loc2 <- (juvenile_code$`Location 2.0`)


ina1 = as.factor(subadult_code$Loc)
fit1<-glm(subadult_code$Pieces ~ ina1, data = subadult_code, family = poisson)
infct1 = mcp(ina1 = 'Tukey')
infct1
summary(glht(fit1, linfct = mcp (ina1= "Tukey")))
CISub <- summary(glht(fit1, linfct = mcp (ina1= "Tukey")))
confint(CISub)

summary(fit1)

ina2 = as.factor(juvenile_code$Loc2)
fit2<-glm(juvenile_code$Pieces ~ ina2, data = juvenile_code, family = poisson)
infct2 = mcp(ina2 = 'Tukey')
summary(glht(fit2, linfct = mcp (ina2= "Tukey")))
CIjuv <- summary(glht(fit2, linfct = mcp (ina2= "Tukey")))
confint(CIjuv)

summary(fit2)


subadult <- ggplot(subadult_code, aes(x=LO, y=Pieces,fill=LO)) +
  geom_boxplot(outlier.color="grey", alpha = 1.2) +
  scale_fill_manual(values = c("blue", "pink", "cornsilk", "grey", "coral1"))+
  labs(x= "Location", y= "Pieces per fish") +
  theme_classic() + 
  stat_summary(fun=mean, geom="point", shape=20, size=4, color="black", fill="black")+ # this pts means on graph
  theme(legend.position="none")
  
subadult2 <-subadult + geom_hline(yintercept=5, linetype="dashed", color = "purple")
plot2 <-subadult2 
plot(plot2)



juvenile <- ggplot(juvenile_code, aes(x=Loc2, y=Pieces, fill=Loc2)) +
  geom_boxplot(outlier.color="grey" , alpha =2.0) + 
  labs(x= "Location", y= "Pieces per fish") +
  theme_classic() + 
  stat_summary(fun=mean, geom="point", shape=20, size=4, color="black", fill="white")+ # this pts means on graph
  theme(legend.position="none")

juvenile2 <-juvenile + geom_hline(yintercept=1.82, linetype="dashed", color = "purple")
plot3 <- (juvenile2 + scale_fill_grey())
plot (plot3)



plot_grid(plot2, plot3, labels = c("A", "B"), ncol = 1, nrow =2)




