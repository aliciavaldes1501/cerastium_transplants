# Fill with temp_diff or with mean_temp_parents?

ggplot(data=data_transplants%>%filter(year==2022&plot=="H04"&!is.na(temp)),
       aes(x=x,y=y,color=temp,fill=temp_diff,label=unique_id))+
  geom_point(size=3.5,shape=21,stroke=3)+my_theme_legend()+
  scale_color_distiller(palette="YlOrRd",direction=1,
                        limits=range(data_transplants$temp, na.rm = TRUE))+
  scale_fill_distiller(palette="RdYlBu",
                       limits=range(data_transplants$temp_diff, na.rm = TRUE))+
  coord_fixed()+theme(legend.position="top")+ggtitle("H04")+
  theme(plot.title = element_text(hjust = 0.01, vjust = -22))
ggsave(file="output/figures/map_H04.tiff", width=11,height=15,dpi=300,
       compression="lzw")

ggplot(data=data_transplants%>%filter(year==2022&plot=="H05"&!is.na(temp)),
       aes(x=x,y=y,color=temp,fill=temp_diff,label=unique_id))+
  geom_point(size=3.5,shape=21,stroke=3)+my_theme_legend()+
  scale_color_distiller(palette="YlOrRd",direction=1,
                        limits=range(data_transplants$temp, na.rm = TRUE))+
  scale_fill_distiller(palette="RdYlBu",
                       limits=range(data_transplants$temp_diff, na.rm = TRUE))+
  coord_fixed()+theme(legend.position="top")+ggtitle("H05")+
  theme(plot.title = element_text(hjust = 0.01, vjust = -22))

ggplot(data=data_transplants%>%filter(year==2022&plot=="H08"&!is.na(temp)),
       aes(x=x,y=y,color=temp,fill=temp_diff,label=unique_id))+
  geom_point(size=3.5,shape=21,stroke=3)+my_theme_legend()+
  scale_color_distiller(palette="YlOrRd",direction=1,
                        limits=range(data_transplants$temp, na.rm = TRUE))+
  scale_fill_distiller(palette="RdYlBu",
                       limits=range(data_transplants$temp_diff, na.rm = TRUE))+
  coord_fixed()+theme(legend.position="top")

ggplot(data=data_transplants%>%filter(year==2022&plot=="H09"&!is.na(temp)),
       aes(x=x,y=y,color=temp,fill=temp_diff,label=unique_id))+
  geom_point(size=3.5,shape=21,stroke=3)+my_theme_legend()+
  scale_color_distiller(palette="YlOrRd",direction=1,
                        limits=range(data_transplants$temp, na.rm = TRUE))+
  scale_fill_distiller(palette="RdYlBu",
                       limits=range(data_transplants$temp_diff, na.rm = TRUE))+
  coord_fixed()+theme(legend.position="top")

ggplot(data=data_transplants%>%filter(year==2022&plot=="H10"&!is.na(temp)),
       aes(x=x,y=y,color=temp,fill=temp_diff,label=unique_id))+
  geom_point(size=3.5,shape=21,stroke=3)+my_theme_legend()+
  scale_color_distiller(palette="YlOrRd",direction=1,
                        limits=range(data_transplants$temp, na.rm = TRUE))+
  scale_fill_distiller(palette="RdYlBu",
                       limits=range(data_transplants$temp_diff, na.rm = TRUE))+
  coord_fixed()+theme(legend.position="top")

ggplot(data=data_transplants%>%filter(year==2022&plot=="HC1"&!is.na(temp)),
       aes(x=x,y=y,color=temp,fill=temp_diff,label=unique_id))+
  geom_point(size=3.5,shape=21,stroke=3)+my_theme_legend()+
  scale_color_distiller(palette="YlOrRd",direction=1,
                        limits=range(data_transplants$temp, na.rm = TRUE))+
  scale_fill_distiller(palette="RdYlBu",
                       limits=range(data_transplants$temp_diff, na.rm = TRUE))+
  coord_fixed()+theme(legend.position="top")
ggsave(file="output/figures/map_HC1.tiff", width=11,height=15,dpi=300,
       compression="lzw")

ggplot(data=data_transplants%>%filter(year==2022&plot=="HC4"&!is.na(temp)),
       aes(x=x,y=y,color=temp,fill=temp_diff,label=unique_id))+
  geom_point(size=3.5,shape=21,stroke=3)+my_theme_legend()+
  scale_color_distiller(palette="YlOrRd",direction=1,
                        limits=range(data_transplants$temp, na.rm = TRUE))+
  scale_fill_distiller(palette="RdYlBu",
                       limits=range(data_transplants$temp_diff, na.rm = TRUE))+
  coord_fixed()+theme(legend.position="top")

ggplot(data=data_transplants%>%filter(year==2022&plot=="HC5"&!is.na(temp)),
       aes(x=x,y=y,color=temp,fill=temp_diff,label=unique_id))+
  geom_point(size=3.5,shape=21,stroke=3)+my_theme_legend()+
  scale_color_distiller(palette="YlOrRd",direction=1,
                        limits=range(data_transplants$temp, na.rm = TRUE))+
  scale_fill_distiller(palette="RdYlBu",
                       limits=range(data_transplants$temp_diff, na.rm = TRUE))+
  coord_fixed()+theme(legend.position="top")

#################################################################################

ggplot(data=data_transplants%>%filter(year==2022&!is.na(temp)),
       aes(x=x,y=y,color=temp,fill=temp_diff,label=unique_id))+
  geom_point(size=2,shape=21,stroke=2)+my_theme_legend()+
  scale_color_distiller(palette="YlOrRd",direction=1)+
  scale_fill_distiller(palette="RdYlBu")+
  theme(legend.position="top")+
  facet_wrap(~plot,ncol=4)+coord_fixed()
ggsave(file="output/figures/map_plots.tiff", width=11,height=15,dpi=300,
       compression="lzw")
