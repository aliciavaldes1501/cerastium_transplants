# 2 categories
data_transplants<-data_transplants%>%
  mutate(temp_diff_abs=abs(temp_diff),
         planted_in=factor(ifelse(temp_diff>0,"Warmer",ifelse(temp_diff<0,"Colder",NA))))
ggplot(data_transplants%>%filter(!is.na(planted_in)),aes(x=planted_in,y=temp))+geom_boxplot()
ggplot(data_transplants%>%filter(!is.na(planted_in)),aes(x=planted_in,y=temp_diff))+geom_boxplot()
ggplot(data_transplants%>%filter(!is.na(planted_in)),aes(x=planted_in,y=temp_diff_abs))+geom_boxplot()

summary(glmmTMB(surv~temp_diff_abs*planted_in+poll_type+(1|plot),
                data_transplants%>%filter(year==2022),family="binomial"))
summary(glmmTMB(surv~temp_diff_abs*planted_in+poll_type+(1|plot),
                data_transplants%>%filter(year==2023),family="binomial"))
plot(ggpredict(glmmTMB(surv~temp_diff_abs*planted_in+poll_type+(1|plot),
                       data_transplants%>%filter(year==2022),family="binomial"),
               terms=c("temp_diff_abs[all]","planted_in")))
plot(ggpredict(glmmTMB(surv~temp_diff_abs*planted_in+poll_type+(1|plot),
                       data_transplants%>%filter(year==2023),family="binomial"),
               terms=c("temp_diff_abs[all]","planted_in")))

summary(glmmTMB(flowering~temp_diff_abs*planted_in+poll_type+
                  (1|plot),data_transplants%>%filter(year==2022),
                family="binomial"))
summary(glmmTMB(flowering~temp_diff_abs*planted_in+poll_type+
                  (1|plot),data_transplants%>%filter(year==2023),
                family="binomial"))
plot(ggpredict(glmmTMB(flowering~temp_diff_abs*planted_in+poll_type+
                         (1|plot),data_transplants%>%filter(year==2022),
                       family="binomial"),terms=c("temp_diff_abs[all]","planted_in")))
plot(ggpredict(glmmTMB(flowering~temp_diff_abs*planted_in+poll_type+
                         (1|plot),data_transplants%>%filter(year==2023),
                       family="binomial"),terms=c("temp_diff_abs[all]","planted_in")))

summary(glmmTMB(fruiting~temp_diff_abs*planted_in+poll_type+ 
                  (1|plot),data_transplants%>%filter(year==2022),
                family="binomial"))
summary(glmmTMB(fruiting~temp_diff_abs*planted_in+poll_type+ 
                  (1|plot),data_transplants%>%filter(year==2023),
                family="binomial"))
plot(ggpredict(glmmTMB(fruiting~temp_diff_abs*planted_in+poll_type+ 
                         (1|plot),data_transplants%>%filter(year==2022),
                       family="binomial"),terms=c("temp_diff_abs[all]","planted_in")))
plot(ggpredict(glmmTMB(fruiting~temp_diff_abs*planted_in+poll_type+ 
                         (1|plot),data_transplants%>%filter(year==2023),
                       family="binomial"),terms=c("temp_diff_abs[all]","planted_in")))

summary(glmmTMB(n_tot_seed~temp_diff_abs*planted_in+poll_type+(1|plot),
                data_transplants%>%filter(year==2022&fruiting==1),
                family="nbinom2"))
summary(glmmTMB(n_tot_seed~temp_diff_abs*planted_in+poll_type+(1|plot),
                data_transplants%>%filter(year==2023&fruiting==1),
                family="nbinom2"))
plot(ggpredict(glmmTMB(n_tot_seed~temp_diff_abs*planted_in+poll_type+(1|plot),
                       data_transplants%>%filter(year==2022&fruiting==1),
                       family="nbinom2"),terms=c("temp_diff_abs","planted_in")))
plot(ggpredict(glmmTMB(n_tot_seed~temp_diff_abs*planted_in+poll_type+(1|plot),
                       data_transplants%>%filter(year==2023&fruiting==1),
                       family="nbinom2"),terms=c("temp_diff_abs","planted_in")))



