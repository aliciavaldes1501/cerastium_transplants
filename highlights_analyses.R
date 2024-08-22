# PREDICTION 1

# Genetic differentiation in plasticities (Prediction 4 in greenhouse paper)

# 2022: As predicted: differences in phenology between high and low 
# soil temperatures smaller for plants with fathers from warm soils 
# than for plants with fathers from colder soils. 
plot(ggpredict(model4_22_FFD,terms=c("temp_father","temp[quart]")))

# 2023: Opposite to predicted
plot(ggpredict(model4_23_FFD,terms=c("temp_mother","temp[quart]")))
plot(ggpredict(model4_23_LFD,terms=c("temp_mother","temp[quart]")))
plot(ggpredict(model4_23_MeanFD,terms=c("temp_mother","temp[quart]")))

# Similar results with mid-parental values

# PREDICTION 2

# Different effect of temperature on fitness in both years
plot(ggpredict(model_phensel_FFD_f,terms=c("temp","year")))
plot(ggpredict(model_phensel_LFD_f,terms=c("temp","year")))
plot(ggpredict(model_phensel_MeanFD_f,terms=c("temp","year")))

# Temperature-dependent selection in models with median h as condition trait
# in 2022, but direction opposite as expected
plot(ggpredict(model_phensel_22_FFD_h,terms=c("FFD_std","temp[quart]")))
plot(ggpredict(model_phensel_22_LFD_h,terms=c("LFD_std","temp[quart]")))
plot(ggpredict(model_phensel_22_MeanFD_h,terms=c("MeanFD_std","temp[quart]")))

# Temperature-dependent selection in models without condition trait
# in 2022, but direction opposite as expected
plot(ggpredict(model_phensel_22_FFD,terms=c("FFD_std","temp[quart]")))
plot(ggpredict(model_phensel_22_LFD,terms=c("LFD_std","temp[quart]")))
plot(ggpredict(model_phensel_22_MeanFD,terms=c("MeanFD_std","temp[quart]")))
