library(tidyverse)
library(lubridate)
library(WDI)
# Data
# https://datatopics.worldbank.org/world-development-indicators/
df_wdi <- WDI::WDI(country=c("PT", "BD"),
                   indicator=c(gdp_current_usd = "NY.GDP.MKTP.CD",
                               gdp_growth = "NY.GDP.MKTP.KD.ZG",
                               gdp_pcap_current_usd = "NY.GDP.PCAP.CD",
                               gdp_pcap_growth = "NY.GDP.PCAP.KD.ZG",
                               pop = "SP.POP.TOTL",
                               pop_growth = "SP.POP.GROW",
                               life_exp_total = "SP.DYN.LE00.IN",
                               life_exp_male = "SP.DYN.LE00.MA.IN",
                               life_exp_female = "SP.DYN.LE00.FE.IN",
                               fdi_current_usd = "BX.KLT.DINV.CD.WD",
                               remit_current_usd = "BX.TRF.PWKR.CD.DT",
                               export_current_usd = "NE.EXP.GNFS.CD",
                               export_growth = "NE.EXP.GNFS.KD.ZG",
                               import_current_usd = "NE.IMP.GNFS.CD",
                               import_growth = "NE.IMP.GNFS.KD.ZG"),
                   start = 1990,
                   end = 2020)
saveRDS(df_wdi, "data/wdi-1990-2020.RDS")