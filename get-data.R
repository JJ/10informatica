library("ggplot2")
library("htmltab")
library("ggthemes")

url = "https://es.wikipedia.org/wiki/Wikipedia:Encuentros/Open_Education_Weekipedia"

ediciones <- htmltab(doc = url, which = "//th[text() = 'Tam. inic.']/ancestor::table")
names( ediciones ) = c("Articulo","TamInic","Ediciones","TamGanado","Ganado100","Editores","TamFinal","TamOtros")
ediciones$TamGanado = as.integer(ediciones$TamGanado)
ediciones$Editores = as.integer(ediciones$Editores)
ediciones$Ediciones = as.integer(ediciones$Ediciones)
editados = ediciones[ediciones$TamGanado > 0,]
ggplot(editados,aes(x=reorder(Articulo,-TamGanado),y=TamGanado,size=Ediciones,color=Editores))+geom_point() + theme_economist() + scale_colour_economist() +theme(axis.text.x = element_text(angle = 90, hjust = 1),axis.text = element_text( size = 20, family = "Times"))
