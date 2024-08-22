plot1<-ggarrange(
  ggplot()+
    geom_point(data=data_transplants,aes(x=temp,y=surv,color=year))+
    geom_ribbon(data=ggpredict(mod_surv_22,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_surv_22,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_surv_23,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_surv_23,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1)+
    my_theme_legend()+xlab("Temperature at planting site (ºC)")+
    ylab("Probability of survival"),
  ggplot()+
    geom_point(data=data_transplants,aes(x=temp_diff,y=surv,color=year))+
    geom_ribbon(data=ggpredict(mod_surv_22,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_surv_22,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1,linetype="dashed")+
    geom_ribbon(data=ggpredict(mod_surv_23,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_surv_23,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1)+
    my_theme_legend()+xlab("Temperature difference (ºC)")+
    ylab("Probability of survival"),
  ggplot() + 
    theme_void() + 
    theme(panel.background = element_blank()),
  ggplot() + 
    theme_void() + 
    theme(panel.background = element_blank()),
  ggplot() + 
    theme_void() + 
    theme(panel.background = element_blank()),
  ggplot()+
    geom_jitter(data=data_transplants%>%filter(year==2023),
                aes(x=poll_type,y=median_h),width=0.05,alpha=0.1)+
    geom_point(data=ggpredict(mod_median_h_23_pollf,terms=c("poll_type")),
               aes(x=x,y=predicted),size=3)+
    geom_errorbar(data=ggpredict(mod_median_h_23_pollf,terms=c("poll_type")),
                  aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),width=0.1)+
    my_theme()+xlab("Pollination type")+ylab("Median height")+ggtitle("2023"),
  ggplot()+
    geom_point(data=data_transplants,aes(x=temp,y=flowering,color=year))+
    geom_ribbon(data=ggpredict(mod_flowering_22_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_flowering_22_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_flowering_23_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_flowering_23_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1)+
    my_theme_legend()+xlab("Temperature at planting site (ºC)")+
    ylab("Probability of flowering"),
  ggplot() + 
    theme_void() + 
    theme(panel.background = element_blank()),
  grid.arrange(
    ggplot()+
      geom_jitter(data=data_transplants%>%filter(year==2022),
                  aes(x=poll_type,y=flowering),width=0.05,alpha=0.1)+
      geom_point(data=ggpredict(mod_flowering_22_pollf,terms=c("poll_type[all]")),
                 aes(x=x,y=predicted),size=3)+
      geom_errorbar(data=ggpredict(mod_flowering_22_pollf,terms=c("poll_type[all]")),
                    aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                    width=0.1)+
      my_theme()+xlab("Pollination type")+ylab("Probability of flowering")+
      ggtitle("2022"),
    ggplot()+
      geom_jitter(data=data_transplants%>%filter(year==2023),
                  aes(x=poll_type,y=flowering),width=0.05,alpha=0.1)+
      geom_point(data=ggpredict(mod_flowering_23_pollf,terms=c("poll_type[all]")),
                 aes(x=x,y=predicted),size=3)+
      geom_errorbar(data=ggpredict(mod_flowering_23_pollf,terms=c("poll_type[all]")),
                    aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                    width=0.1)+
      my_theme()+xlab("Pollination type")+ylab("Probability of flowering")+
      ggtitle("2023"),
    ncol=2),
  ncol=3,nrow=3
)
ggsave(filename="output/figures/plot1.tiff",plot=plot1,device="tiff",width=40,height=30,units="cm",dpi=300)

plot2<-ggarrange(
  ggplot()+
    #geom_point(data=data_transplants,aes(x=temp,y=tot_fl_bodies_corr,color=year))+
    geom_ribbon(data=ggpredict(mod_nfl_22_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfl_22_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_nfl_23_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfl_23_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1,linetype="dashed")+
    my_theme_legend()+xlab("Temperature at planting site (ºC)")+
    ylab("Total number of flowers"),
  ggplot()+
    #geom_point(data=data_transplants,aes(x=temp_diff,y=tot_fl_bodies_corr,color=year))+
    geom_ribbon(data=ggpredict(mod_nfl_22_pollf,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfl_22_pollf,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_nfl_23_pollf,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfl_23_pollf,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1)+
    my_theme_legend()+xlab("Temperature difference (ºC)")+
    ylab("Total number of flowers"),
  grid.arrange(
    ggplot()+
      #geom_jitter(data=data_transplants%>%filter(year==2022),
      #            aes(x=poll_type,y=tot_fl_bodies_corr),width=0.05,alpha=0.1)+
      geom_point(data=ggpredict(mod_nfl_22_pollf,terms=c("poll_type[all]")),
                 aes(x=x,y=predicted),size=3)+
      geom_errorbar(data=ggpredict(mod_nfl_22_pollf,terms=c("poll_type[all]")),
                    aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                    width=0.1)+
      my_theme_legend()+xlab("Pollination type")+ylab("Total number of flowers")+
      ggtitle("2022"),
    ggplot()+
      #geom_jitter(data=data_transplants%>%filter(year==2023),
      #            aes(x=poll_type,y=tot_fl_bodies_corr),width=0.05,alpha=0.1)+
      geom_point(data=ggpredict(mod_nfl_23_pollf,terms=c("poll_type[all]")),
                 aes(x=x,y=predicted),size=3)+
      geom_errorbar(data=ggpredict(mod_nfl_23_pollf,terms=c("poll_type[all]")),
                    aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                    width=0.1)+
      my_theme_legend()+xlab("Pollination type")+ylab("Total number of flowers")+
      ggtitle("2023"),
    ncol=2),
  ggplot()+
    #geom_point(data=data_transplants,aes(x=temp,y=tot_fl_bodies_corr,color=year))+
    geom_ribbon(data=ggpredict(mod_nfl_22_mh_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfl_22_mh_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_nfl_23_mh_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfl_23_mh_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1,linetype="dashed")+
    my_theme_legend()+xlab("Temperature at planting site (ºC)")+
    ylab("Total number of flowers"),
  ggplot()+
    #geom_point(data=data_transplants,aes(x=temp_diff,y=tot_fl_bodies_corr,color=year))+
    geom_ribbon(data=ggpredict(mod_nfl_22_mh_pollf,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfl_22_mh_pollf,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_nfl_23_mh_pollf,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfl_23_mh_pollf,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1)+
    my_theme_legend()+xlab("Temperature difference (ºC)")+
    ylab("Total number of flowers"),
  grid.arrange(
    ggplot()+
      #geom_jitter(data=data_transplants%>%filter(year==2022),
      #            aes(x=poll_type,y=tot_fl_bodies_corr),width=0.05,alpha=0.1)+
      geom_point(data=ggpredict(mod_nfl_22_mh_pollf,terms=c("poll_type[all]")),
                 aes(x=x,y=predicted),size=3)+
      geom_errorbar(data=ggpredict(mod_nfl_22_mh_pollf,terms=c("poll_type[all]")),
                    aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                    width=0.1)+
      my_theme()+xlab("Pollination type")+ylab("Total number of flowers")+
      ggtitle("2022"),
    ggplot()+
      #geom_jitter(data=data_transplants%>%filter(year==2023),
      #            aes(x=poll_type,y=tot_fl_bodies_corr),width=0.05,alpha=0.1)+
      geom_point(data=ggpredict(mod_nfl_23_mh_pollf,terms=c("poll_type[all]")),
                 aes(x=x,y=predicted),size=3)+
      geom_errorbar(data=ggpredict(mod_nfl_23_mh_pollf,terms=c("poll_type[all]")),
                    aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                    width=0.1)+
      my_theme()+xlab("Pollination type")+ylab("Total number of flowers")+
      ggtitle("2023"),
    ncol=2),
  ggplot()+
    geom_point(data=data_transplants,aes(x=temp,y=fruiting,color=year))+
    geom_ribbon(data=ggpredict(mod_fruiting_22,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_fruiting_22,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_fruiting_23,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_fruiting_23,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1,linetype="dashed")+
    my_theme_legend()+xlab("Temperature at planting site (ºC)")+
    ylab("Probability of fruting"),
  ggplot()+
    geom_point(data=data_transplants,aes(x=temp_diff,y=fruiting,color=year))+
    geom_ribbon(data=ggpredict(mod_fruiting_22,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_fruiting_22,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_fruiting_23,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_fruiting_23,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1,linetype="dashed")+
    my_theme_legend()+xlab("Temperature difference (ºC)")+
    ylab("Probability of fruting"),
  ggplot() + 
    theme_void() + 
    theme(panel.background = element_blank()),
  ncol=3,nrow=3
)
ggsave(filename="output/figures/plot2.tiff",plot=plot2,device="tiff",width=40,height=30,units="cm",dpi=300)

plot3<-ggarrange(
  ggplot()+
    #geom_point(data=data_transplants,aes(x=temp,y=n_tot_fr,color=year))+
    geom_ribbon(data=ggpredict(mod_nfr_22_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfr_22_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_nfr_23_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfr_23_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1,linetype="dashed")+
    my_theme_legend()+xlab("Temperature at planting site (ºC)")+
    ylab("Total number of fruits"),
  ggplot()+
    #geom_point(data=data_transplants,aes(x=temp_diff,y=n_tot_fr,color=year))+
    geom_ribbon(data=ggpredict(mod_nfr_22_pollf,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfr_22_pollf,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_nfr_23_pollf,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_nfr_23_pollf,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1)+
    my_theme_legend()+xlab("Temperature difference (ºC)")+
    ylab("Total number of fruits"),
  grid.arrange(
    ggplot()+
      #    geom_jitter(data=data_transplants%>%filter(year==2022),
      #                aes(x=poll_type,y=n_tot_fr),width=0.05,alpha=0.1)+
      geom_point(data=ggpredict(mod_nfr_22_pollf,terms=c("poll_type[all]")),
                 aes(x=x,y=predicted),size=3)+
      geom_errorbar(data=ggpredict(mod_nfr_22_pollf,terms=c("poll_type[all]")),
                    aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                    width=0.1)+
      my_theme()+xlab("Pollination type")+ylab("Total number of fruits")+
      ggtitle("2022"),
    ggplot()+
      #    geom_jitter(data=data_transplants%>%filter(year==2023),
      #                aes(x=poll_type,y=n_tot_fr),width=0.05,alpha=0.1)+
      geom_point(data=ggpredict(mod_nfr_23_pollf,terms=c("poll_type")),
                 aes(x=x,y=predicted),size=3)+
      geom_errorbar(data=ggpredict(mod_nfr_23_pollf,terms=c("poll_type")),
                    aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                    width=0.1)+
      my_theme()+xlab("Pollination type")+ylab("Total number of fruits")+
      ggtitle("2023"),
    ncol=2),
  ggplot()+
    geom_point(data=data_transplants,aes(x=temp,y=fr_set,color=year))+
    geom_ribbon(data=ggpredict(mod_frset_22_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_frset_22_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_frset_23,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_frset_23,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1)+
    my_theme_legend()+xlab("Temperature at planting site (ºC)")+
    ylab("Fruit set"),
  ggplot()+
    geom_point(data=data_transplants,aes(x=temp_diff,y=fr_set,color=year))+
    geom_ribbon(data=ggpredict(mod_frset_22_pollf,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_frset_22_pollf,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_frset_23,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_frset_23,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1)+
    my_theme_legend()+xlab("Temperature difference (ºC)")+
    ylab("Fruit set"),
  ggplot()+
    #geom_jitter(data=data_transplants%>%filter(year==2022),
    #            aes(x=poll_type,y=fr_set),width=0.05,alpha=0.1)+ 
    geom_point(data=ggpredict(mod_frset_22_pollf,terms=c("poll_type[all]")),
               aes(x=x,y=predicted),size=3)+
    geom_errorbar(data=ggpredict(mod_frset_22_pollf,terms=c("poll_type[all]")),
                  aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),width=0.1)+
    my_theme()+xlab("Pollination type")+ylab("Fruit set")+ggtitle("2022"),
  ggplot()+
    geom_point(data=data_transplants,aes(x=temp,y=n_tot_seed,color=year))+
    geom_ribbon(data=ggpredict(mod_nseed_22_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_nseed_22_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_nseed_23_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_nseed_23_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1,linetype="dashed")+
    my_theme_legend()+xlab("Temperature at planting site (ºC)")+
    ylab("Total number of seeds"),
  ggplot()+
    geom_point(data=data_transplants,aes(x=temp_diff,y=n_tot_seed,color=year))+
    geom_ribbon(data=ggpredict(mod_nseed_22_pollf,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_nseed_22_pollf,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_nseed_23_pollf,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_nseed_23_pollf,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1,linetype="dashed")+
    my_theme_legend()+xlab("Temperature difference (ºC)")+
    ylab("Total number of seeds"),
  ggplot()+
    geom_point(data=ggpredict(mod_nseed_22_pollf,terms=c("poll_type[all]")),
               aes(x=x,y=predicted),size=3)+
    geom_errorbar(data=ggpredict(mod_nseed_22_pollf,terms=c("poll_type[all]")),
                  aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),width=0.1)+ 
    my_theme()+xlab("Pollination type")+ylab("Total number of seeds")+
    ggtitle("2022"),
  ncol=3,nrow=3
)

ggsave(filename="output/figures/plot3.tiff",plot=plot3,device="tiff",width=40,height=30,units="cm",dpi=300)

plot4<-ggarrange(
  ggplot()+
    geom_point(data=data_transplants,aes(x=temp,y=n_seeds_per_fl,color=year))+
    geom_ribbon(data=ggpredict(mod_seedsperfl_22_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_seedsperfl_22_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_seedsperfl_23_pollf,terms=c("temp[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_seedsperfl_23_pollf,terms=c("temp[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1,linetype="dashed")+
    my_theme_legend()+xlab("Temperature at planting site (ºC)")+
    ylab("Number of seeds per flower"),
  ggplot()+
    geom_point(data=data_transplants,aes(x=temp_diff,y=n_seeds_per_fl,color=year))+
    geom_ribbon(data=ggpredict(mod_seedsperfl_22_pollf,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#F8766D",alpha=0.2)+
    geom_line(data=ggpredict(mod_seedsperfl_22_pollf,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#F8766D",size=1)+
    geom_ribbon(data=ggpredict(mod_seedsperfl_23_pollf,terms=c("temp_diff[all]")),
                aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                fill="#00BFC4",alpha=0.2)+
    geom_line(data=ggpredict(mod_seedsperfl_23_pollf,terms=c("temp_diff[all]")),
              aes(x=x,y=predicted),color="#00BFC4",size=1,linetype="dashed")+
    my_theme_legend()+xlab("Temperature difference (ºC)")+
    ylab("Number of seeds per flower"),
  grid.arrange(
    ggplot()+
      geom_point(data=ggpredict(mod_seedsperfl_22_pollf,terms=c("poll_type[all]")),
                 aes(x=x,y=predicted),size=3)+
      geom_errorbar(data=ggpredict(mod_seedsperfl_22_pollf,terms=c("poll_type[all]")),
                    aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                    width=0.1)+
      my_theme()+xlab("Pollination type")+ylab("Number of seeds per flower")+
      ggtitle("2022"),
    ggplot()+
      geom_point(data=ggpredict(mod_seedsperfl_23_pollf,terms=c("poll_type")),
                 aes(x=x,y=predicted),size=3)+
      geom_errorbar(data=ggpredict(mod_seedsperfl_23_pollf,terms=c("poll_type")),
                    aes(x=x,y=predicted,ymin=conf.low,ymax=conf.high),
                    width=0.1)+
      my_theme()+xlab("Pollination type")+ylab("Number of seeds per flower")+
      ggtitle("2023"),
    ncol=2),
  ncol=3,nrow=1
)

ggsave(filename="output/figures/plot4.tiff",plot=plot4,device="tiff",width=40,height=10,units="cm",dpi=300)



