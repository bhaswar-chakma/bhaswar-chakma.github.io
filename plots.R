library(dplyr)
library(ggplot2)
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
         start=1990, end=2020)
#==============================================================================
# GDP
df_wdi %>% 
  select(year, country, gdp_current_usd) %>% 
  mutate(gdp = gdp_current_usd/1e9) %>%
  ggplot(aes(x = year, y = gdp, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "$ Billion", title = "GDP (current US$)") +
  theme(legend.title = element_blank())
# GDP Growth
df_wdi %>% 
  select(year, country, gdp_growth) %>% 
  ggplot(aes(x = year, y = gdp_growth, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "%", title = "GDP growth (annual %)") +
  theme(legend.title = element_blank())

# GDP Per Capita 
df_wdi %>% 
  select(year, country, gdp_pcap_current_usd) %>% 
  mutate(gdp_pcap = gdp_pcap_current_usd/1000) %>%
  ggplot(aes(x = year, y = gdp_pcap, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "$ Thousand", title = "GDP per capita (current US$)") +
  theme(legend.title = element_blank())

# GDP Per Capita Growth
df_wdi %>% 
  select(year, country, gdp_pcap_growth) %>% 
  ggplot(aes(x = year, y = gdp_pcap_growth, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "%", title = "GDP per capita growth (annual %)") +
  theme(legend.title = element_blank())

#==============================================================================
# Population
df_wdi %>% 
  select(year, country, pop) %>% 
  mutate(popm = pop/1e6) %>%
  ggplot(aes(x = year, y = popm, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "Million", title = "Population, total") +
  theme(legend.title = element_blank())

# Population Growth
df_wdi %>% 
  select(year, country, pop_growth) %>% 
  ggplot(aes(x = year, y = pop_growth, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "%", title = "Population growth (annual %)") +
  theme(legend.title = element_blank())

# Life Expectency Total
df_wdi %>% 
  ggplot(aes(x = year, y = life_exp_total, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "Age", title = "Life expectancy at birth, total (years)") +
  theme(legend.title = element_blank())

# Life Expectency Female
df_wdi %>% 
  ggplot(aes(x = year, y = life_exp_female, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "Age", title = "Life expectancy at birth, female (years)") +
  theme(legend.title = element_blank())

# Life Expectency Male
df_wdi %>% 
  ggplot(aes(x = year, y = life_exp_male, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "Age", title = "Life expectancy at birth, male (years)") +
  theme(legend.title = element_blank())
#==============================================================================
# FDI
df_wdi %>% 
  select(year, country, fdi_current_usd) %>% 
  mutate(fdi = fdi_current_usd/1e9) %>%
  ggplot(aes(x = year, y = fdi, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "$ Billion", title = "Foreign direct investment, net inflows (BoP, current US$)") +
  theme(legend.title = element_blank())
# Remit
df_wdi %>% 
  select(year, country, remit_current_usd) %>% 
  mutate(remit = remit_current_usd/1e9) %>%
  ggplot(aes(x = year, y = remit, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "$ Billion", title = "Personal remittances, received (current US$)") +
  theme(legend.title = element_blank())
#==============================================================================

# Export 
df_wdi %>% 
  select(year, country, export_current_usd) %>% 
  mutate(export = export_current_usd/1e9) %>%
  ggplot(aes(x = year, y = export, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "$ Billion", title = "Exports of goods and services (current US$)") +
  theme(legend.title = element_blank())

# Export Growth
df_wdi %>% 
  ggplot(aes(x = year, y = export_growth, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "%", title = "Exports of goods and services (annual % growth)") +
  theme(legend.title = element_blank())

# Import 
df_wdi %>% 
  select(year, country, import_current_usd) %>% 
  mutate(import = import_current_usd/1e9) %>%
  ggplot(aes(x = year, y = import, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "$ Billion", title = "Imports of goods and services (current US$)") +
  theme(legend.title = element_blank())

# Import Growth
df_wdi %>% 
  ggplot(aes(x = year, y = import_growth, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "%", title = "Imports of goods and services (annual % growth)") +
  theme(legend.title = element_blank())
