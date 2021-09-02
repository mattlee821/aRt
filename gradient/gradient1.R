# environment ====
rm(list=ls())
set.seed(821)
source("themes.R")
# packages ====
library(tidyverse)
library(poissoned)
library(gganimate)
## colours - https://mycolor.space/gradient

# data ====
data <- poisson_disc(ncols = 100, nrows = 100, cell_size = 1, k = 100, 
                    xinit = 40, yinit = 10, 
                    keep_idx = TRUE, keep_boundary = F, verbose = T) %>% arrange(idx)

# plot ====
ggplot(data) +
  geom_point(aes(x = x, y = y, color = idx), size = 6, stroke = 0, alpha = 0.8) +
  scale_color_gradientn(colors = c("#e2b396", "#edadb1", "#dfb0d4", "#babbeb", "#8dc7ec"), guide = "none") +
  theme_aRt("#212124") 
ggsave("gradient/gradient1.png", width = 1080, height = 1080, units = "px")

# animate ====
anim <-
  ggplot(data) +
  geom_point(aes(x = x, y = y, color = idx, group = idx), size = 8, stroke = 0, alpha = 0.8) +
  scale_color_gradientn(colors = c("#e2b396", "#edadb1", "#dfb0d4", "#babbeb", "#8dc7ec"), guide = "none") +
  theme_aRt("#212124") +
  transition_reveal(along = idx) +
  ease_aes("linear") +
  enter_grow() +
  enter_fade(alpha = 0.9) 
animate(anim, nframes = 100, fps = 10, duration = 5, end_pause = 4)
anim_save("gradient/gradient1.gif", animation = last_animation())
