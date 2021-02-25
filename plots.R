library(dplyr)
library(ggplot2)
# Data
# https://datatopics.worldbank.org/world-development-indicators/
df_wdi <- WDI::WDI(country=c("PT", "BD"),
         indicator=c(gdp_current_usd = "NY.GDP.MKTP.CD",
                     gdp_growth = "NY.GDP.MKTP.KD.ZG",
                     pop = "SP.POP.TOTL",
                     pop_growth = "SP.POP.GROW",
                     fdi_current_usd = "BX.KLT.DINV.CD.WD",
                     remit_current_usd = "BX.TRF.PWKR.CD.DT"),
         start=1990, end=2020)

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
# FDI
df_wdi %>% 
  select(year, country, fdi_current_usd) %>% 
  mutate(fdi = fdi_current_usd/1e9) %>%
  ggplot(aes(x = year, y = fdi, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "$ Billion", title = "Foreign direct investment, net inflows (BoP, current US$)") +
  theme(legend.title = element_blank())
# FDI
df_wdi %>% 
  select(year, country, remit_current_usd) %>% 
  mutate(remit = remit_current_usd/1e9) %>%
  ggplot(aes(x = year, y = remit, color = country)) +
  geom_line(size = 1.5) +
  ggthemes::theme_economist() +
  labs(x = "Year", y = "$ Billion", title = "Personal remittances, received (current US$)") +
  theme(legend.title = element_blank())
