data_transplants<-data_transplants%>%
  mutate(temp_diff_mother=abs(temp-temp_mother),
         temp_diff_father=abs(temp-temp_father))
hist(data_transplants$temp_diff_mother)
hist(data_transplants$temp_diff_father)

summary(glmmTMB(median_h~temp+temp_diff_mother+temp_diff_father+(1|plot),data_transplants))
summary(glmmTMB(median_h_log~temp+temp_diff_mother+temp_diff_father+(1|plot),data_transplants))
summary(glmmTMB(median_h_sqrt~temp+temp_diff_mother+temp_diff_father+(1|plot),data_transplants))

summary(glmmTMB(flowering_22~temp+temp_diff_mother+temp_diff_father+poll_type+(1|plot),data_transplants,family="binomial"))

summary(glmmTMB(tot_fl_bodies_corr~temp+temp_diff_mother+temp_diff_father+poll_type+(1|plot),
                data_transplants%>%
                  filter(flowering_22==1&tot_fl_bodies_corr>0),
                family="nbinom2"))
summary(glmmTMB(tot_fl_bodies_corr~temp+temp_diff_mother+temp_diff_father+median_h+
                  poll_type+(1|plot),
                data_transplants%>%
                  filter(flowering_22==1&tot_fl_bodies_corr>0),
                family="nbinom2"))

summary(glmmTMB(fruiting_22~temp+temp_diff_mother+temp_diff_father+(1|plot),data_transplants,
                family="binomial"))

summary(glmmTMB(n_tot_fr~temp+temp_diff_mother+temp_diff_father+poll_type+(1|plot),
                data_transplants%>%filter(flowering_22==1&tot_fl_bodies>0),
                family="nbinom2"))

summary(glmmTMB(fr_set_22~temp+temp_diff_mother+temp_diff_father+poll_type+(1|plot),
                weights=tot_fl_bodies_corr,
                data_transplants%>%
                  filter(flowering_22==1&tot_fl_bodies>0),
                family="binomial"))

summary(glmmTMB(n_tot_seed~temp+temp_diff_mother+temp_diff_father+poll_type+(1|plot),
                data_transplants%>%filter(fruiting_22==1),
                family="nbinom2"))

