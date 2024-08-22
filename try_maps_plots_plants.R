ggplot(data=data_transplants%>%filter(year==2022&plot=="H04"),
       aes(x=x,y=y,color=temp,label=unique_id))+
  geom_point(size=4)+my_theme_legend()+
  geom_text_repel(min.segment.length=0,
                  max.overlaps=Inf)+coord_fixed()

ggplot(data=data_transplants%>%filter(year==2022&plot=="H05"),
       aes(x=x,y=y,color=temp,label=unique_id))+
  geom_point(size=4)+my_theme_legend()+
  geom_text_repel(min.segment.length=0,
                  max.overlaps=Inf)+coord_fixed()

ggplot(data=data_transplants%>%filter(year==2022&plot=="H08"),
       aes(x=x,y=y,color=temp,label=unique_id))+
  geom_point(size=4)+my_theme_legend()+
  geom_text_repel(min.segment.length=0,
                  max.overlaps=Inf)+coord_fixed()

ggplot(data=data_transplants%>%filter(year==2022&plot=="H09"),
       aes(x=x,y=y,color=temp,label=unique_id))+
  geom_point(size=4)+my_theme_legend()+
  geom_text_repel(min.segment.length=0,
                  max.overlaps=Inf)+coord_fixed()

ggplot(data=data_transplants%>%filter(year==2022&plot=="H10"),
       aes(x=x,y=y,color=temp,label=unique_id))+
  geom_point(size=4)+my_theme_legend()+
  geom_text_repel(min.segment.length=0,
                  max.overlaps=Inf)+coord_fixed()

ggplot(data=data_transplants%>%filter(year==2022&plot=="HC1"),
       aes(x=x,y=y,color=temp,label=unique_id))+
  geom_point(size=4)+my_theme_legend()+
  geom_text_repel(min.segment.length=0,
                  max.overlaps=Inf)+coord_fixed()

ggplot(data=data_transplants%>%filter(year==2022&plot=="HC4"),
       aes(x=x,y=y,color=temp,label=unique_id))+
  geom_point(size=4)+my_theme_legend()+
  geom_text_repel(min.segment.length=0,
                  max.overlaps=Inf)+coord_fixed()

ggplot(data=data_transplants%>%filter(year==2022&plot=="HC5"),
       aes(x=x,y=y,color=temp,label=unique_id))+
  geom_point(size=4)+my_theme_legend()+
  geom_text_repel(min.segment.length=0,
                  max.overlaps=Inf)+coord_fixed()
