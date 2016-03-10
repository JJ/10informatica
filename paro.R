library("ggplot2")
library("ggthemes")

tasas <- read.csv("tasas-empleo-por-carrera-top20.csv",sep=";")
tasas$Carrera = factor(tasas$Carrera)
tasas$Paro = 100-as.numeric(tasas$Trabajando)
tasas$IT <- grepl("Informática",tasas$Carrera)
ggplot(tasas,aes(x=reorder(Carrera,Paro),y=Paro,fill=IT))+geom_bar(stat='identity') + theme_economist() + scale_colour_economist() +theme(axis.text.x = element_text(angle = 90, hjust = 1),axis.text = element_text( size = 14, family = "Times"))+ scale_x_discrete(name="")
