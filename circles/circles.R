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
data <- poisson_disc(ncols = 200, nrows = 200, cell_size = 1, k = 200, 
                    xinit = 0, yinit = 0, 
                    keep_idx = TRUE, keep_boundary = F, verbose = T) %>% arrange(idx)
data$alpha[data$y <= 20] <- 0
data$alpha[data$y > 20] <- 1

# plot ====
ggplot(data) +
  geom_point(aes(x = x, y = y, color = y), size = 0.75, stroke = 0, alpha = data$alpha) +
  scale_color_gradientn(colors = c("#e2b396", "#edadb1", "#dfb0d4", "#babbeb", "#8dc7ec"), guide = "none") +
  coord_polar() +
  theme_aRt("#212124") 
ggsave("circles/circle1.png", width = 1080, height = 1080, units = "px", dpi = 100)

# animate ====
anim <-
  ggplot(data) +
  geom_point(aes(x = x, y = y, color = y), size = 0.5, stroke = 0, alpha = data$alpha) +
  scale_color_gradientn(colors = c("#e2b396", "#edadb1", "#dfb0d4", "#babbeb", "#8dc7ec"), guide = "none") +
  coord_polar() +
  theme_aRt("#212124") +
  transition_reveal(along = x) +
  ease_aes("linear") +
  enter_grow() +
  enter_fade(alpha = 1) 
animate(anim, nframes = 100, fps = 20, duration = 5, end_pause = 0, rewind = F)
anim_save("circles/circle1_radar.gif", animation = last_animation())

anim <-
  ggplot(data) +
  geom_point(aes(x = x, y = y, color = y), size = 0.5, stroke = 0, alpha = data$alpha) +
  scale_color_gradientn(colors = c("#e2b396", "#edadb1", "#dfb0d4", "#babbeb", "#8dc7ec"), guide = "none") +
  coord_polar() +
  theme_aRt("#212124") +
  transition_reveal(along = y) +
  ease_aes("linear") +
  enter_grow() +
  enter_fade(alpha = 1) 
animate(anim, nframes = 100, fps = 20, duration = 5, end_pause = 0, rewind = T)
anim_save("circles/circle1_pulse.gif", animation = last_animation())



