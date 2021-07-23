# devtools::install_github("marcusvolz/generative")
library(generative)
library(ggplot2)

# Set parameters (see generative::procedural_ring documentation for details)
seed <- 821
n <- 400
n_circles <- 4
r_0 <- 500
eps <- 500
eps_big <- 5000
p_defect <- 0.1
delta <- 2.02

# Generate data
df <- procedural_ring(seed, n, n_circles, r_0, eps, eps_big, p_defect, delta)

# Create plot
p <- ggplot() +
  geom_segment(aes(x, y, xend = xend, yend = yend), df, size = 0.025, alpha = 0.05) +
  coord_equal() +
  theme_void()

# Save plot (might take a while)
ggsave("img/procedural_ring.png", p, width = 20, height = 20, units = "cm")
