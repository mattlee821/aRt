theme_aRt = function(bg_col){
  theme_void() +
    theme(
    plot.background = element_rect(fill = bg_col),
    panel.background = element_rect(fill = bg_col)
  )
}
