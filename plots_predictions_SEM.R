plot(ggpredict(glmmTMB(FFD_corr~temp+temp_diff+I(temp_diff^2)+
                         poll_type+(1|plot),
                       data_path_22_in_fl,family="gaussian"),
               terms=c("temp[all]")))+ggtitle(NULL)+
  xlab("Temperature at planting site (ºC)")+ylab("FFD (day of year)")+my_theme()
plot(ggpredict(glmmTMB(n_tot_seed~temp+temp_diff+temp_diff_sq+
                         poll_type+FFD_corr+(1|plot),
                       data_path_22_in_fl,family="nbinom2"),
               terms=c("temp_diff[all]")))+ggtitle(NULL)+
  xlab("Temperature difference (ºC)")+ylab("Fitness")+my_theme()
plot(ggpredict(glmmTMB(n_tot_seed~temp+temp_diff+temp_diff_sq+
                         poll_type+FFD_corr+(1|plot),
                       data_path_22_in_fl,family="nbinom2"),
               terms=c("FFD_corr[all]")))+ggtitle(NULL)+
  xlab("FFD (day of year)")+ylab("Fitness")+my_theme()

plot(ggpredict(glmmTMB(FFD_corr~temp+temp_diff+I(temp_diff^2)+
                         poll_type+(1|plot),
                       data_path_23_in_fl,family="gaussian"),
               terms=c("temp[all]")))+ggtitle(NULL)+
  xlab("Temperature at planting site (ºC)")+ylab("FFD (day of year)")+my_theme()
plot(ggpredict(glmmTMB(FFD_corr~temp+temp_diff+I(temp_diff^2)+
                         poll_type+(1|plot),
                       data_path_23_in_fl,family="gaussian"),
               terms=c("temp_diff[all]")))+ggtitle(NULL)+
  xlab("Temperature difference (ºC)")+ylab("FFD (day of year)")+my_theme()
plot(ggpredict(glmmTMB(n_tot_seed~temp+temp_diff+temp_diff_sq+
                         poll_type+FFD_corr+(1|plot),
                       data_path_23_in_fl,family="nbinom2"),
               terms=c("FFD_corr[all]")))+ggtitle(NULL)+
  xlab("FFD (day of year)")+ylab("Fitness")+my_theme()
