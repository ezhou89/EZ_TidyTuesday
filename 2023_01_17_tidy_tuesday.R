## ----setup, include=FALSE-----------------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::purl()
library(tidyverse)
library(tidytuesdayR)



## ----Load, echo=FALSE---------------------------------------------------------------------------------------------------------------------------

tt <- tt_load("2023-01-17")



## ----Readme, eval = interactive()---------------------------------------------------------------------------------------------------------------

tt



## ----Glimpse------------------------------------------------------------------------------------------------------------------------------------

tt %>% 
  map(glimpse)



## ----Wrangle------------------------------------------------------------------------------------------------------------------------------------
# extract art data frame from the tidy tuesday list
arthistory <- tt$artists

# group dataframe by year and nationality
df <- arthistory %>%
  group_by(year, artist_nationality) %>%
  summarise(counts = n())




## ----Visualize----------------------------------------------------------------------------------------------------------------------------------
df %>%
  ggplot() + 
  aes(x = year, y = counts, color = artist_nationality) + 
  geom_point()


## -----------------------------------------------------------------------------------------------------------------------------------------------

# This will save your most recent plot
ggsave(
  filename = "My TidyTuesday Plot.png",
  device = "png")


